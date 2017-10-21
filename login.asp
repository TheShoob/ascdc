<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>

<link rel="stylesheet" type="text/css" href="page.css">

</head>

<body>

	<span class="pageTitle">Login</span>

	<%
        'Check if redirected here...if so, present login form and login message
        If Cint(Request("LoginRedirect")) = 1 Then
            If Not Request("LoginRedirectReferrer") = "" Then
                'We need to look at the LoginRedirectReferrer to forward them to the referrer upon successful login.
                Select Case Request("LoginRedirectReferrer")
                    Case "Marketplace"
                        ForwardURL = "market.asp"
                    Case "Mem_Verdict"
                        ForwardURL = "publications.asp"
                    Case "Mem_Profile"
                        ForwardURL = "profile.asp"
                    Case "Mem_Directory_Ad"
                        ForwardURL = "only_directory_ad.asp"
                    Case "Mem_Mag_Ad"
                        ForwardURL = "only_mag_ad.asp"
                    Case "ANNOUNCEMENTS"
                        ForwardURL = "announcements.asp"
                    Case "RESOURCES - LEGISLATIVE"
                        ForwardURL = "default-services-industry-resources-advocates.asp"
                    Case "ADMIN"
                        ForwardURL = "Admin.asp"
                    Case "LOGO"
                        ForwardURL = "logo.asp"
                    Case "DirectoryAd"
                        ForwardURL = "Members_Only_Directory_Adv.asp"
                    Case "PHOTOALBUM"
                        ForwardURL = "gallery_new.asp"
                    Case "Mem_Listserve"
                        ForwardURL = "Profile_listserv.asp"
                    Case "MemberPhotoGallery"
                        ForwardURL = "mem_ASCDC_Photo_Gallery.asp"
                    Case Else
                        ForwardURL = "#default.asp"
                End Select
            Else
                ForwardURL = "#default.asp"
            End If
        End If
        ascdcForward = 0
        errorcode = 0
        LoggedIn = 0
        theSessionID = Request("theSessionID")
        If Request("LogOff") = 1 Then
            Response.Cookies("ASCDC_ID").Expires = Now - 1
            Session("ASCDC_ID") = ""
            Response.write("Logoff Successful!")
        Else
            Response.write("!?!?!?!")
            'Check if cookies are supported
            'get the current SessionID and compare it to the first one
            If theSessionID = Session.SessionID Then
                'use session variables
                SessionVariables = 1
            Else
                'don't use session variables or cookies :(
                errorcode = 1
            End If
            If SessionVariables = 1 Then
                ' ************************************************************************
                ' Escape single quotes to prevent SQL Injection
                ' ************************************************************************
                checkUSERNAME = Replace(Request("uname"),"'","''")
                checkPASSWORD = Replace(Request("psw"),"'","''")
                'checkPASSWORD = sha256("" & trim(checkPASSWORD))
                ' ************************************************************************
                ' Confirm login credentials
                ' ************************************************************************
                SQLQuery = "SELECT PeopleID, MemberCode, UserID, Password FROM tblPeople WHERE UserID = '" & checkUSERNAME & "' AND Password = '" & checkPASSWORD & "';"
                'response.write(SQLQuery)
                Set ASCDCUser = connASCDC.Execute(SQLQuery)
                If ASCDCUser.EOF Then
                    LoggedIn = 0
                    errorcode = 2
                    Response.Cookies("ASCDC_ID").Expires = Now - 1
                    Session("ASCDC_ID") = ""
                    Login_Message = "We could not find a match for the login credentials you provided (Username and/or Password). Please be aware that your credentials are <strong>CASE-SENSITIVE</strong>.<P>To request your username and password, please use the '<a href=http://www.ascdc.org/_Login.asp?varRetrieve=1><strong>Auto-Retrieve My Login Credentials</strong></a>' form to have your credentials automatically sent via the e-mail address associated with your membership.<P>If you believe you have an active membership and the credentials you provided are correct, please use the 'Contact Us' link on any page to get help (be sure to provide as much detail as you can). We apologize for any inconvenience."
                Else
                    'Grab the last dues payment for member
                    SQLQuery01 = "SELECT * FROM tblPayments WHERE (PeopleID = " & ASCDCUser("PeopleID") & ") AND (DuesYear <> NULL) ORDER BY DuesYear DESC;"
                    'response.write(SQLQuery01 & "<P>")
                    Set ASCDCMemberDues = connASCDC.Execute(SQLQuery01)
                    MemberActive = 0
                    CurrentYear = year(Date())
                    'Response.write("CurrentYear = " & CurrentYear & "<br>")
                    If Not ASCDCMemberDues.EOF Then
                        'Response.write("Checking Dues...<br>")
                        varLastYearPaid = ASCDCMemberDues("DuesYear")
                        'Response.write(ASCDCMemberDues("DuesYear") & "<br>")
                        If CInt(varLastYearPaid) >= CInt(CurrentYear) Then
                            MemberActive = 1
                        Else
                            'Check if we have passed the 90 Day grace period
                            varDueDate = "4/1/" & CurrentYear
                            'Response.write("DueDate: " & varDueDate & "<br>")
                            'Response.write("Date Diff = " & DateDiff("d", date(), varDueDate) & "<br>")
                            If DateDiff("d", date(), varDueDate) <= 0 Then
                                'we are expired
                                MemberActive = 0
                            Else
                                MemberActive = 1
                            End If
                            'Response.write("Member Active = " & MemberActive)
                        End If
                    Else
                        'Can't Find a payment for dues that matches this member
                        MemberActive = 0
                    End If
                    If MemberActive = 0 Then
                        LoggedIn = 0
                        errorcode = 3
                        Response.Cookies("ASCDC_ID").Expires = Now - 1
                        Session("ASCDC_ID") = ""
                        Login_Message = "We found a match for your login credentials. However, your membership is not currently active. Use the 'Contact' feature to request support if you wish to re-activate your membership. Membership dues are due on 1/1 of every year. You have a 90 day grace period to get them paid before you are not allowed to login to the site. It looks as though your 90 day grace period has lapsed."
                    End If
                    If errorcode = 0 Then
                        LoggedIn = 1
                        Session("ASCDC_ID") = ASCDCUser("UserID")
                        If Not 	Request("ForwardURL") = "" Then
                            'Forward to Forward URL
                            If Request("chkMySaveCookie") = 1 Then
                                Response.Cookies("ASCDC_ID")=ASCDCUser("UserID")
                                Response.Cookies("ASCDC_ID").Expires=Now + 365
                            End If
                            Response.Redirect(Request("ForwardURL"))
                        End If
                        Login_Message = "You have successfully logged in and can now access Member's Only content."
                        If Request("chkMySaveCookie") = 1 Then
                            Response.Cookies("ASCDC_ID")=ASCDCUser("UserID")
                            Response.Cookies("ASCDC_ID").Expires=Now + 365
                            Login_Message = "You have successfully logged in and can now access Member's Only content. We have also saved a cookie to your computer that, if not deleted, will save your login state for ASCDC.org for 365 days. Please be sure to save your username and password in a secure place so that you will have it when you are required to login again."
                        End IF
                        'Forward to HomePage Append
                        Login_Message = Login_Message & "<P>We will now automatically forward you to the resource you were trying to access..."
                        ascdcForward = 1
                    End If
                End If
            Else
                'don't use session variables or cookies :(
                errorcode = 1
                Login_Message = "We have determined that your browser does not allow Cookies.<br><br><strong>NOTE: Some actions, such as logging out and them immediately trying to login again or leaving your browser open at ASCDC.org for an extended period of time before attempting to login may reset your session variable or cause it to time-out. This will cause this error, in which case you should close your browser completely and return to ascdc.org to attempt to login again.</strong><br><br>In order to login to this site you must at least allow Session Cookies (Session Cookies are temporary Cookies that are stored on your computer when you login to this site and are deleted when you logout or close your browser). <P>Also, if you allow First-party Cookies, this will allow you to store your ID on your computer by selecting 'Save Login' so that you are not required to login every time you visit the site.<br><br><strong>NOTE: WE DO NOT STORE YOUR PASSWORD IN COOKIES!</strong><P> If you need help determining how to change the settings in your browser to allow session cookies please see this link: <a href=""http://www.google.com/cookies.html"" target=""_blank""><strong>How to Enable Cookies</strong></a><P>Sorry for any inconvenience. If you need help, please use the 'Contact ASCDC' link to request help."
            End If
        End If
    %>
  

</body>

</html>
