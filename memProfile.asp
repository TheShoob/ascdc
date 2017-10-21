<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/adovbs.inc" -->
<title>Member Profile</title>
<link rel="stylesheet" type="text/css" href="page.css">

</head>

<body>
<%	
                                    
                                    
                                    
    If Request("varUpdate") = 1 Then
        'Update Login Changes and Submit All Other Updates Via Email
        
        ASCDCerror = 0
        'Check for duplicate UserID
        UIDSQLQuery = "SELECT PeopleID,UserID FROM tblPeople WHERE UserID = '" & Request("UserID") & "';"
        Set ASCDCUIDCheck = connASCDC.Execute(UIDSQLQuery)
        If Not ASCDCUIDCheck.EOF Then
            If Not ASCDCMemberID = ASCDCUIDCheck("PeopleID") Then
                Response.Write("<UL><LI><B><font face=""Arial"">Please try another Username!</font></B></UL>")
                ASCDCerror = 1
            End If
        End If
        
        If ASCDCerror = 0 Then
            'Declare the variables
            Dim con
            Dim rst
            Dim strSQL
            
            Set con = Server.CreateObject("ADODB.Connection")
            con.Open connASCDC
            'Select record to be updated
            strSQL = "SELECT * FROM tblPeople WHERE PeopleID = " & CInt(ASCDCMemberID) & ";"
            'response.write(strSQL)
            Set rsProfileUpdate = Server.CreateObject("ADODB.Recordset")
            rsProfileUpdate.Open strSQL, con, adOpenStatic, adLockOptimistic, adCmdText
            
            If Not CStr(rsProfileUpdate("UserID")) = CStr(Request("UserID")) Then
                varOldUserID = rsProfileUpdate("UserID")
                varNewUserID = request("UserID")
                rsProfileUpdate("UserID") = Request("UserID")
                UserIDUpdate = 1
            End If
            
            If Not CStr(rsProfileUpdate("Password")) = CStr(Request("Password")) Then
                varOldPassword = rsProfileUpdate("Password")
                varNewPassword = Request("Password")
                rsProfileUpdate("Password") = Request("Password")
                PasswordUpdate = 1
            End If
            
            If Not rsProfileUpdate("Email") = Request("Email") Then
                varOldEmail = rsProfileUpdate("Email")
                varNewEmail = Request("Email")
                rsProfileUpdate("Email") = Request("Email")
                EmailUpdate = 1
            End If
            
            If Request("Opt_Out_Online_Directory") = 1 Then
                OOODAnswer = True
            Else
                OOODAnswer = False
            End If
            OldAnswer = rsProfileUpdate("Opt_Out_Online_Directory")
            If Not OOODAnswer = OldAnswer Then
                varOldOpt_Out_Online_Directory = OldAnswer
                varNewOpt_Out_Online_Directory = Request("varNewOpt_Out_Online_Directory")
                rsProfileUpdate("Opt_Out_Online_Directory") = OOODAnswer
                Opt_OutUpdate = 1
            End If
            
            If Not Request("Salutation") = "" Then
                If Not rsProfileUpdate("Salutation") = Request("Salutation") Then
                    varOldSalutation = rsProfileUpdate("Salutation")
                    varNewSalutation = Request("Salutation")
                    rsProfileUpdate("Salutation") = Request("Salutation")
                    SalutationUpdate = 1
                End If
            Else
                rsProfileUpdate("Salutation") = ""
            End If
            
            If Not rsProfileUpdate("FName") = Request("FName") Then
                varOldFName = rsProfileUpdate("FName")
                varNewFName = Request("FName")
                rsProfileUpdate("FName") = Request("FName")
                FNameUpdate = 1
            End If
            
            If Not Request("MName") = "" Then
                If Not rsProfileUpdate("MName") = Request("MName") Then
                    varOldMName = rsProfileUpdate("MName")
                    varNewMName = Request("MName")
                    rsProfileUpdate("MName") = Request("MName")
                    MNameUpdate = 1
                End If
            Else
                rsProfileUpdate("MName") = ""
            End If
            
            If Not rsProfileUpdate("LName") = Request("LName") Then
                varOldLName = rsProfileUpdate("LName")
                varNewLName = Request("LName")
                rsProfileUpdate("LName") = Request("LName")
                LNameUpdate = 1
            End If
            
            If Not Request("Suffix") = "" Then
                If Not rsProfileUpdate("Suffix") = Request("Suffix") Then
                    varOldSuffix = rsProfileUpdate("Suffix")
                    varNewSuffix = Request("Suffix")
                    rsProfileUpdate("Suffix") = Request("Suffix")
                    SuffixUpdate = 1
                End If
            Else
                rsProfileUpdate("Suffix") = ""
            End If
            
            If Not Request("PAdrsL1") = "" Then
                If Not rsProfileUpdate("PAdrsL1") = Request("PAdrsL1") Then
                    varOldPAdrsL1 = rsProfileUpdate("PAdrsL1")
                    varNewPAdrsL1 = Request("PAdrsL1")
                    rsProfileUpdate("PAdrsL1") = Request("PAdrsL1")
                    PAdrsL1Update = 1
                End If
            Else
                rsProfileUpdate("PAdrsL1") = ""
            End If
            
            If Not Request("PAdrsL2") = "" Then
                If Not rsProfileUpdate("PAdrsL2") = Request("PAdrsL2") Then
                    varOldPAdrsL2 = rsProfileUpdate("PAdrsL2")
                    varNewPAdrsL2 = Request("PAdrsL2")
                    rsProfileUpdate("PAdrsL2") = Request("PAdrsL2")
                    PAdrsL2Update = 1
                End If
            Else
                rsProfileUpdate("PAdrsL2") = ""
            End If
            
            If Not Request("PCity") = "" Then
                If Not rsProfileUpdate("PCity") = Request("PCity") Then
                    varOldPCity = rsProfileUpdate("PCity")
                    varNewPCity = Request("PCity")
                    rsProfileUpdate("PCity") = Request("PCity")
                    PCityUpdate = 1
                End If
            Else
                rsProfileUpdate("PCity") = ""
            End If
            
            If Not Request("PState") = "" Then
                If Not rsProfileUpdate("PState") = Request("PState") Then
                    varOldPState = rsProfileUpdate("PState")
                    varNewPState = Request("PState")
                    rsProfileUpdate("PState") = Request("PState")
                    PStateUpdate = 1
                End If
            Else
                rsProfileUpdate("PState") = ""
            End If
            
            If Not Request("PZip") = "" Then
                If Not rsProfileUpdate("PZip") = Request("PZip") Then
                    varOldPZip = rsProfileUpdate("PZip")
                    varNewPZip = Request("PZip")
                    rsProfileUpdate("PZip") = Request("PZip")
                    PZipUpdate = 1
                End If
            Else
                rsProfileUpdate("PZip") = ""
            End If
            
            If Not Request("PPhone") = "" Then
                If Not rsProfileUpdate("PPhone") = Request("PPhone") Then
                    varOldPPhone = rsProfileUpdate("PPhone")
                    varNewPPhone = Request("PPhone")
                    rsProfileUpdate("PPhone") = Request("PPhone")
                    PPhoneUpdate = 1
                End If
            Else
                rsProfileUpdate("PPhone") = ""
            End If
            
            If Not Request("PFax") = "" Then
                If Not rsProfileUpdate("PFax") = Request("PFax") Then
                    varOldPFax = rsProfileUpdate("PFax")
                    varNewPFax = Request("PFax")
                    rsProfileUpdate("PFax") = Request("PFax")
                    PFaxUpdate = 1
                End If
            Else
                rsProfileUpdate("PFax") = ""
            End If
            
            'Get Firm Information
            UIDSQLQuery = "SELECT * FROM tblFirms WHERE FirmID = " & rsProfileUpdate("FirmId") & ";"
            Set ASCDCFirmCheck = connASCDC.Execute(UIDSQLQuery)
            
            If Not ASCDCFirmCheck("FirmName") = Request("FirmName") Then
                varNewFirmName = Request("FirmName")
                varOldFirmName = ASCDCFirmCheck("FirmName")
                FirmNameUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmAdrsL1") = Request("FirmAdrsL1") Then
                varNewFirmAdrsL1 = Request("FirmAdrsL1")
                varOldFirmAdrsL1 = ASCDCFirmCheck("FirmAdrsL1")
                FirmAdrsL1Update = 1
            End If
            
            If Not ASCDCFirmCheck("FirmAdrsL2") = Request("FirmAdrsL2") Then
                varNewFirmAdrsL2 = Request("FirmAdrsL2")
                varOldFirmAdrsL2 = ASCDCFirmCheck("FirmAdrsL2")
                FirmAdrsL2Update = 1
            End If
            
            If Not ASCDCFirmCheck("FirmCity") = Request("FirmCity") Then
                varNewFirmCity = Request("FirmCity")
                varOldFirmCity = ASCDCFirmCheck("FirmCity")
                FirmCityUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmState") = Request("FirmState") Then
                varNewFirmState = Request("FirmState")
                varOldFirmState = ASCDCFirmCheck("FirmState")
                FirmStateUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmZip") = Request("FirmZip") Then
                varNewFirmZip = Request("FirmZip")
                varOldFirmZip = ASCDCFirmCheck("FirmZip")
                FirmZipUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmPhone") = Request("FirmPhone") Then
                varNewFirmPhone = Request("FirmPhone")
                varOldFirmPhone = ASCDCFirmCheck("FirmPhone")
                FirmPhoneUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmFax") = Request("FirmFax") Then
                varNewFirmFax = Request("FirmFax")
                varOldFirmFax = ASCDCFirmCheck("FirmFax")
                FirmFaxUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("County") = Request("County") Then
                varNewCounty = Request("County")
                varOldCounty = ASCDCFirmCheck("County")
                CountyUpdate = 1
            End If
            
            If Not ASCDCFirmCheck("FirmSize") = Request("FirmSize") Then
                varNewFirmSize = Request("FirmSize")
                varOldFirmSize = ASCDCFirmCheck("FirmSize")
                FirmSizeUpdate = 1
            End If
            
            varComments = Request("Comments")
            
            'Mailer
            Set Mailer = Server.CreateObject("JMail.Message")
            Mailer.FromName    =	"ascdc.org"
            Mailer.From			 =	"info@ascdc.org"
            Mailer.AddRecipient 	"info@ascdc.org", "ASCDC Mgmt Staff"
            Mailer.AddRecipient 	"michael@camgmt.com", "ASCDC Webmaster"
            Mailer.Subject     =	"ASCDC Profile Change Request"
            
            Mailer.Body    =	"The following changes were made for this member at ASCDCncn.org. The changes were updated on the site but need to be maunually updated in the ASCDC Membership Database."
            Mailer.AppendText vbcrlf & " "
            Mailer.AppendText vbcrlf & "PeopleID: " & ASCDCMemberID
            Mailer.AppendText vbcrlf & " "
            
            If UserIDUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old UserID Name: " & varOldUserID
                Mailer.AppendText    vbcrlf &	"New UserID Name: " & varNewUserID
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PasswordUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Password: " & varOldPassword
                Mailer.AppendText    vbcrlf &	"New Password: " & varNewPassword
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If EmailUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Email: " & varOldEmail
                Mailer.AppendText    vbcrlf &	"New Email: " & varNewEmail
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If Opt_OutUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Online Directory Opt-Out: " & varOldOpt_Out_Online_Directory
                Mailer.AppendText    vbcrlf &	"New Online Directory Opt-Out: " & varNewOpt_Out_Online_Directory
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If SalutationUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Salutation: " & varOldSalutation
                Mailer.AppendText    vbcrlf &	"New Salutation: " & varNewSalutation
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FNameUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old First Name: " & varOldFName
                Mailer.AppendText    vbcrlf &	"New First Name: " & varNewFName
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If MNameUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Middle Name: " & varOldMName
                Mailer.AppendText    vbcrlf &	"New Middle Name: " & varNewMName
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If LNameUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Last Name: " & varOldLName
                Mailer.AppendText    vbcrlf &	"New Last Name: " & varNewLName
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If SuffixUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Suffix: " & varOldSuffix
                Mailer.AppendText    vbcrlf &	"New Suffix: " & varNewSuffix
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PAdrsL1Update = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Personal Address 1: " & varOldPAdrsL1
                Mailer.AppendText    vbcrlf &	"New Personal Address 1: " & varNewPAdrsL1
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PAdrsL2Update = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Personal Address 2: " & varOldPAdrsL2
                Mailer.AppendText    vbcrlf &	"New Personal Address 2: " & varNewPAdrsL2
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PCityUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old City: " & varOldPCity
                Mailer.AppendText    vbcrlf &	"New City: " & varNewPCity
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PStateUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old State: " & varOldPState
                Mailer.AppendText    vbcrlf &	"New State: " & varNewPState
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PZipUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Zip: " & varOldPZip
                Mailer.AppendText    vbcrlf &	"New Zip: " & varNewPZip
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PPhoneUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Phone: " & varOldPPhone
                Mailer.AppendText    vbcrlf &	"New Phone: " & varNewPPhone
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If PFaxUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Fax: " & varOldPFax
                Mailer.AppendText    vbcrlf &	"New Fax: " & varNewPFax
                Mailer.AppendText    vbcrlf &	""
            End If
            
            
            'Firms
            If FirmNameUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Firm Name: " & varOldFirmName
                Mailer.AppendText    vbcrlf &	"New Firm Name: " & varNewFirmName
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmAdrsL1Update = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Address 1: " & varOldFirmAdrsL1
                Mailer.AppendText    vbcrlf &	"New Address 1: " & varNewFirmAdrsL1
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmAdrsL2Update = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Address 2: " & varOldFirmAdrsL2
                Mailer.AppendText    vbcrlf &	"New Address 2: " & varNewFirmAdrsL2
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmCityUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old City: " & varOldFirmCity
                Mailer.AppendText    vbcrlf &	"New City: " & varNewFirmCity
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmStateUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old State: " & varOldFirmState
                Mailer.AppendText    vbcrlf &	"New State: " & varNewFirmState
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmZipUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Zip: " & varOldFirmZip
                Mailer.AppendText    vbcrlf &	"New Zip: " & varNewFirmZip
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmPhoneUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Phone: " & varOldFirmPhone
                Mailer.AppendText    vbcrlf &	"New Phone: " & varNewFirmPhone
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmFaxUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Fax: " & varOldFirmFax
                Mailer.AppendText    vbcrlf &	"New Fax: " & varNewFirmFax
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If CountyUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old County: " & varNewCounty
                Mailer.AppendText    vbcrlf &	"New County: " & varNewCounty
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If FirmSizeUpdate = 1 Then
                Mailer.AppendText    vbcrlf &	"Old Siz: " & varNewFirmSize
                Mailer.AppendText    vbcrlf &	"New Size: " & varNewFirmSize
                Mailer.AppendText    vbcrlf &	""
            End If
            
            If Not Request("Comment") = "Enter Any Comments Or Special Instructions For Headquarters" Then
                Mailer.AppendText    vbcrlf &	"Member Comments To Headquarters:"
                Mailer.AppendText    vbcrlf &	""
                Mailer.AppendText    vbcrlf &	request("Comments")
                Mailer.AppendText    vbcrlf &	""
            End If
            
            Mailer.Priority    = 	1
            if Mailer.Send("mail.midtownmicro.com:25") then
                Response.Write "<UL><LI><font class=""ASCDC""><font size=""2"">Thank you for submitting your profile changes.<br><br>The information you submitted has been sent to the ASCDC Management Offices for review. In the meantime, the information has been updated here at ASCDC.org. If there are any questions about this change request you will be contacted.<p>Thank you for supporting the ASCDC as a member,<br><br>ASCDC Management Staff</p></font></font>"
            else
                Response.Write "<UL><LI><font class=""ASCDC""><font color=""#FF0000"">ERROR:</font>There was an error sending the request via email to headquarters.<BR><BR>Please send an e-mail to our <a href=""mailto:michael@camgmt.com?Subject=ASCDC Change Request E-mail ERROR""> WEBMASTER </a> and please copy & paste the above error message. We apologize for any inconvenience this error has caused. Our Webmaster will address this for you ASAP.</font></UL>"
            end if
            
            'Lets Update It
            rsProfileUpdate.Update
            
        End If
