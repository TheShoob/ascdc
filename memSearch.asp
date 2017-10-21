<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/inc_Login_Check.asp" -->
<title>Member Search</title>
<link rel="stylesheet" type="text/css" href="page.css">

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
    <h1>ASCDC Member Search</h1>
    <div id="member-search-container">
        <form action="memSearch.asp" method="post" name="MemberSearch">
            <input type="image" name="SubmitIt" src="images/search.png"  onmouseover="this.src = 'images/search_over.png';" onMouseOut="this.src = 'images/search.png';" class="member-search-btn"/>
            
        <div id="member-search">
            <input type="text" id="LName" name="LName" size="25" onClick="clickclear(this, 'Last Name')" onBlur="clickrecall(this,'Last Name')" value="<%If Request("LName") = "" Then%>Last Name<%Else%><%=Request("LName")%><%End If%>">
            <input type="text" id="FName" name="FName" size="25" onClick="clickclear(this, 'First Name')" onBlur="clickrecall(this,'First Name')" value="<%If Request("FName") = "" Then%>First Name<%Else%><%=Request("FName")%><%End If%>">
            <input type="text" id="FirmName" name="FirmName" size="25" onClick="clickclear(this, 'Firm Name')" onBlur="clickrecall(this,'Firm Name')" value="<%If Request("FirmName") = "" Then%>Firm Name<%Else%><%=Request("FirmName")%><%End If%>">
            <br>
            <div id="member-location-dropdown">
                <select name='County' size='1'>
                    <option value=''>Select County</option>
                    <option value='Kern'<%If Request("County") = "Kern" Then%> selected<%End if%>>Kern</option>
                    <option value='Los Angeles'<%If Request("County") = "Los Angeles" Then%> selected<%End if%>>Los Angeles</option>
                    <option value='Orange'<%If Request("County") = "Orange" Then%> selected<%End if%>>Orange</option>
                    <option value='Riverside'<%If Request("County") = "Riverside" Then%> selected<%End if%>>Riverside</option>
                    <option value='San Bernardino'<%If Request("County") = "San Bernardino" Then%> selected<%End if%>>San Bernardino</option>
                    <option value='San Diego'<%If Request("County") = "San Diego" Then%> selected<%End if%>>San Diego</option>
                    <option value='Santa Barbara'<%If Request("County") = "Santa Barbara" Then%> selected<%End if%>>Santa Barbara</option>
                    <option value='Ventura'<%If Request("County") = "Ventura" Then%> selected<%End if%>>Ventura</option>
                </select> <font size="-2">(optional)</font>
            </div>
        </div>
        <div id="member-radio-btn">
            <input type="radio" name="SearchType" value="partial"<%If Not Request("SearchType") = "exact" Then%> checked<%End If%>> <font size="1">Partial</font>&nbsp;
            <input type="radio" name="SearchType" value="exact"<%If Request("SearchType") = "exact" Then%> checked<%End If%>> <font size="1">Exact</font>
            <input type="hidden" name="varDoIt" value="1">
        </div>
        </form>
    </div>
        <font size="1">* Please only use single words for partial searches (no spaces).</font>

        <%
        If Request("varDoIt") = 1 Then
            varNoValues = 0
            If (Request("LName") = "" OR Request("LName") = "Last Name") AND (Request("FName") = "" OR Request("FName") = "First Name") AND (Request("FirmName") = "" OR Request("FirmName") = "Firm Name") AND (Request("County") = "" OR Request("County") = "Select County") Then
                varNoValues = 1
            End If
            If varNoValues = 0 Then
                If (Request("FirmName") = "") OR (Request("FirmName") = "Firm Name") Then
                    varFirmNameSearch = 0
                Else
                    varFirmNameSearch = 1
                    varFirmName = Trim(Replace(Request("FirmName"),"'","''"))
                End If
                If (Request("FName") = "") OR (Request("FName") = "First Name") Then
                    varFNameSearch = 0
                Else
                    varFNameSearch = 1
                    varFName = Trim(Replace(Request("FName"),"'","''"))
                End If
                If (Request("LName") = "") OR (Request("LName") = "Last Name") Then
                    varLNameSearch = 0
                Else
                    varLNameSearch = 1
                    varLName = Trim(Replace(Request("LName"),"'","''"))
                End If
                'Response.write(varLName)
                
                                            

                If Request("SearchType") = "partial" Then
                    If varFirmNameSearch = 1 Then
                        SQLQuerySearch = SQLQuerySearch & "(tblFirms.FirmName Like '%" & varFirmName & "%')"
                    End If
                    If varFNameSearch = 1 Then
                        If Not varFirmNameSearch = 1 Then
                            SQLQuerySearch = SQLQuerySearch & "(tblPeople.FName Like '%" & varFName & "%')"
                        Else
                            SQLQuerySearch = SQLQuerySearch & " OR " & "(tblPeople.FName Like '%" & varFName & "%')"
                        End If
                    End If
                    If varLNameSearch = 1 Then
                        If (varFirmNameSearch = 1) OR (varFNameSearch = 1) Then
                            SQLQuerySearch = SQLQuerySearch & " OR " & "(tblPeople.LName Like '%" & varLName & "%')"
                        Else
                            SQLQuerySearch = SQLQuerySearch & "(tblPeople.LName Like '%" & varLName & "%')"
                        End If
                    End If
                    If Not Request("County") = "" Then
                        If (varFirmNameSearch = 1) OR (varFNameSearch = 1) OR (varLNameSearch = 1) Then
                            SQLQuerySearch = SQLQuerySearch & " OR " & "(tblFirms.County Like '%" & Request("County") & "%')"
                        Else
                            SQLQuerySearch = SQLQuerySearch & "(tblFirms.County Like '%" & Request("County") & "%')"
                        End If
                    End if
                Else
                    If varFirmNameSearch = 1 Then
                        SQLQuerySearch = SQLQuerySearch & "tblFirms.FirmName = '" & varFirmName & "'"
                    End If
                    If varFNameSearch = 1 Then
                        If Not varFirmNameSearch = 1 Then
                            SQLQuerySearch = SQLQuerySearch & "tblPeople.FName = '" & varFName & "'"
                        Else
                            SQLQuerySearch = SQLQuerySearch & " AND tblPeople.FName = '" & varFName & "'"
                        End If
                    End If
                    If varLNameSearch = 1 Then
                        If (varFirmNameSearch = 1) OR (varFNameSearch = 1) Then
                            SQLQuerySearch = SQLQuerySearch & " AND tblPeople.LName = '" & varLName & "'"
                        Else
                            SQLQuerySearch = SQLQuerySearch & " tblPeople.LName = '" & varLName & "'"
                        End If
                    End If
                    If Not Request("County") = "" Then
                        If (varFirmNameSearch = 1) OR (varFNameSearch = 1) OR (varLNameSearch = 1) Then
                            SQLQuerySearch = SQLQuerySearch & " AND tblFirms.County = '" & Request("County") & "'"
                        Else
                            SQLQuerySearch = SQLQuerySearch & " tblFirms.County = '" & Request("County") & "'"
                        End If
                    End if			
                End If
            'Response.write("<P>" & SQLQuerySearch & "<P>")
                                                        
                                        
                    ' ************************************************************************
                    ' Build The Search Query Based On Submitted Search Criteria
                    ' ************************************************************************
                    'SQLQuery = "SELECT tblPeople.PeopleID, tblPeople.FName, tblPeople.MName, tblPeople.LName, tblFirms.FirmName, tblFirms.FirmAdrsL1, tblFirms.FirmAdrsL2, tblFirms.FirmCity, tblFirms.FirmState, tblFirms.FirmZip, tblFirms.FirmPhone, tblFirms.FirmFax, tblFirms.County, tblFirms.URL, tblPeople.Email, tblPeople.Opt_Out_Online_Directory, tblPayments.DuesYear FROM tblFirms INNER JOIN (tblPayments INNER JOIN tblPeople ON tblPayments.PeopleID = tblPeople.PeopleID) ON tblFirms.FirmID = tblPeople.FirmID WHERE tblPayments.DuesYear >= " & Year(date) & ";"
                    'SQLQuery = "SELECT tblPeople.PeopleID, tblPeople.FName, tblPeople.MName, tblPeople.LName, tblFirms.FirmName, tblFirms.FirmAdrsL1, tblFirms.FirmAdrsL2, tblFirms.FirmCity, tblFirms.FirmState, tblFirms.FirmZip, tblFirms.FirmPhone, tblFirms.FirmFax, tblFirms.County, tblFirms.URL, tblPeople.Email, tblPeople.Opt_Out_Online_Directory, tblPayments.DuesYear FROM tblFirms INNER JOIN (tblPayments INNER JOIN tblPeople ON tblPayments.PeopleID = tblPeople.PeopleID) ON tblFirms.FirmID = tblPeople.FirmID WHERE (tblPeople.Opt_Out_Online_Directory = 0) AND (tblPeople.MemberCode <> 'STAFF') AND (" & SQLQuerySearch & ") ORDER BY tblPeople.LName DESC;"
                    'SQLQuery = "SELECT * FROM tblPeople WHERE (Opt_Out_Online_Directory = 0) AND (MemberCode <> 'STAFF') AND (" & SQLQuerySearch & ") ORDER BY tblPeople.LName DESC;"
                        SQLQuery = "SELECT tblPeople.*, tblFirms.* FROM tblPeople INNER JOIN tblFirms ON tblPeople.FirmID = tblFirms.FirmID WHERE (Opt_Out_Online_Directory = 0) AND (MemberCode <> 'STAFF') AND (" & SQLQuerySearch & ") ORDER BY tblPeople.LName ASC;"

                    'response.write("<P>" & SQLQuery & "<P>")
                    Set ASCDCSearchUser = connASCDC.Execute(SQLQuery)
                    If Not ASCDCSearchUser.EOF Then
                        varSearchCount = 0
                        Do While Not ASCDCSearchUser.EOF

                            'Grab the last dues payment for member
                            SQLQuery01 = "SELECT * FROM tblPayments WHERE (PeopleID = " & ASCDCSearchUser("PeopleID") & ") AND (DuesYear <> NULL) ORDER BY DuesYear DESC;"
                            'response.write(SQLQuery)
                            Set ASCDCMemberDues = connASCDC.Execute(SQLQuery01)
                            MemberSkip = 0
                            CurrentYear = year(Date())
                            If Not ASCDCMemberDues.EOF Then
                                varLastYearPaid = ASCDCMemberDues("DuesYear")
                                'Response.write(ASCDCMemberDues("DuesYear"))
                                If CInt(varLastYearPaid) >= CInt(CurrentYear) Then
                                    MemberSkip = 0
                                Else
                                    'Check if we have passed the 90 Day grace period
                                    varDueDate = "4/1/" & CurrentYear
                                    If DateDiff("d", date(), varDueDate) < 1 Then
                                        'we are expired
                                        MemberSkip = 1
                                    End If
                                End If
                            Else
                                'Can't Find a payment for dues that matches this member
                                MemberSkip = 1
                            End If

                            If Not MemberSkip = 1 Then
                                'List The Member!
                                varSearchCount = varSearchCount + 1
