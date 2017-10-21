<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/ADOVBS.inc"-->	
<title>Amicus</title>

<link rel="stylesheet" type="text/css" href="page.css">
<script type="text/javascript" src="bodymovin.min.js"></script>
<script type="text/javascript">
function clickclear(thisfield, defaulttext) {
if (thisfield.value == defaulttext) {
thisfield.value = "";
}
}
function clickrecall(thisfield, defaulttext) {
if (thisfield.value == "") {
thisfield.value = defaulttext;
}
}
</script>

</head>

<body>
	
	<div style="width: 350px; height: 350px; background-color: transparent;" id="bodymovin"></div>

	<span class="pageTitle">ASCDC Amicus Database</span>
	<form action="amicus.asp" method="post" name="KeywordSearch">
		<input type="image" src="images/search.png"  onmouseover="this.src = 'images/search_over.png';" onmouseout="this.src = 'images/search.png';" class="search-btn"/>
		<div id="amicussearch">
			<input type="text" id="amicussearchfield" name="amicussearchfield" size="35" onClick="clickclear(this, 'keyword search')" onBlur="clickrecall(this,'keyword search')" value="<%If Request("amicussearchfield") = "" Then%>keyword search<%Else%><%=Request("amicussearchfield")%><%End If%>">
		</div>
		<div id="radio-btn" align="Center">
			Keyword Search:
		<input type="hidden" name="varKeyword" value="1">
		<input type="hidden" name="SearchType" value="1">
	</form>
	<p class="alignLeft">
		Our <a href="http://ascdc.org/Amicus_Committee.asp">Amicus Committee</a> works hard on behalf of ASCDC members, submitting multiple amicus curiae briefs and letters each year in cases pending in state and federal courts. The Committee supports selected petitions seeking California Supreme Court review, and identifies appropriate cases in which to request publication of unpublished California appellate opinions that are of interest to our members. 
		
		<br><br>If you have a matter that you wish to bring to the attention of the <a href="http://ascdc.org/Amicus_Committee.asp">Amicus Committee</a>, please contact the Chair, Steven Fleischman at Horvitz & Levy, (818) 995-0800 or <a href="mailto:sfleischman@horvitzlevy.com">sfleischman@horvitzlevy.com</a>.
		
		<br><br>Below are links to briefs and letters the Committee has filed since 2000, compiled in a searchable database.
	</p>
													
<%
'Open The Database Connection
DataConnName = "ascdcsecure"
Set My = Server.CreateObject("ADODB.Connection")
My.ConnectionTimeout = Application(DataConnName & "_ConnectionTimeout")
My.CommandTimeout = Application(DataConnName & "_CommandTimeout")
My.Open Application(DataConnName & "_ConnectionString"), Application(DataConnName & "_RuntimeUserName"), Application(DataConnName & "_RuntimePassword")
If request("varKeyword") = 1 Then
	NumPerPage = 50
Else
	NumPerPage = 50
End If
If Request("NumPerPage") <> 0 Then
	NumPerPage = Int(Request("NumPerPage"))
Else
	If request("varKeyword") = 1 Then
		NumPerPage = 50
	Else
		NumPerPage = 50
	End If
End If

'Get All Records
Set rsSearch = Server.CreateObject("ADODB.Recordset")

'Response.write("<P>" & Request("SearchType"))

If Request("varKeyword") = 1 Then
		'build array of keywords submitted
		My_Array=split(Request("amicussearchfield")," ")
		'Count Array
		varItemCount = 0
		For Each item In My_Array
			varItemCount = varItemCount + 1
		Next
		SQLUpdate = "SELECT * FROM tbl_Amicus WHERE "
		varItemOn = 0
		For Each item In My_Array
			'Response.Write("<br>" & item & "<br>")
			varItemOn = varItemOn + 1
			If Request("SearchType") = 1 Then
				If Not varItemOn = varItemCount Then
					SQLUpdate = SQLUpdate & "AM_Title Like '%" & item & "%'"
					SQLUpdate = SQLUpdate & " OR AM_Description Like '%" & item & "%' OR "
				Else
					SQLUpdate = SQLUpdate & "AM_Title Like '%" & item & "%'"
					SQLUpdate = SQLUpdate & " OR AM_Description Like '%" & item & "%'"
				End If
			Else
				If Not varItemOn = varItemCount Then
					SQLUpdate = SQLUpdate & " CONTAINS(AM_Title, '" & item & "')"
					SQLUpdate = SQLUpdate & " OR CONTAINS(AM_Description, '" & item & "') OR "
				Else
					SQLUpdate = SQLUpdate & "CONTAINS(AM_Title, '" & item & "')"
					SQLUpdate = SQLUpdate & " OR CONTAINS(AM_Description, '" & item & "')"
				End If
			End If
		Next
		SQLUpdate = SQLUpdate & " ORDER BY OP_Date DESC;"
		'Response.write("<P>" & SQLUpdate)
