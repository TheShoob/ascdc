<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/ProtectSQL.asp" -->
<!--#include file="inc/adovbs.inc" -->
<title>Member Marketplace</title>
<link rel="stylesheet" type="text/css" href="page.css">

  <style>
  
    select {
        display: block;
        -webkit-appearance: none;
        border-radius: 5px;
		border: 0px;
        color: #fff;
        background-color: #1b447d;
        background-image: url(../images/selectArrow.png);
        background-position: 96%;
        background-repeat: no-repeat;
        background-size: 15px;
        width: auto;
        text-align: center;
        padding: 5px 20px 5px 15px;
        font-size: small;
        text-wrap: unrestricted;
        white-space: normal;
        margin: 0 auto;
    }
  
    .marketWrap {
        display: table;
        width: 100%;
        height: 100%;
    }
  
    .left {
        display: table-cell;
        width: 477px;
    }
    
    .right {
        display: table-cell;
        width: 475px;
        border-left: #A2A2A2 dotted thin;
    }
    
    .marketTitle {
        color: #262626;
        font-size: 2em;
        text-align: center;
        margin-bottom: 20px;
    }
    
    select.pick{
        margin: 0 auto;
        width: 300px;
        height: 50px;
    }
    
    .ad {
        background-color: blue;
        margin: 0 auto;
        width: 450px;
        height: 100px;
        margin-top: 50px;
    }
    
    .list {
        background-color: blue;
        margin: 0 auto;
        width: 300px;
        min-height: 400px;
        height: auto;
        margin-top: 50px;
    }
    
    .searchWrap {
        margin: 0 auto;
        margin-top: 5px;
        width: 300px;
        height: 50px;
    }
    
    select.seek {
        width: 220px;
        height: 35px;
        float: left;
        background-color: #D6D6D6;
		color: #1b447d;
    }
    
    input.search {
		display: block;
        width: 70px;
        height: 35px;
        float: right;
        background-color: #1b447d;
		border: 0px;
		color: #fff;
        -webkit-appearance: none;
        border-radius: 5px;
    }
  
    .divide {
        margin: 0 auto;
        margin-top: 25px;
        height: 24px;
        width: 450px;
        border-top: #A2A2A2 dotted thin;
    }
    
    .jobPost {
        background-color: green;
        margin: 0 auto;
        width: 450px;
        height: 500px;
    }
    
    .post {
        background-color: blue;
        margin: 0 auto;
        margin-top: 20px;
        width: 80px;
        height: 50px;
    }
  
  </style>
	
</head>

<%If Not LoggedIn = 1 Then%> 
<%Response.Redirect("http://www.ascdc.org/_Login.asp?LoginRedirect=1&LoginRedirectReferrer=Marketplace")%>
<%End If%>