%>




	<%If ASCDCerror = 1 Then%>
    <div align="center">
        <form action="Profile.asp" method="post" name="Return">
            <input type="submit" value="Return To Your Profile To Fix The Errors Above" name="Button" style="font-size: 7pt; background-color: 73A1C3; color: FFFFFF; font-weight: 550; width: 250px;">
            <input type="hidden" name="FName" value="<%Response.write(Request("FName"))%>">
            <input type="hidden" name="MName" value="<%Response.write(Request("MName"))%>">
            <input type="hidden" name="LName" value="<%Response.write(Request("LName"))%>">
            <input type="hidden" name="Nickname" value="<%Response.write(Request("Nickname"))%>">
            <input type="hidden" name="Email" value="<%Response.write(Request("Email"))%>">
            <input type="hidden" name="UserID" value="<%Response.write(Request("UserID"))%>">
            <input type="hidden" name="Password" value="<%Response.write(Request("Password"))%>">
            <input type="hidden" name="Comments" value="<%=Request("Comments")%>">
            <input type="hidden" name="ASCDCUpdateCorrection" value=1>
        </form>
        </div>
    <%Else%>
        <div><font class=""ASCDC""><font color="#008000" #FF0000="">SUCCESS!</font> Your profile changes were submitted to headquarters.</font></div>
    <%End If%>

    <%
        Else
            'Show Profile Form
            SQLQuery = "SELECT * FROM tblPeople WHERE PeopleID = " & CInt(ASCDCMemberID) & ";"
            'response.write(SQLQuery)
            Set ASCDCProfile = connASCDC.Execute(SQLQuery)
            If ASCDCProfile.EOF Then
                Response.write("<font color=""#FF0000"">We could not find a match in the database...please contact <a href=""mailto:info@ascdc.org"">support</a> for futher assistance. Please include your email address associated with your membership and full name.</font>")
            Else
