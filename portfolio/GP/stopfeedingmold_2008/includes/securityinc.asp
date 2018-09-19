<!-- #include virtual="/navincludes/securityinc.asp" --><%
Function SecurityCheck()
  
Dim StrStuff
Dim A
Dim SQL
Dim dll
Dim ErrorCode

StrStuff = request.servervariables("QUERY_STRING")
IF Trim(StrStuff) <> "" then
    A = InStr(1, ucase(StrStuff), "<SCRIPT", vbBinaryCompare)
    IF A <> 0 then
        '  "Bad Scripting word: Query Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), "%3CSCRIPT", vbBinaryCompare)
    IF A <> 0 then
        '  "Bad Scripting word: Query Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	

    A = InStr(1, ucase(StrStuff), "JAVASCRIPT:ALERT", vbBinaryCompare)    
    IF A <> 0 then
        '  "Bad Scripting word: Query Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query JAVAscript'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), "JAVASCRIPT%3AALERT", vbBinaryCompare)
    IF A <> 0 then
        '  "Bad Scripting word: Query Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    
        
    A = InStr(1, ucase(StrStuff), "CMDSHELL", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  Query cmdshell"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query cmdshell'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if 
    A = InStr(1, ucase(StrStuff), ";", vbBinaryCompare)
    IF A <> 0 then
        ' "Bad Scripting word:  Query ;"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query semi'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	
    A = InStr(1, ucase(StrStuff), "%3B", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  semi  ;"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query semi'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	
    
    A = InStr(1, ucase(StrStuff), "'", vbBinaryCompare)
    IF A <> 0 then
        ' "Bad Scripting word:  tick "
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query tick'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	
    A = InStr(1, ucase(StrStuff), "%27", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  tick "
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Query tick'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	    
    		
end if 

StrStuff = Request.Form
'Response.Write(StrStuff)
'Response.end
IF Trim(StrStuff) <> "" then

    A = InStr(1, ucase(StrStuff), "<SCRIPT", vbBinaryCompare)
    IF A <> 0 then
        '  Response.write "Bad Scripting word: from Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), "%3CSCRIPT", vbBinaryCompare)
    IF A <> 0 then
        '  Response.write "Bad Scripting word: from Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), "JAVASCRIPT:ALERT", vbBinaryCompare)    
    IF A <> 0 then
        '  "Bad Scripting word: from Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','From JAVAscript'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), "JAVASCRIPT%3AALERT", vbBinaryCompare)
    IF A <> 0 then
        '  "Bad Scripting word: form Script"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','From script'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)	
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if


	
    A = InStr(1, ucase(StrStuff), "CMDSHELL", vbBinaryCompare)
    IF A <> 0 then
    	' "Bad Scripting word:  Form cmdshell"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form cmdshell'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if
    A = InStr(1, ucase(StrStuff), ";", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  semi  ;"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form semi'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if		
    A = InStr(1, ucase(StrStuff), "%3B", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  semi  ;"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form semi'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if		

    A = InStr(1, ucase(StrStuff), "'", vbBinaryCompare)
    IF A <> 0 then
        ' "Bad Scripting word:  tick"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form tick'"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	
    A = InStr(1, ucase(StrStuff), "%27", vbBinaryCompare)
    IF A <> 0 then
	    ' "Bad Scripting word:  tick  ;"
	    Set dll = Server.CreateObject("gpcomreq.gpcomreqfun")		
		SQL = "sp_Security '" & Trim(Request.ServerVariables("REMOTE_ADDR")) & "','" & Request.ServerVariables("SCRIPT_NAME") & "','Form tick '"
		ErrorCode = dll.GPCOMSQLNoResult(SQL)		
        Response.redirect("http://www.gp.com/errormsg/404.html")
    end if	
	
end if 

End Function




Function SecurityTextReplace(Strtext)
  
	Strtext = Replace(Strtext,"<SCRIPT"," ",1,-1,1)
	Strtext = Replace(Strtext,"3CSCRIPT"," ",1,-1,1)
	Strtext = Replace(Strtext,"JAVASCRIPT:ALERT"," ",1,-1,1)
	Strtext = Replace(Strtext,"JAVASCRIPT%3AALERT"," ",1,-1,1)
	Strtext = Replace(Strtext,"CMDSHELL"," ",1,-1,1)
	Strtext = Replace(Strtext,";"," ",1,-1,1)
	Strtext = Replace(Strtext,"%3B"," ",1,-1,1)
	Strtext = Replace(Strtext,"CMDSHELL"," ",1,-1,1)
	Strtext = Replace(Strtext,"'"," ",1,-1,1)
	Strtext = Replace(Strtext,"%2C"," ",1,-1,1)
    		
    SecurityTextReplace = Strtext
    
End Function

%>