%>

            <div id="searchwrapper"><!--Results-->
                                                
                <div id="SearchFirmName"><%=ASCDCSearchUser("Firmname")%></div>
                <div id="FirstLastName">
                    <div id="SearchFirstName"><%=ASCDCSearchUser("FName")%></div>
                    <%If ASCDCSearchUser("MName") <> "" Then%>
                    <div id="SearchMiddleName"><%=ASCDCSearchUser("MName")%></div>
                    <%End If%>
                    <div id="SearchLastName"><%=ASCDCSearchUser("LName")%></div>
                </div>
                <div id="member-Location">
                    <div id="SearchFirmAddress1"><%=ASCDCSearchUser("FirmAdrsL1")%></div>
                    <div id="SearchFirmAddress2"><%=ASCDCSearchUser("FirmAdrsL2")%></div>
                    <div id="SearchFirmCity"><%=ASCDCSearchUser("FirmCity")%></div>
                    <div id="SearchFirmState"><%=ASCDCSearchUser("FirmState")%></div>
                    <div id="SearchFirmZip"><%=ASCDCSearchUser("FirmZip")%></div>
                </div>
                <div id="SearchFirmCounty"><%=ASCDCSearchUser("County")%></div>
                <div id="SearchFirmPhone"><%=ASCDCSearchUser("FirmPhone")%> (p)</div> 
                <div id="SearchFirmFax"><%=ASCDCSearchUser("FirmFax")%> (f)</div>
                <div id="SearchFirmURL"><%If Not ASCDCSearchUser("URL") = "" Then%><a href="<%=ASCDCSearchUser("URL")%>" target="_blank"><%=ASCDCSearchUser("URL")%></a><%End If%></div>
                <div id="SearchEmail"><a href="mailto:<%=ASCDCSearchUser("Email")%>"><%=ASCDCSearchUser("Email")%></a></div>												
<%							
            End If
%>
                </div>
<%											
            ASCDCSearchUser.MoveNext

        Loop
    Else
        varSearchCount = 0
    End If
    Response.write("<P>Search Count: <strong>" & varSearchCount & "</strong> Results")
     Else
     	Response.write("<P><strong>PLEASE ENTER SOMETHING TO SEARCH FOR!</strong>")
     End If

End If
%>

<SCRIPT LANGUAGE="JavaScript">

function checkIt(form) {
	if ((form.LName.value == "" || form.LName.value == " " || form.LName.value == "Last Name") && (form.FName.value == "" || form.FName.value == " " || form.FName.value == "First Name") && (form.FirmName.value == "" || form.FirmName.value == " " || form.FirmName.value == "Firm Name") && (form.County.value == "" || form.County.value == " " || form.County.value == "Select County")) {
		alert("Please Enter Something To Search For.");
		form.LName.focus();
		return false;
	}
	var submitted = false;
if(submitted == true) { return; }
form.SubmitIt.value = 'submitting...';
form.SubmitIt.disabled = true;
submitted = true;	

	form.submit()
	return false
}
</SCRIPT>
</body>
</html>