%>														


    <form class="form" id="frmProfile" name="frmProfile" action="memProfile.asp" method="post">
        <span class="pageTitle">Member Profile<div class="arrow-down"></div></span>
        <div class="fWrap">
            <span>User Name*</span><input type="text" name="UserID" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("UserID")%><%Else%><%=Request("UserID")%><%End If%>"></input>
        </div>
        <div class="fWrap">
            <span>Password*</span><input type="password" name="password" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("Password")%><%Else%><%=Request("Password")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPassword" value="<%=ASCDCProfile("Password")%>">
        <div class="fWrap">
            <span>Confirm Password*</span><input type="password" name="ConfPassword" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("Password")%><%Else%><%=Request("ConfPassword")%><%End If%>"></input>
        </div>
        <div class="fWrap">
            <span>Email*</span><input type="text" name="email" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("Email")%><%Else%><%=Request("Email")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldEmail" value="<%=ASCDCProfile("Email")%>">
        <br><br>
        <div class="fWrap">
            <span>Opt-Out of Online Member Directory?</span><input class="chkbx" type="checkbox" name="Opt_Out_Online_Directory" value="1"<%If ASCDCProfile("Opt_Out_Online_Directory") =1 Then%> checked<%End If%>></input>
        </div>
        <input type="hidden" name="oldOpt_Out_Online_Directory" value="<%=ASCDCProfile("Opt_Out_Online_Directory")%>">
        <div class="fWrap">
            <span>Salutation</span><input type="text" name="Salutation" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("Salutation")%><%Else%><%=Request("Salutation")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldSalutation" value="<%=ASCDCProfile("Salutation")%>">
        <div class="fWrap">
            <span>First Name*</span><input type="text" name="FName" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("FName")%><%Else%><%=Request("FName")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFName" value="<%=ASCDCProfile("FName")%>">
        <div class="fWrap">
            <span>Middle Name/Initial</span><input type="text" name="MName" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("MName")%><%Else%><%=Request("MName")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldMName" value="<%=ASCDCProfile("MName")%>">
        <div class="fWrap">
            <span>Last Name*</span><input type="text" name="LName" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("LName")%><%Else%><%=Request("LName")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldLName" value="<%=ASCDCProfile("LName")%>">
        <div class="fWrap">
            <span>Suffix</span><input type="text" name="Suffix" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("Suffix")%><%Else%><%=Request("Suffix")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldSuffix" value="<%=ASCDCProfile("Suffix")%>">
        <br><br>
        <div class="fWrap">
            <span>Home Address 1</span><input type="text" name="PAdrsL1" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PAdrsL1")%><%Else%><%=Request("PAdrsL1")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPAdrsL1" value="<%=ASCDCProfile("PAdrsL1")%>">
        <div class="fWrap">
            <span>Home Address 2</span><input type="text" name="PAdrsL2" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PAdrsL2")%><%Else%><%=Request("PAdrsL2")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPAdrsL2" value="<%=ASCDCProfile("PAdrsL2")%>">
        <div class="fWrap">
            <span>Home City</span><input type="text" name="PCity" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PCity")%><%Else%><%=Request("PCity")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPCity" value="<%=ASCDCProfile("PCity")%>">
        <div class="fWrap">
            <span>Home State</span><input type="text" name="PState" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PState")%><%Else%><%=Request("PState")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPState" value="<%=ASCDCProfile("PState")%>">
        <div class="fWrap">
            <span>Home Zip</span><input type="text" name="PZip" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PZip")%><%Else%><%=Request("PZip")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPZip" value="<%=ASCDCProfile("PZip")%>">
        <br><br>
        <div class="fWrap">
            <span>Home Phone</span><input type="text" name="PPhone" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PPhone")%><%Else%><%=Request("PPhone")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPPhone" value="<%=ASCDCProfile("PPhone")%>">
        <div class="fWrap">
            <span>Home/Office Fax</span><input type="text" name="PFax" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfile("PFax")%><%Else%><%=Request("PFax")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldPFax" value="<%=ASCDCProfile("PFax")%>">
        <br><br>

        <%
                                                                        'Lookup Firm Info
                                                                        SQLQuery = "SELECT * FROM tblFirms WHERE FirmID = " & CInt(ASCDCProfile("FirmID")) & ";"
                                                                        'response.write(SQLQuery)
                                                                        Set ASCDCProfileFirm = connASCDC.Execute(SQLQuery)
                                                                        If ASCDCProfileFirm.EOF Then
                                                                            Response.write("<tr><td colspan=""2""><font color=""#FF0000"">We could not find a match in the database for your Firm...please contact <a href=""mailto:info@ascdc.org"">support</a> for futher assistance. Please include your email address associated with your membership and full name.</font></td></tr>")
                                                                        Else
