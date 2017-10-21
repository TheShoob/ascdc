<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Expert Witness Database - Search Engine</title>
<!--#include file="inc/inc_DB_Conn.asp" -->
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
    <span class="pageTitle">Expert Witness Database - Search Engine<div class="arrow-down"></div></span>
    <p>NOTE: If First Name & Last Name are entered, they both must have at least a partial match to render results and if a year is entered, only depositions published that year will be searched.</p>
    <%
												
    'Response.write("TEST: LoggedIn = " & LoggedIn)
    If LoggedIn = 1 Then
        
        'Open The SQL Database Connection
        DataConnName = "ascdcsecure"
        Set My = Server.CreateObject("ADODB.Connection")
        My.ConnectionTimeout = Application(DataConnName & "_ConnectionTimeout")
        My.CommandTimeout = Application(DataConnName & "_CommandTimeout")
        My.Open Application(DataConnName & "_ConnectionString"), Application(DataConnName & "_RuntimeUserName"), Application(DataConnName & "_RuntimePassword")
    %>
    <br>
    <form action="#expertWitnessDb.asp" method="post" name="ExpertSearch">
    <div class="fWrap">
        <input type="text" id="Exp_LName" name="Exp_LName" size="25" onClick="clickclear(this, 'Last Name')" onBlur="clickrecall(this,'Last Name')" value="<%If Request("Exp_LName") = "" Then%>Last Name<%Else%><%=Request("Exp_LName")%><%End If%>">
        <input type="text" id="Exp_FName" name="Exp_FName" size="25" onClick="clickclear(this, 'First Name')" onBlur="clickrecall(this,'First Name')" value="<%If Request("Exp_FName") = "" Then%>First Name<%Else%><%=Request("Exp_FName")%><%End If%>">
        <input type="text" id="Depo_Year" name="Depo_Year" size="35" onClick="clickclear(this, 'Deposition Year (XXXX)')" onBlur="clickrecall(this,'Deposition Year (XXXX)')" value="<%If Request("Depo_Year") = "" Then%>Deposition Year (XXXX)<%Else%><%=Request("Depo_Year")%><%End If%>">
    </div>
    <br>
        <select name="Expert_Type" id="Expert_Type">
            <option value=0<%If Request("Expert_Type") = "" Then%> SELECTED<%End If%>>Select an Expert Category...</option>
            <%
            SQLQuery = "SELECT * FROM tbl_Expert_Type ORDER BY Expert_Type;"
            Set rsExpertType = My.Execute(SQLQuery)
            If Not rsExpertType.EOF Then
                'varCount = 0
                Do While Not rsExpertType.EOF
                    'varCount = varCount + 1
            %>
                        <option value=<%=rsExpertType("Expert_Type_ID")%><%If Not Request("Expert_Type") = "" Then%><%If CInt(Request("Expert_Type")) = CInt(rsExpertType("Expert_Type_ID")) Then%> SELECTED<%End If%><%End If%>><%=rsExpertType("Expert_Type")%></option>
            <%
                    rsExpertType.MoveNext
                Loop
            End If
            %>
        </select>
        <input type="hidden" name="varDoIt" value="1">
        <input type="hidden" name="SearchType" value="partial">
    <br>
    <br>    
    <div class="fWrap">        
       <div><input class="btn" type="button" value="Search"><div class="spyglass"></div></input></div>
    </div>
    </form>
    <%
        If Request("varDoIt") = 1 Then
            varNoValues = 0
            varSkipy = 0
            If (Request("Exp_LName") = "" OR Request("Exp_LName") = "Last Name") AND (Request("Exp_FName") = "" OR Request("Exp_FName") = "First Name") AND (Request("Depo_Year") = "" OR Request("Depo_Year") = "Deposition Year (XXXX)") AND (Request("Expert_Type") = 0 OR Request("Expert_Type") = "Select an Expert Category...") Then
                varNoValues = 1
            End If
            If varNoValues = 1 Then
                Response.write("<P><strong>PLEASE ENTER SOMETHING TO SEARCH FOR</strong></p>")
            Else
                Response.write("<P>SEARCH RESULTS:</p>")
                'Determine Results
                'Response.Write("<P><strong>DEBUG: Let the search begin:</strong></p>")
                'Set Entered Paramaters To Variables
                If (Request("Depo_Year") = "") OR (Request("Depo_Year") = "Deposition Year (XXXX)") Then
                    varDepoYearSearch = 0
                Else
                    varDepoYearSearch = 1
                    varDepoYear = Request("Depo_Year")
                End If
                'Response.Write("<br><strong>DEBUG: varDepoYearSearch: " & varDepoYearSearch & " | " & varDepoYear & "</strong>")
                If (Request("Exp_FName") = "") OR (Request("Exp_FName") = "First Name") Then
                    varFNameSearch = 0
                Else
                    varFNameSearch = 1
                    varFName = Request("Exp_FName")
                End If
                'Response.Write("<br><strong>DEBUG: varFNameSearch: " & varFNameSearch & " | " & varFName & "</strong>")
                If (Request("Exp_LName") = "") OR (Request("Exp_LName") = "Last Name") Then
                    varLNameSearch = 0
                Else
                    varLNameSearch = 1
                    varLName = Request("Exp_LName")
                End If
                ' Response.Write("<br><strong>DEBUG: varLNameSearch: " & varLNameSearch & " | " & varLName & "</strong>")
                If (Request("Expert_Type") = 0) OR (Request("Expert_Type") = "Select an Expert Category...") Then
                    varExpertTypeSearch = 0
                Else
                    varExpertTypeSearch = 1
                    varExpertType = Request("Expert_Type")
                End If
                'Response.Write("<br><strong>DEBUG: varExpertTypeSearch: " & varExpertTypeSearch & " | " & varExpertType & "<br><br></strong>")


                '####################################################################
                'Build SQL String for looping through tbl_Experts_Depo
                '####################################################################
                
                SQLSelectSearch = "SELECT * FROM tbl_Experts_Depo"
                'Is There A WHERE?
                If (varExpertTypeSearch = 1) OR (varDepoYearSearch = 1) Then
                    SQLSelectSearch = SQLSelectSearch & " WHERE "
                End If
                If (varExpertTypeSearch = 1) AND (varDepoYearSearch = 1) Then
                    SQLSelectSearch = SQLSelectSearch & "Depo_Year = " & varDepoYear & " AND Expert_Type_ID = " & varExpertType
                Else
                    If varDepoYearSearch = 1 Then
                        SQLSelectSearch = SQLSelectSearch & "Depo_Year = " & varDepoYear
                    End If
                    If varExpertTypeSearch = 1 Then
                        SQLSelectSearch = SQLSelectSearch & "Expert_Type_ID = " & varExpertType
                    End If
                End If
                If (varDepoYearSearch = 0) AND (varExpertTypeSearch = 0) Then
                    SQLSelectSearch = SQLSelectSearch & " ORDER BY Depo_Year DESC, Expert_Type_ID"
                Else
                    If varDepoYearSearch = 0 Then
                        SQLSelectSearch = SQLSelectSearch & " ORDER BY Depo_Year DESC"
                    End If
                    If varExpertTypeSearch = 0 Then
                        SQLSelectSearch = SQLSelectSearch & " ORDER BY Expert_Type_ID"
                    End If
                End If
                
                
                SQLSelectSearch = SQLSelectSearch & ";"
                'Response.Write("<p><strong>DEBUG: SQLSelectSearch:<br>" & SQLSelectSearch & "</strong></p>")
                Set rsExpertDepo = My.Execute(SQLSelectSearch)
                varDepoCount = 0
                
                'response.write(SQLSelectSearch & "<br><br>")
                
                '####################################################################
                'Loop Through tbl_Experts_Depo
                '####################################################################
                
                If Not rsExpertDepo.EOF Then
                    varCountTotal = 0
                    varCount = 0
                    Do While Not rsExpertDepo.EOF
                            'varDepoCount = varDepoCount + 1
                        
                            SQLExpertType = "SELECT * FROM tbl_Expert_Type WHERE Expert_Type_ID = " & rsExpertDepo("Expert_Type_ID") & ";"
                            Set rsExpertType = My.Execute(SQLExpertType)
                            SQLExpert = "SELECT * FROM tbl_Experts WHERE Expert_ID = " & rsExpertDepo("Expert_ID") & ";"
                            'response.write(SQLExpert & "<br>")
                            Set rsExpert = My.Execute(SQLExpert)
                            varSkipIt = 0
                            If (varFNameSearch = 1) OR (varLNameSearch = 1) Then
                                If varFNameSearch = 1 Then
                                    If Instr(LCASE(rsExpert("Exp_FName")), LCASE(varFName)) = 0 Then
                                    'If Not varFName = rsExpert("Exp_FName") Then
                                        varSkipIt = 1
                                        'varDepoCount = varDepoCount - 1
                                    End If
                                End If
                                If varLNameSearch = 1 Then
                                    If Instr(LCASE(rsExpert("Exp_LName")), LCASE(varLName)) = 0 Then
                                    'If Not varLName LIKE rsExpert("Exp_LName") Then
                                        varSkipIt = 1
                                        'varDepoCount = varDepoCount - 1
                                    End If
                                End If
                            End If
                            If Not varSkipIt = 1 Then
                                varCountTotal = varCountTotal + 1
                                Response.write("<p><strong>YEAR: " & rsExpertDepo("Depo_Year") & " | " & rsExpertType("Expert_Type") & "</strong><br>")
                                Response.write("<strong>DEPOSITION: <a href='_db/Experts/" & rsExpertDepo("Depo_Doc") & "' target='_blank'>" & rsExpertDepo("Depo_Doc") & "</a></strong><br>")
                                Response.write("<strong>EXPERT: " & rsExpert("Exp_FName") & " " & rsExpert("Exp_LName") & "</strong><br>")
                            Else
                                'varCountTotal = -1
                                'response.write("-1")
                            End If

                            rsExpertDepo.MoveNext
                    Loop
                Else
                    'Found No Matching Records
                    Response.write("<p><strong>No Records Found!</strong></p>")
                    varSkipy = 1
                End If  
                'Response.write("<br>Total Search Results: " & varDepoCount & "<br>")
                If varCountTotal < 1 Then
                    If Not varSkipy = 1 Then
                        Response.write("<p><strong>No Records Found!</strong></p>")
                    End If
                End If
            End If
        End If 
    Else
%>
    <p>You must be logged in as a member to access this content.</p>
	<br><a href="http://www.ascdc.org/_dev/default.asp">Login</a>
<%
    End If                                                
 %>
</body>
</html>
