var updateChart = (function(){

  var id = '#dataJoinsSample',
  itemsInfo = d3.select('#dataJoinsInfo'),
  chart = d3.select(id),
  intervalTime = 2000,
  i = 0,
  bar,
  interval,
  barHeight = 20,
  max = 15,
  parentEl = d3.select('#dataJoinsSample').node().parentNode,
  width = 0; // updates on start()

  var lastDataLength = 0;

  var x = d3.scaleLinear();
  
  

  function getRandomNumber(max) {
      return Math.ceil(Math.random() * max);
  }

  function getRandomData(max, len){
    var arr = [];
    for (var i=0; i<len; i++) {
      arr.push( getRandomNumber(max) );
    }
    return arr;
  }

  function update() {
    i++;

    width = parentEl.clientWidth;
    
    var dataLength = getRandomNumber(max);
    var data = getRandomData(15, dataLength);
    var t = 3000;

    var formData = [];
    data.map(function(d){
      return +d;
    });

    // filter data
    data = data.filter(function(d) { 
      return d > 0; 
    });



    x.domain([0, d3.max(data)])
    .range([0, width]);

    bar = chart.selectAll('rect')
        .data(data);

    

    d3.select('#updateArray').text('[' + data.join(',') + ']');

    bar.enter()
        .append('rect')
        .style('fill', 'rgb(0,217,17)')
        .attr('width', 0)
        .attr('height', barHeight - 1)
        .attr('x', x(0))
        .attr('y', function(d, i) {
            return i * barHeight; })
        .transition()
        .attr('width', function(d) {
            return x(d); });

    bar.exit()
        .transition()
        .style('fill', '#ff5a00')
        .transition()
        .call(setRemovetext)
        // .delay(t/2)
        .remove();

    bar.transition()
        .attr('width', function(d) {
            return x(d); })
        .style('fill', '#777');


    itemsInfo.select('.data').text('data length: ' + dataLength);

    lastDataLength = dataLength;
    console.log('update' + i);

  };

  function setRemovetext(){
    if(bar.exit().size() > 0){
      itemsInfo.select('.exit').text('exit(): ' + bar.exit().size() + ' items will be removed');
    }else{
      itemsInfo.select('.exit').text('');
    }
  }

  function start(){
    width = parentEl.clientWidth;
    chart.html('')
    .attr('width', width)
    .attr('height', max * barHeight);

    interval = setInterval(update, intervalTime);
  }

  function stop(){
    console.log('joinChart interval stopped -----')
    clearInterval(interval);
  }

  return {
    start: start,
    stop: stop
  };

})();