<body>
	
    <h1>
        Member to Member Market Listing Submission Results
    </h1>
    <div>
        <!--||Main Content Goes Here||-->
    <%
        var_CatID = CInt(Request("CatID"))


        var_listingTitle = ProtectSQL(Request("listingTitle"))


        var_listingDescription = ProtectSQL(Request("listingDescription"))

    varSKIPURL = 0
    If Not Request("listingURL") = "" Then
        var_listingURL = ProtectSQL(Request("listingURL"))
    Else
        varSKIPURL = 1
    End If
    If CInt(Request("flgEmpType")) = 1 Then
        var_flgStaff = 1
        var_flgAttorney = 0
    Else
        var_flgStaff = 0
        var_flgAttorney = 1
    End If
    If CInt(Request("flgContact")) = 1 Then
        var_flgContact = 1
    Else
        var_flgContact = 0
    End If
    varSKIPContact = 0
    If var_flgContact = 1 Then
    var_contactName = Request("contactName")
    var_contactPhone = Request("contactPhone")
    var_contactEmail = Request("contactEmail")
    Else
        varSKIPContact = 1
    End If

        varListingExpires = DateAdd("d",62,Now())
        varPeopleID = CInt(ASCDCMemberID)
        'Insert and Email Notification
        varInsert = "INSERT into tblMarket(PeopleID, catID, listingTitle, listingDescription"
        If Not varSKIPURL = 1 Then
            varInsert = varInsert & ", newlistingURL"
        End If
        varInsert = varInsert & ", listingExpires, flgStaff, flgAttorney, flgContact, listingSubDate"
        If Not varSKIPContact = 1 Then
            varInsert = varInsert & ", contactName, contactPhone, contactEmail"
        End If
        
        varInsert = varInsert & ")values(?, ?, ?, ?"
        If Not varSKIPURL = 1 Then
            varInsert = varInsert & ", ?"
        End If
        varInsert = varInsert & ", ?, ?, ?, ?, ?"
        If Not varSKIPContact = 1 Then
            varInsert = varInsert & ", ?, ?, ?"
        End If
        varInsert = varInsert & ")"
        
        Set chInsert = Server.CreateObject("ADODB.Command")
        chInsert.ActiveConnection=My
        chInsert.commandtext=varInsert
        'Response.write("<P>ASCDCMemberID = " & ASCDCMemberID & "</P>")
        'Response.write("<P>varInsert = <br>" & varInsert & "</P>")
        chInsert.Parameters.Append chInsert.CreateParameter("@PeopleID", adInteger, adParamInput, , varPeopleID)
        chInsert.Parameters.Append chInsert.CreateParameter("@catID", adInteger, adParamInput, , var_CatID)
        chInsert.Parameters.Append chInsert.CreateParameter("@listingTitle", adVarChar, adParamInput, 255, var_listingTitle)
        chInsert.Parameters.Append chInsert.CreateParameter("@listingDescription", adLongVarWChar, adParamInput, LEN(var_listingDescription), var_listingDescription)
        If Not varSKIPURL = 1 Then
            chInsert.Parameters.Append chInsert.CreateParameter("@newlistingURL", adVarChar, adParamInput, 500, var_listingURL)
        End If
        chInsert.Parameters.Append chInsert.CreateParameter("@listingExpires", adDate, adParamInput, , varListingExpires)
        chInsert.Parameters.Append chInsert.CreateParameter("@flgStaff", adVarChar, adParamInput, 10, var_flgStaff)
        chInsert.Parameters.Append chInsert.CreateParameter("@flgAttorney", adVarChar, adParamInput, 10, var_flgAttorney)
        chInsert.Parameters.Append chInsert.CreateParameter("@flgContact", adVarChar, adParamInput, 10, var_flgContact)
        chInsert.Parameters.Append chInsert.CreateParameter("@listingSubDate", adDate, adParamInput, , Now())
        If Not varSKIPContact = 1 Then
            chInsert.Parameters.Append chInsert.CreateParameter("@contactName", adVarChar, adParamInput, 255, var_contactName)
            chInsert.Parameters.Append chInsert.CreateParameter("@contactPhone", adVarChar, adParamInput, 25, var_contactPhone)
            chInsert.Parameters.Append chInsert.CreateParameter("@contactEmail", adVarChar, adParamInput, 255, var_contactEmail)
        End If
        set rschInsert = chInsert.execute
        
        'Mailer
        Set Mailer = Server.CreateObject("JMail.Message")
        Mailer.FromName    =	"ascdc.org"
        Mailer.From			 =	"info@ascdc.org"
        Mailer.AddRecipient 	"info@ascdc.org", "ASCDC Mgmt Staff"
        Mailer.AddRecipient 	"web@camgmt.com", "ASCDC Web Team"
        Mailer.Subject     =	"ASCDC Member to Member Market Submission"
        
        Mailer.Body    =	"Go Check The ASCDC Admin Page! | Submitted By: " & varMemberName & " PeopleID: " & ASCDCMemberID 

        Mailer.Priority    = 	1
        if Mailer.Send("mail.midtownmicro.com:25") then
        Response.Write "<UL><LI><font class=""ASCDC""><font size=""2"">Thank you for submitting your Member Market listing.<br><br>The information you submitted has been sent to the ASCDC Management Offices for review and will go-live within 2 business days or less.<p>Thank you for supporting the ASCDC as a member,<br><br>ASCDC Management Staff</p></font></font>"
        else
        Response.Write "<UL><LI><font class=""ASCDC""><font color=""#FF0000"">ERROR:</font>There was an error sending the request via email to headquarters.<BR><BR>Please send an e-mail to our <a href=""mailto:web@camgmt.com?Subject=ASCDC Market Submission E-mail ERROR""> WEBMASTERS </a> and please copy & paste the above error message. We apologize for any inconvenience this error has caused. Our Webmasters will address this for you ASAP.</font></UL>"
        end if
    %>

    Note: All listings automatically expire in 60 days from submission:<br>			

                                                    
    <!--||END Main Content Goes Here||-->
</div>

</body>
</html>