%>

        <div class="fWrap">
            <span>Firm Name*</span><input type="text" name="FirmName" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmName")%><%Else%><%=Request("FirmName")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmName" value="<%=ASCDCProfileFirm("FirmName")%>">
        <div class="fWrap">
            <span>Firm Address 1*</span><input type="text" name="FirmAdrsL1" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmAdrsL1")%><%Else%><%=Request("FirmAdrsL1")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmAdrsL1" value="<%=ASCDCProfileFirm("FirmAdrsL1")%>">
        <div class="fWrap">
            <span>Firm Address 2</span><input type="text" name="FirmAdrsL2" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmAdrsL2")%><%Else%><%=Request("FirmAdrsL2")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmAdrsL2" value="<%=ASCDCProfileFirm("FirmAdrsL2")%>">
        <div class="fWrap">
            <span>Firm City*</span><input type="text" name="FirmCity" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmCity")%><%Else%><%=Request("FirmCity")%><%End If%>" size="50"></input>
        </div>
        <input type="hidden" name="oldFirmCity" value="<%=ASCDCProfileFirm("FirmCity")%>">
        <div class="fWrap">
            <span>Firm State*</span><input type="text" name="FirmState" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmState")%><%Else%><%=Request("FirmState")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmState" value="<%=ASCDCProfileFirm("FirmState")%>">
        <div class="fWrap">
            <span>Firm Zip*</span><input type="text" name="FirmZip" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmZip")%><%Else%><%=Request("FirmZip")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmZip" value="<%=ASCDCProfileFirm("FirmZip")%>">
        <br><br>
        <div class="fWrap">
            <span>Firm Phone*</span><input type="text" name="FirmPhone" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmPhone")%><%Else%><%=Request("FirmPhone")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmPhone" value="<%=ASCDCProfileFirm("FirmPhone")%>">
        <div class="fWrap">
            <span>Firm Fax</span><input type="text" name="FirmFax" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmFax")%><%Else%><%=Request("FirmFax")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmFax" value="<%=ASCDCProfileFirm("FirmFax")%>">
        <div class="fWrap">
            <span>Firm County*</span><input type="text" name="County" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("County")%><%Else%><%=Request("County")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldCounty" value="<%=ASCDCProfileFirm("County")%>">
        <br><br>
        <div class="fWrap">
            <span>Firm Size (#of lawyers)*</span><input type="text" name="FirmSize" value="<%If Not Request("ASCDCUpdateCorrection") = 1 Then%><%=ASCDCProfileFirm("FirmSize")%><%Else%><%=Request("FirmSize")%><%End If%>"></input>
        </div>
        <input type="hidden" name="oldFirmSize" value="<%=ASCDCProfileFirm("FirmSize")%>">
        <br><br>
        <div class="fWrap">
            <span>Comments/Instructions for Headquarters</span><textarea name="Comments" id="" cols="30" rows="10"><%If Not Request("ASCDCUpdateCorrection") = 1 Then%>Enter Any Comments/Instructions For Headquarters<%Else%><%=Request("Comments")%><%End If%></textarea>
        </div>
        <div class="fWrap">
           <span>Submit When Finished:</span><div><input class="btn" type="button" name="SubmitIt" value="Submit"><div class="checkmark"></div></input></div>
        </div>
        <input type="hidden" name="varUpdate" id="varUpdate" value="1">
<%
																	End If
%>
    <script type="text/javascript" language="JavaScript"><!--
																		document.write('<input type="button" name="SubmitIt" value="Submit Profile Changes" onclick="checkIt(document.ProfileForm);">');	
																	//--></script>
    </form>

<SCRIPT LANGUAGE="JavaScript">

window.onload = function(){
    document.forms.ProfileForm.SubmitIt.disabled = false;
}

function checkIt(form) {

	var validUserID = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_@.";
	var ok = "yes";
	var temp;
	for (var i=0; i<form.UserID.value.length; i++) {
		temp = "" + form.UserID.value.substring(i, i+1);
		if (validUserID.indexOf(temp) == "-1") ok = "no";
	}
	if (ok == "no") {
		alert("You may only use the following characters for your Username:\r\r0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_@.");
		form.UserID.focus();
		form.UserID.select();
		return (false);
   }	
	
	if (form.UserID.value.length < 4) {
		alert("Please enter at least 4 characters in the \"User ID\" field.");
		form.UserID.focus();
		return (false);
	}
	

	var validPassword = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_";
	var ok = "yes";
	var temp;
	for (var i=0; i<form.Password.value.length; i++) {
		temp = "" + form.Password.value.substring(i, i+1);
		if (validPassword.indexOf(temp) == "-1") ok = "no";
	}
	if (ok == "no") {
		alert("You may only use the following characters for your Password:\r\r0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_");
		form.Password.focus();
		form.Password.select();
		return (false);
    }	
	
	if (form.Password.value.length < 4) {
		alert("Please enter at least 4 characters in the \"New Password\" field.");
		form.Password.focus();
		return (false);
	}	
	if (form.Password.value != form.ConfPassword.value) {
	  	alert("Password and Confirm Password fields do not match. Please enter them again.")
	  	form.Password.focus()
        return false
	}
	
	if (form.Email.value == "" || form.Email.value == " ") {
		alert("Please provide an e-mail address.");
		form.Email.focus();
		return (false);
	}
	
	if (form.Email.value.indexOf('@') == -1 || form.Email.value.indexOf('.') == -1) {
		alert("Please provide a VALID email address.");
		form.Eail.focus();
		return (false);
	}
	
	if (form.FName.value == "" || form.FName.value == " ") {
		alert("Please provide a First Name.");
		form.FName.focus();
		return (false);
	}
	
	if (form.FName.value == "" || form.FName.value == " ") {
		alert("Please provide a First Name.");
		form.FName.focus();
		return (false);
	}

	if (form.LName.value == "" || form.LName.value == " ") {
		alert("Please provide a Last Name.");
		form.LName.focus();
		return (false);
	}
	
	if (form.FirmName.value == "" || form.FirmName.value == " ") {
		alert("Please provide a Firm Name.");
		form.FirmName.focus();
		return (false);
	}
	
	if (form.FirmAdrsL1.value == "" || form.FirmAdrsL1.value == " ") {
		alert("Please provide a Firm Mailing Address.");
		form.FirmAdrsL1.focus();
		return (false);
	}	
  
	if (form.FirmCity.value == "" || form.FirmCity.value == " ") {
		alert("Please provide a Firm City for the address.");
		form.FirmCity.focus();
		return (false);
	}	
	
	if (form.FirmState.value == "" || form.FirmState.value == " ") {
		alert("Please provide a Firm State for the address.");
		form.FirmState.focus();
		return (false);
	}
	
	if (form.FirmZip.value == "" || form.FirmZip.value == " ") {
		alert("Please provide a Firm Zip for the address.");
		form.FirmZip.focus();
		return (false);
	}

	if (form.FirmPhone.value == "" || form.FirmPhone.value == " ") {
		alert("Please provide a Firm Phone.");
		form.FirmPhone.focus();
		return (false);
	}
	
	if (form.County.value == "" || form.County.value == " ") {
		alert("Please provide a Firm County.");
		form.County.focus();
		return (false);
	}
   
var submitted = false;
if(submitted == true) { return; }
form.SubmitIt.value = 'Please Wait...Processing';
form.SubmitIt.disabled = true;
submitted = true;	

	form.submit()
	return false
}
</SCRIPT>
</body>
</html>
