//****************************************************************************
//Copyright (C) Akamai Technologies, Inc. All Rights Reserved.
//****************************************************************************
import mx.utils.Delegate;
import mx.events.UIEvent;
[Event("onConnect")]
[Event("onError")]
[Event("onNetConnectionStatus")]
[Event("onNetStreamStatus")]
[Event("onNetStreamMetaData")]
[Event("onNetStreamCuePoint")]
[Event("onNetStreamPlayStatus")]
[Event("onStreamLength")]
[Event("onEndDetected")]
[Event("onId3Info")]
[Event("onBandwidthMeasurement")]
[Event("onUnsubscribe")]
[Event("onSubscribe")]
[Event("onLiveStreamRetry")]
class AkamaiConnection {
	// Declare functions
	private var dispatchEvent:Function;
	public var addEventListener:Function;
	public var removeEventListener:Function;
	// Decalre variables
	private var _hostName:String;
	private var _appName:String;
	private var _authParams:String;
	private var _detectBandwidth:Boolean = false;
	private var _isLive:Boolean = false;
	private var _port:String = "any";
	private var _protocol:String = "any";
	private var _createStream:Boolean = false;
	private var _maxBufferLength:Number = 5;
	private var _useFastStartBuffer:Boolean = false;
	private var _identXML:XML;
	private var _ip:String;
	private var _bandwidthInKbps:Number;
	private var _streamLength:Number;
	private var _nc:NetConnection;
	private var _ns:NetStream;
	private var _nsId3:NetStream;
	private var _aConnections:Array;
	private var _connectionInterval:Number;
	private var _liveStreamTimeoutInterval:Number;
	private var _liveStreamRetryInterval:Number;
	private var _liveFCSubscribeTimeoutInterval:Number;
	private var _timeoutInterval:Number;
	private var _connectionAttempt:Number;
	private var _firstSubscribeTime:Number;
	private var _aNC:Array = new Array();
	private var _pendingLiveStreamName:String;
	private var _aboutToStop:Boolean = false;
	private var _liveStreamTimeout:Number = 3600;
	private var _successfullySubscribed:Boolean = false;
	private var _playingLiveStream:Boolean = false;
	private var _isPaused:Boolean = false;
	private var _connectionAttemptInterval:Number;
	// Constants
	private var CONNECTION_TIMEOUT:Number = 10000;
	private var LIVE_RETRY_INTERVAL:Number = 30000;
	private var LIVE_ONFCSUBSCRIBE_TIMEOUT:Number = 60000;
	// Version
	private var VERSION:String = "2.0";
	// Constructor
	public function AkamaiConnection() {
		mx.events.EventDispatcher.initialize(this);
	}
	// Primary method for initiating a connection
	public function connect(hostName:String, detectBandwidth:Boolean, createStream:Boolean, maxBufferLength:Number, useFastStartBuffer:Boolean, isLive:Boolean, port:String, protocol:String, authParams:String):Void {
		// validate user-submitted parameters
		if (validate(hostName, detectBandwidth, createStream, maxBufferLength, useFastStartBuffer, isLive, port, protocol, authParams)) {
			_connectionAttemptInterval = _authParams == "" ? 200 : 350;
			getIP();
		}
	}
	// Plays content on the active netStream, if it exists 
	public function play(name:String, start:Number, len:Number, reset:Boolean):Void {
		if (_ns != undefined) {
			if (_isLive) {
				_pendingLiveStreamName = name;
				_playingLiveStream = true;
				_successfullySubscribed = false;
				startLiveStream();
			} else {
				// clear live events in case user is escaping a subscription
				// process  by playing an ondemand stream.
				clearInterval(_liveStreamTimeoutInterval);
				clearInterval(_liveStreamRetryInterval);
				_playingLiveStream = false;
				if (start != undefined && len != undefined && reset != undefined) {
					_ns.play(name, start, len, reset);
				} else if (start != undefined && len != undefined) {
					_ns.play(name, start, len);
				} else if (start != undefined) {
					_ns.play(name, start);
				} else {
					// we force the start parameter if it is not defined
					// in order to prompt the streamNotFound stream event
					// if the stream does not exist.
					_ns.play(name, 0);
				}
			}
		} else {
			this.dispatchEvent({type:"onError", target:this, errorNumber:1, description:"Cannot play since the netstream is not defined"});
		}
	}
	// Pauses the active netStream, if it exists 
	public function pause(flag:Boolean):Void {
		if (_ns != undefined) {
			_isPaused = flag;
			_ns.pause(flag);
		} else {
			this.dispatchEvent({type:"onError", target:this, errorNumber:2, description:"Cannot pause since the netstream is not defined"});
		}
	}
	// Seeks the active netStream, if it exists 
	public function seek(offset:Number):Void {
		if (_ns != undefined) {
			_ns.seek(offset);
		} else {
			this.dispatchEvent({type:"onError", target:this, errorNumber:3, description:"Cannot seek since the netstream is not defined"});
		}
	}
	// Initiates the server request for the streamlength (duration)of a file
	public function getStreamLength(filename:String):Boolean {
		if (_nc == undefined || _isLive || filename == undefined) {
			return false;
		} else {
			// note - FMS cannot handle name-value-pairs being appended to the filename
			// when requesting streamlength, so strip them off.
			if (filename.indexOf("?") != -1) {
				filename = filename.slice(0, filename.indexOf("?"));
			}
			_nc.call("getStreamLength", this, filename);
			return true;
		}
	}
	// Initiates the process of measuring the bandwidth of the netconnection
	public function getBandwidth():Boolean {
		if (_nc == undefined) {
			return false;
		} else {
			// the MAC player has a bug when detecting bandwidth on 
			// the 2.5 network, so always call the old bandwidth
			// detection metods when dealing with a MAC.
			if (getVersion().indexOf("MAC") != -1) {
				_nc.call("checkBandwidth");
			} else {
				// try the new bandwidth method first
				_nc.call("_checkbw");
			}
			return true;
		}
	}
	// Initiates the process to extract the id3 info from an mp3 file. Returns
	// false if the nc is not yet defined. The id3 info will be propagated via
	// the onId3Info event. 
	public function getMp3Id3Info(filename:String):Boolean {
		if (_nc == undefined) {
			return false;
		} else {
			if (_nsId3 == undefined) {
				_nsId3 = new NetStream(_nc);
				_nsId3.onId3 = Delegate.create(this, netStreamId3Handler);
			}
			if (filename.slice(0, 4) == "mp3:" || filename.slice(0, 4) == "id3:") {
				filename = filename.slice(4);
			}
			_nsId3.play("id3:"+filename);
			return true;
		}
	}
	// Returns the IP address of the server with which the connection
	// was established.
	public function get serverIPaddress():String {
		return _ip;
	}
	// Returns the bandwidth measured in kbps. This will only return a valid
	// value if connect() was called with detectbandwidth set to true.
	public function get bandwidthInKbps():Number {
		return _bandwidthInKbps;
	}
	// Returns the current buffer length of the stream. This will only return
	// a valid value if connect() was called with createStream set to true.
	public function get bufferLength():Number {
		return _ns.bufferLength;
	}
	// Returns the current time of the stream. This will only return a valid 
	// value if connect() was called with createStream set to true.
	public function get time():Number {
		return _ns.time;
	}
	// Returns the current fps of the stream. This will only return a valid 
	// value if connect() was called with createStream set to true.
	public function get currentFps():Number {
		return _ns.currentFps;
	}
	// Returns the port over which the connection was established.
	public function get port():String {
		return _port;
	}
	// Returns the protocol over which the connection was established.
	public function get protocol():String {
		return _protocol;
	}
	// Returns the version of this class.
	public function get version():String {
		return VERSION;
	}
	// Returns the max buffer length.
	public function get maxBufferLength():Number {
		return _maxBufferLength;
	}
	// Returns the isLive status.
	public function get isLive():Boolean {
		return _isLive;
	}
	// Sets the isLive status.
	public function set isLive(isLive:Boolean) {
		_isLive = isLive;
	}
	// Returns the live stream timeout value.
	public function get liveStreamTimeoutInterval():Number {
		return _liveStreamTimeout;
	}
	// Sets the live stream timeout value.
	public function set liveStreamTimeoutInterval(numOfSeconds:Number) {
		_liveStreamTimeout = numOfSeconds;
	}
	// Sets the max buffer length if the stream exists. This will over-ride
	// any value passed in during connect() with the maxBufferLength parameter.
	public function set maxBufferLength(bufferlength:Number) {
		if (_ns != undefined) {
			_maxBufferLength = bufferlength;
			_ns.setBufferTime(_maxBufferLength);
		}
	}
	// Returns whether fast start (dual buffer) is being used
	public function get useFastStartBuffer():Boolean {
		return _useFastStartBuffer;
	}
	// Sets whether fast start (dual buffer) is being used
	public function set useFastStartBuffer(use:Boolean) {
		_useFastStartBuffer = use;
		if (!use) {
			_ns.setBufferTime(_maxBufferLength);
		}
	}
	// Returns a reference to the active NetConnection object. This will
	// only return a valid reference if the connection was successfull.
	public function get netConnection():NetConnection {
		return _nc;
	}
	// Returns a reference to the active NetStream object. This will
	// only return a valid reference if connect() was called with 
	// createStream set to true.
	public function get netStream():NetStream {
		return _ns;
	}
	// handles the server response from a streamlength request
	public function onResult(streamLength:Number) {
		_streamLength = streamLength;
		this.dispatchEvent({type:"onStreamLength", target:this, streamLength:_streamLength});
	}
	// Closes the active NetStream and NetConnection
	public function close():Void {
		clearInterval(_connectionInterval);
		clearInterval(_timeoutInterval);
		unsubscribe();
		_ns.close();
		_nc.close();
	}
	// Unsubscribe from the active live netstream
	public function unsubscribe():Boolean {
		clearAllLiveIntervals();
		if (_successfullySubscribed) {
			_playingLiveStream = false;
			_ns.play(false);
			_nc.call("FCUnsubscribe", null, _pendingLiveStreamName);
			return true;
		} else {
			return false;
		}
	}
	// initiates retrieving xml data from the Akamai ident function
	private function getIP():Void {
		_identXML = new XML();
		_identXML.ignoreWhite = true;
		_identXML.onLoad = Delegate.create(this, identHandler);
		_identXML.load("http://"+_hostName+"/fcs/ident");
	}
	// Handles the response of the ident function
	private function identHandler(success:Boolean):Void {
		if (success) {
			if (_identXML.firstChild.firstChild.nodeName != "ip") {
				this.dispatchEvent({type:"onError", target:this, errorNumber:4, description:"Invalid xml returned by Akamai IDENT"});
			} else {
				_ip = _identXML.firstChild.firstChild.firstChild.toString();
				buildConnectionSequence();
			}
		} else {
			this.dispatchEvent({type:"onError", target:this, errorNumber:5, description:"No xml returned by Akamai IDENT"});
		}
	}
	// Builds an array of connection strings and starts connecting
	private function buildConnectionSequence():Void {
		var aPortProtocol:Array = buildPortProtocolSequence();
		_aConnections = new Array();
		for (var a:Number = 0; a<aPortProtocol.length; a++) {
			var connectionObject:Object = new Object();
			var address:String = aPortProtocol[a].protocol+"://"+_ip+":"+aPortProtocol[a].port+"/"+_appName+"?_fcs_vhost="+_hostName+(_authParams == "" ? "" : "&"+_authParams);
			connectionObject.address = address;
			connectionObject.port = aPortProtocol[a].port;
			connectionObject.protocol = aPortProtocol[a].protocol;
			_aConnections.push(connectionObject);
		}
		_timeoutInterval = setInterval(Delegate.create(this, masterTimeout), CONNECTION_TIMEOUT);
		_connectionAttempt = 0;
		tryToConnect(_aConnections);
		_connectionInterval = setInterval(Delegate.create(this, tryToConnect), _connectionAttemptInterval, _aConnections);
	}
	// Attempts to connect to FMS using a particular connection string
	function tryToConnect(_aConnections) {
		if (_connectionAttempt>=_aConnections.length) {
			clearInterval(_connectionInterval);
		} else {
			_aNC[_connectionAttempt] = new NetConnection();
			_aNC[_connectionAttempt].index = _connectionAttempt;
			_aNC[_connectionAttempt].expectBWDone = false;
			_aNC[_connectionAttempt].port = _aConnections[_connectionAttempt].port;
			_aNC[_connectionAttempt].protocol = _aConnections[_connectionAttempt].protocol;
			// bandwidth detection methods for FCS 1.7
			_aNC[_connectionAttempt].payload = 0;
			_aNC[_connectionAttempt].onBWCheck = function(p_payload) {
				return ++this.payload;
			};
			_aNC[_connectionAttempt].onBWDone = function(bandwidthInKbps) {
				if (bandwidthInKbps != undefined) {
					this.owner._bandwidthInKbps = bandwidthInKbps;
					this.owner.dispatchEvent({type:"onBandwidthMeasurement", target:this.owner, bandwidthInKbps:bandwidthInKbps, latency:undefined});
				}
			};
			// bandwidth detection methods for FMS 2.5
			_aNC[_connectionAttempt]._onbwcheck = function(data, ctx) {
				return ctx;
			};
			_aNC[_connectionAttempt]._onbwdone = function(latency, bandwidthInKbps) {
				this.owner._bandwidthInKbps = bandwidthInKbps;
				this.owner.dispatchEvent({type:"onBandwidthMeasurement", target:this.owner, bandwidthInKbps:bandwidthInKbps, latency:latency});
			};
			_aNC[_connectionAttempt].onFCSubscribe = function(info) {
				switch (info.code) {
				case "NetStream.Play.Start" :
					this.owner.clearAllLiveIntervals();
					this.owner._successfullySubscribed = true;
					this.owner.dispatchEvent({type:"onSubscribe", target:this.owner, name:this.owner._pendingLiveStreamName});
					this.owner._ns.play(this.owner._pendingLiveStreamName);
					if (this.owner._isPaused) {
						this.owner._ns.pause(true);
					}
					break;
				case "NetStream.Play.StreamNotFound" :
					// Stream not found, so try again in 30s
					this.owner.setupFCSubscribeInterval();
					break;
				}
			};
			_aNC[_connectionAttempt].onFCUnsubscribe = function(info) {
				if (info.code == "NetStream.Play.Stop") {
					this._owner._successfullySubscribed = false;
					this.owner.dispatchEvent({type:"onUnsubscribe", target:this.owner, name:this.owner._pendingLiveStreamName});
					if (this.owner._playingLiveStream) {
						this.owner.startLiveStream();
					}
				}
			};
			_aNC[_connectionAttempt].owner = this;
			_aNC[_connectionAttempt].onStatus = function(info) {
				if (this.owner._nc != undefined) {
					this.owner.dispatchEvent({type:"onNetConnectionStatus", target:this.owner, info:info});
				}
				if (info.code == "NetConnection.Connect.Rejected") {
					this.owner.handleRejection();
				}
				if (info.code == "NetConnection.Call.Failed") {
					// the newer bandwidth method does not exist, so try
					// the old one. 
					if (info.description.indexOf("_checkbw") != -1) {
						//this.expectBWDone = true;
						this.call("checkBandwidth");
					}
				}
				if (info.code == "NetConnection.Connect.Success") {
					clearInterval(this.owner._connectionInterval);
					clearInterval(this.owner._timeoutInterval);
					for (var i = 0; i<this.owner._aNC.length; i++) {
						if (i != this.index) {
							this.owner._aNC[i].close();
							this.owner._aNC[i].onStatus = null;
							this.owner._aNC[i] = null;
							delete this.owner._aNC[i];
						}
					}
					this.owner._nc = this;
					if (this.owner._detectBandwidth) {
						this.owner.getBandwidth();
					}
					if (this.owner._createStream) {
						this.owner.createStream(this);
					} else {
						this.owner.handleGoodConnect(this);
					}
				}
			};
			_aNC[_connectionAttempt].connect(_aConnections[_connectionAttempt].address);
			_connectionAttempt++;
			if (_connectionAttempt>=_aConnections.length) {
				clearInterval(_connectionInterval);
			}
		}
	}
	// Catches the master timeout when no connections have succeeded
	// within CONNECTION_TIMEOUT.
	private function masterTimeout() {
		clearInterval(_timeoutInterval);
		for (var i = 0; i<_aNC.length; i++) {
			_aNC[i].close();
			_aNC[i].onStatus = null;
			_aNC[i] = null;
			delete _aNC[i];
		}
		this.dispatchEvent({type:"onError", target:this, errorNumber:6, description:"Timed out while trying to connect"});
	}
	// Handles the case when a server rejects a connection due to incorrect auth 
	// parameters.
	private function handleRejection() {
		clearInterval(_connectionInterval);
		clearInterval(_timeoutInterval);
		for (var i = 0; i<_aNC.length; i++) {
			_aNC[i].close();
			_aNC[i].onStatus = null;
			_aNC[i] = null;
			delete _aNC[i];
		}
		this.dispatchEvent({type:"onError", target:this, errorNumber:15, description:"Connection attempt rejected by server"});
		this.dispatchEvent({type:"onError", target:this, errorNumber:6, description:"Timed out while trying to connect"});
	}
	// Catches the timeout when a live stream has been requested but cannot
	// be found on the server. This function is only called if the user called
	// liveStreamTimeoutInterval(val) before calling play() for their live
	// stream. 
	private function liveStreamTimeout() {
		clearAllLiveIntervals();
		this.dispatchEvent({type:"onError", target:this, errorNumber:7, description:"Timed out looking for the live stream on the server"});
	}
	// Handles a successfull connection
	private function handleGoodConnect(nc:NetConnection) {
		_nc = nc;
		_port = nc.port;
		_protocol = nc.protocol;
		this.dispatchEvent({type:"onConnect", target:this, nc:_nc, ns:_ns});
	}
	// Creates NetStream
	private function createStream(nc:NetConnection):Void {
		_ns = new NetStream(nc);
		_ns.setBufferTime(_useFastStartBuffer ? 0.1 : _maxBufferLength);
		_ns.onStatus = Delegate.create(this, netStreamOnStatusHandler);
		_ns.onPlayStatus = Delegate.create(this, netStreamOnPlayStatusHandler);
		_ns.onMetaData = Delegate.create(this, netStreamOnMetaDataHandler);
		_ns.onCuePoint = Delegate.create(this, netStreamCuePointHandler);
		handleGoodConnect(nc);
	}
	// Handles the netstream onstatus events
	private function netStreamOnStatusHandler(info:Object):Void {
		if (_useFastStartBuffer) {
			if (info.code == "NetStream.Play.Start" || info.code == "NetStream.Buffer.Empty") {
				_ns.setBufferTime(0.1);
			}
			if (info.code == "NetStream.Buffer.Full") {
				_ns.setBufferTime(_maxBufferLength);
			}
		}
		this.dispatchEvent({type:"onNetStreamStatus", target:this, info:info});
		if (info.code == "NetStream.Play.Start") {
			_aboutToStop = false;
		}
		if (info.code == "NetStream.Play.Stop") {
			_aboutToStop = true;
		}
		if (info.code == "NetStream.Buffer.Empty") {
			if (_aboutToStop) {
				_aboutToStop = false;
				handleEnd();
			}
		}
		if (info.code == "NetStream.Play.StreamNotFound") {
			this.dispatchEvent({type:"onError", target:this, errorNumber:12, description:"Stream not found"});
		}
	}
	// handles the detection of the end of a stream
	private function handleEnd():Void {
		this.dispatchEvent({type:"onEndDetected", target:this});
	}
	// Handles the netstream onPlayStatus events. Note that these events are
	// only thrown by FMS2 servers. Check to see if your Akamai account is
	// serviced by FMS2 or FCS1.7 servers.
	private function netStreamOnPlayStatusHandler(info:Object):Void {
		this.dispatchEvent({type:"onNetStreamPlayStatus", target:this, info:info});
	}
	// Handles the netstream onMetData events. 
	private function netStreamOnMetaDataHandler(info:Object):Void {
		this.dispatchEvent({type:"onNetStreamMetaData", target:this, info:info});
	}
	// Handles the netstream onMetData events. 
	private function netStreamCuePointHandler(info:Object):Void {
		this.dispatchEvent({type:"onNetStreamCuePoint", target:this, info:info});
	}
	// Handles the netstream onId3 events
	private function netStreamId3Handler(info:Object):Void {
		this.dispatchEvent({type:"onId3Info", target:this, info:info});
	}
	// Assembles the array of ports and protocols to be attempted
	private function buildPortProtocolSequence():Array {
		var aTemp:Array = new Array();
		if ((_port == "any" || _port == "1935") && (_protocol == "any" || _protocol == "rtmp")) {
			aTemp.push({port:"1935", protocol:"rtmp"});
		}
		if ((_port == "any" || _port == "80") && (_protocol == "any" || _protocol == "rtmp")) {
			aTemp.push({port:"80", protocol:"rtmp"});
		}
		if ((_port == "any" || _port == "443") && (_protocol == "any" || _protocol == "rtmp")) {
			aTemp.push({port:"443", protocol:"rtmp"});
		}
		if ((_port == "any" || _port == "80") && (_protocol == "any" || _protocol == "rtmpt")) {
			aTemp.push({port:"80", protocol:"rtmpt"});
		}
		if ((_port == "any" || _port == "1935") && (_protocol == "any" || _protocol == "rtmpt")) {
			aTemp.push({port:"1935", protocol:"rtmpt"});
		}
		if ((_port == "any" || _port == "443") && (_protocol == "any" || _protocol == "rtmpt")) {
			aTemp.push({port:"443", protocol:"rtmpt"});
		}
		return aTemp;
	}
	// Validates input parameters for value and type and assigns local variables
	private function validate(hostName:String, detectBandwidth:Boolean, createStream:Boolean, maxBufferLength:Number, useFastStartBuffer:Boolean, isLive:Boolean, port:String, protocol:String, authParams:String):Boolean {
		_authParams = authParams == undefined ? "" : authParams;
		if (isLive != undefined) {
			_isLive = isLive;
		}
		if (hostName == undefined || hostName.length == 0) {
			this.dispatchEvent({type:"onError", target:this, errorNumber:8, description:"Invalid hostName parameter"});
			return false;
		} else {
			if (hostName.indexOf("/") == -1) {
				// assume that only the hostname and not the hostname/app is being passed
				_hostName = hostName;
				_appName = _isLive ? "live" : "ondemand";
			} else {
				_hostName = hostName.slice(0, hostName.lastIndexOf("/"));
				_appName = hostName.slice(hostName.lastIndexOf("/")+1, hostName.length);
				if (_appName.length == 0) {
					this.dispatchEvent({type:"onError", target:this, errorNumber:13, description:"Invalid application name parsed from hostname"});
					return false;
				}
			}
		}
		if (detectBandwidth != undefined) {
			_detectBandwidth = detectBandwidth;
		}
		if (createStream != undefined) {
			_createStream = createStream;
		}
		if (maxBufferLength != undefined) {
			if (isNaN(maxBufferLength) || maxBufferLength<0.1) {
				this.dispatchEvent({type:"onError", target:this, errorNumber:9, description:"Invalid maxBufferLength parameter"});
				return false;
			} else {
				_maxBufferLength = maxBufferLength;
			}
		}
		if (useFastStartBuffer != undefined) {
			_useFastStartBuffer = useFastStartBuffer;
		}
		if (port != undefined) {
			if (!(port == "any" || port == "1935" || port == "80" || port == "443")) {
				this.dispatchEvent({type:"onError", target:this, errorNumber:10, description:"Invalid port parameter"});
				return false;
			} else {
				_port = port;
			}
		}
		if (protocol != undefined) {
			if (!(protocol == "any" || protocol == "rtmp" || protocol == "rtmpt")) {
				this.dispatchEvent({type:"onError", target:this, errorNumber:11, description:"Invalid protocol parameter"});
				return false;
			} else {
				_protocol = protocol;
			}
		}
		return true;
	}
	// Sets intervals for checking if a live stream exists
	private function startLiveStream() {
		clearAllLiveIntervals();
		_firstSubscribeTime = getTimer();
		_liveStreamTimeoutInterval = setInterval(Delegate.create(this, liveStreamTimeout), _liveStreamTimeout*1000);
		fcsubscribe();
	}
	// Setup the next call to fcsubscribe.
	private function setupFCSubscribeInterval() {
		clearInterval(_liveStreamRetryInterval);
		_liveStreamRetryInterval = setInterval(Delegate.create(this, fcsubscribe), LIVE_RETRY_INTERVAL);
	}
	// Calls FCsubscribe on the netconnection
	private function fcsubscribe() {
		_nc.call("FCSubscribe", null, _pendingLiveStreamName);
		clearInterval(_liveFCSubscribeTimeoutInterval);
		_liveFCSubscribeTimeoutInterval = setInterval(Delegate.create(this, liveFCSubscribeTimeOut), LIVE_ONFCSUBSCRIBE_TIMEOUT);
		this.dispatchEvent({type:"onLiveStreamRetry", target:this, name:_pendingLiveStreamName, secondsUntilTimeout:(_liveStreamTimeout-Math.round((getTimer()-_firstSubscribeTime)/1000))});
	}
	//Handles a non-responsive FCSubscribe method on the server
	private function liveFCSubscribeTimeOut() {
		clearAllLiveIntervals();
		this.dispatchEvent({type:"onError", target:this, errorNumber:14, description:"Network failure - unable to play the live stream"});
	}
	// Utility function to clear all the various timeout intervals for live 
	// streams
	private function clearAllLiveIntervals() {
		clearInterval(_liveStreamTimeoutInterval);
		clearInterval(_liveStreamRetryInterval);
		clearInterval(_liveFCSubscribeTimeoutInterval);
	}
}