Else
	SQLUpdate = "SELECT * FROM tbl_Amicus ORDER BY OP_Date DESC;"
End If
	
	
	
'response.write(SQLUpdate)
rsSearch.Open SQLUpdate, My, adOpenKeyset, adLockreadonly

If Request.QueryString("page") = "" Then
    CurrentPage = 1 'We're On the first page
	NumPerPageOf = 1
Else
    CurrentPage = CInt(Request.QueryString("page"))
	NumPerPageOf = ((CurrentPage * NumPerPage) - NumPerPage) + 1
End if

Number = rsSearch.RecordCount

If Not rsSearch.EOF Then
	rsSearch.MoveFirst
	rsSearch.PageSize = NumPerPage
    TotalPages = rsSearch.PageCount
    rsSearch.AbsolutePage = CurrentPage
End if

ScriptName = request.servervariables("ScriptName")
cs = 1

If rsSearch.EOF Then
	Response.Write"Sorry, there are no records available that match that keyword search!"
Else
	varExtra = ""
	If request("varKeyword") = 1 Then
    	varExtra=" (<a href=""amicus.asp""><font size=""-1""><strong>Return to browse all records...</strong></font></a>)"
    End If
    Response.Write "<div id=""amicuspages"">Showing page <strong>" & CurrentPage & "</strong> of <strong>" & TotalPages & "</strong>: Total Records: <strong>" & Number & "</strong>" & varExtra & "<p></div>"


    While Not rsSearch.EOF and Count < rsSearch.PageSize
    	count = count + 1
		If Not rsSearch.eof Then
%>
		<div id="amicuswrapper">
			<div id="amicusTitle"><%=rsSearch("AM_Title")%></div>
			<div id="amicusYear">(<%=rsSearch("AM_Year")%>)</div>
        <%
			'Count Docs
			DocsCountSQLQuery = "SELECT * FROM tbl_AM_DOC WHERE AMICUS_ID = " & rsSearch("AMICUS_ID") & ";"
			Set rsDocsCount = My.Execute(DocsCountSQLQuery)
			If Not rsDocsCount.EOF Then
				varDocCount = 0
				Do While Not rsDocsCount.EOF
					varDocCount = varDocCount + 1
					rsDocsCount.MoveNext
				Loop
				varTotalDocCount = varDocCount
			Else
				varDocCount = 0
			End If		
			'Get Docs
			DocsSQLQuery = "SELECT * FROM tbl_AM_DOC WHERE AMICUS_ID = " & rsSearch("AMICUS_ID") & ";"
			Set rsDocs = My.Execute(DocsSQLQuery)
			If Not rsDocs.EOF Then
				varDocsCount = 0
				varDocsString = "<div id='AmicusDoc'>"
				varDocsStringCO = ""
				varDocsStringCA = ""
				varDocsStringSC = ""
				Do While Not rsDocs.EOF
					'We Found A Doc or Two
					varSkipLink = 0
					varDocsCount = varDocsCount + 1
					'response.write("Count:" &  varDocsCount & " | ID: " & rsDocs("DOCS_ID") & " | CourtOpinion: " & rsDocs("flg_Court_Opinion"))
					'Build String To Write Out So order of docs shows Court Opinion first, Court of Appeal Online Docket second and Supreme Court Online docket last.
					If rsDocs("AM_DOC_FILE") = "" Then
						'Response.write("No File, ")
						varSkipLink = 1
					End If
					If varSkipLink = 0 Then
						varFullURL=InStr(rsDocs("AM_DOC_FILE"),"http")
						If varFullURL = 1 Then
							varPath = "" & rsDocs("AM_DOC_FILE")
						Else
							varPath = "/_Amicus/Docs/" & rsDocs("AM_DOC_FILE")
						End If
						If rsDocs("flg_Court_Opinion") = True Then
							varDocsStringCO = varDocsStringCO & "<a href='" & varPath & "' target='_blank'>" & rsDocs("AM_DOC_TITLE") & "</a>, "
						End If
						'response.write("<P>" & varDocSTringCO)
						If rsDocs("flg_Court_of_Appeal_docket") = True Then
							varDocsStringCA = varDocsStringCA & "<a href='" & varPath & "' target='_blank'>" & rsDocs("AM_DOC_TITLE") & "</a>, "
						End If
						If rsDocs("flg_Supreme_Court_docket") = True Then
							varDocsStringSC = varDocsStringSC & "<a href='" & varPath & "' target='_blank'>" & rsDocs("AM_DOC_TITLE") & "</a>, "
						End If
					Else
						varDocsString = varDocsString & rsDocs("AM_DOC_TITLE") & ", "
					End If
					rsDocs.MoveNext
				Loop
				varDocsString = varDocsString & varDocsStringCO & varDocsStringCA & varDocsStringSC & "</div>"
				Response.write(varDocsString)
			Else
				'No Docs Found
%>
            <div id="amicusDoc"></div>
<%
	End If
%>
            <div id="amicusDescription"><%=rsSearch("AM_Description")%></div>
<%
			'Get Updates
			UpdatesSQLQuery = "SELECT * FROM tbl_AM_UPDATE WHERE AMICUS_ID = " & rsSearch("AMICUS_ID") & " ORDER BY AM_UPDATE_DATE;"
			Set rsUpdates = My.Execute(UpdatesSQLQuery)
			If Not rsUpdates.EOF Then
				Do While Not rsUpdates.EOF
					'We Found An Update or Two
						varFullURL=InStr(rsUpdates("AM_UPDATE_FILE"),"http://")
						If varFullURL = 1 Then
							varPath = "" & rsUpdates("AM_UPDATE_FILE")
						Else
							varPath = "/_Amicus/Updates/" & rsUpdates("AM_UPDATE_FILE")
						End If
%>
					<div id="AmicusUpdateDate"><%=rsUpdates("AM_UPDATE_DATE")%></div>
					<div id="AmicusUpdate"><%If Not rsUpdates("AM_UPDATE_FILE") = "" Then%><a href="<%=varPath%>" target="_blank"><%End If%><%=rsUpdates("AM_UPDATE_TITLE")%><%If Not rsUpdates("AM_UPDATE_FILE") = "" Then%></a><%End If%></div>
<%
					rsUpdates.MoveNext
				Loop
			Else
				'No Updates Found
%>
				<div id="AmicusUpdate"></div>
<%
			End If

%>
			</div>
<%
			rsSearch.MOVENEXT
        End If
	wend
%>


<% 
    If Not CurrentPage = 1 Then
    	Response.Write "<A href='" & ScriptName & "?NumPerPage=" & NumPerPage & "&amp;page=" & CurrentPage - 1 & "'><font size=1 face=Verdana><strong><</strong></font></A>  "
    	If CurrentPage > 5 and TotalPages > 10 Then
    		Response.write("<A href=" & ScriptName & "?NumPerPage=" & NumPerPage & "&page=1><font size=1 face=Verdana><strong>1</strong></font></A>" & "<font size=1 face=Verdana><strong>&nbsp;<<&nbsp;</strong> </font>" )
    	End if
    	If TotalPages > 10 Then
    		If CurrentPage > 5 Then
    			If TotalPages > (CurrentPage + 5) Then
    				ini = (CurrentPage - 4)
    				fim = (CurrentPage + 5)
    			Else
    			ini = (TotalPages - 9)
    			fim = TotalPages
    		End if 
    	Else
    		ini = 1
    		fim = 10
    	End If
    	
    else
    ini=1
    fim = TotalPages
    End if
    For a = ini To fim
    if a = Cint(request("page")) Then
    Response.write( "" & a & "  ")
    Else
    Response.write("<A href=" & ScriptName & "?NumPerPage=" & NumPerPage & "&amp;page=" & a &"><font size=1 face=Verdana><strong>" & a & "</strong></font></A>" & "  " )
    End if
    Next
    Else
    	if TotalPages = 1 Then 
    			Response.write ""
    		Else
    			Response.Write "<font face=Verdana size=3><strong>1</strong></font>  "
    	End if
    	if TotalPages > 10 Then     'id=161&MWC=Layouts
    	fim = 10
    	Else
    	fim = TotalPages
    	End if
    	For a = 2 To fim
    If a = Cint(request("page")) Then
    Response.write( "<font face=Verdana size=3><strong>" & a & "</strong></font>  ")
    Else
    Response.write("<A href=" & ScriptName & "?NumPerPage=" & NumPerPage & "&amp;page=" & a &"><font size=1 face=Verdana><strong>" & a & "</strong></font></A>" & "  " )
    End If
    Next
    End If
    If CurrentPage < TotalPages - 5 and TotalPages > 10 Then
    	Response.write("<font size=1 face=Verdana><strong>&nbsp;>>&nbsp;</strong></font><A href=" & ScriptName & "?NumPerPage=" & NumPerPage & "&amp;page=" & TotalPages &"><font size=1 face=Verdana><strong>" & TotalPages & "</strong></font></A>" & "  " )
    End If
	
	
 
    'Display NEXT page link, if appropriate
    if Not CurrentPage = TotalPages Then
    	Response.Write "<A href='" & ScriptName & "?NumPerPage=" & NumPerPage & "&amp;page=" & CurrentPage + 1 & "'><font size=1 face=Verdana><strong>></strong></font></a>"
    Else
    	Response.Write ""
    End if
	end if
' Here is where we close our Recordset and our Database connection.
	rsSearch.close
    Set rsSearch = Nothing
	My.close
	set My = Nothing
%>
		</div>
</body>
	<script>
		var animData = {
			wrapper: document.getElementById('bodymovin'),
			animType: 'html',
			loop: true,
			prerender: true,
			autoplay: true,
			path: 'data.json'

		};
		var anim = bodymovin.loadAnimation(animData);
	</script>
</html>
