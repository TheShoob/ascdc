<!-- Begin LOGIN CHECK Include File -->
<%
'Check if logged in
Login_Err = 0
LoggedIn = 0
LongtermCookie = 0
SessionLive = 0
MemberActive  = 0
ASCDCUSERID = ""
'Check for cookies/session variables
If Not Request("LogOff") = 1 Then
If Not Request.Cookies("ASCDC_ID") = "" Then
	LongtermCookie = 1
	LoggedIn = 1
End If
If Not Session("ASCDC_ID") = "" Then
	SessionLive = 1
	LoggedIn = 1
End If
'Collect user information from database if logged in
If LoggedIn = 1 Then
 	If LongtermCookie = 1 Then
		SQLQuery = "SELECT PeopleID, MemberCode, UserID, FName, LName, Email FROM tblPeople WHERE UserID = '" & Request.Cookies("ASCDC_ID") & "';"
  	Else
   		SQLQuery = "SELECT PeopleID, MemberCode, UserID, FName, LName, Email FROM tblPeople WHERE UserID = '" & Session("ASCDC_ID") & "';"
  	End If
	Set ASCDCUser = connASCDC.Execute(SQLQuery)
  	'If no UserID match
  	If ASCDCUser.EOF Then
   		LoggedIn = 0
     	Login_Err = 1
		Response.Cookies("ASCDC_ID").Expires = Now - 1
   		Session("ASCDC_ID") = ""
   		Session.Abandon
   		Login_Message = "We did not find a matching ID in the member database. <strong>This may be because you just changed your Username</strong>. If you did, please login using your new login credentials.<P>If after doing so you continue to get this error, please use the 'Contact ASCDC' link to request support from the Webmaster or contact ASCDC directly."
	Else
		'Check all possible 'Active' MemberStatus
		ASCDCMemberID = ASCDCUser("PeopleID")
		'Response.write("MID = " & ASCDCMemberID)
		MemberStatus = ASCDCUser("MemberCode")
		varMemberName = replace(ASCDCUser("FName") & " " & ASCDCUser("LName"), "'", "''")
		varMemberEmail = ASCDCUser("Email")
		'varMemberEmail = replace(ASCDCUser("Email"), "'", "''")
		
		varPastPres = 0
		'If ASCDCUser("PastPres") = TRUE Then
			'varPastPres = 1
		'End If
		Select Case MemberStatus
			Case "MEM"
				MemberActive = 1
			Case "STAFF"
				MemberActive = 1
			Case "PEN"
				MemberActive = 1
			Case "COMP"
				MemberActive = 1
			Case Else
				MemberActive = 0
		End Select
		'If Account not Active
	  	If MemberActive = 0 Then
			LoggedIn = 0
	     	Login_Err = 2
			Response.Cookies("ASCDC_ID").Expires = Now - 1
	   		Session("ASCDC_ID") = ""
	   		Session.Abandon
	   		Login_Message = "We found a match for your login credentials. However, your membership is not currently active. Use the 'Contact' feature to request support if you wish to re-activate your membership."
	  	End If
	End If
Else
	If MembersOnly = 1 Then
		'Require Login
	  	Login_Err = 4
	   	Login_Message = "You are not logged in or your session has timed out. This 'Members Only' section requires you to be logged in as a member. Use the 'Contact' feature to request support if needed. You may login from the home page."
	End If
End If
If Not Login_Err = 0 Then
	If MembersOnly = 1 Then
		'Redirect To Login Page With Redirected Section/SubSection
		LoginRedirect = 1
		LoginRedirectReferrer = varSection
		If Not varSubSection = "" Then
			LoginRedirectReferrer = varSubSection
		End If
		Response.Redirect("#login.asp?LoginRedirect=" & LoginRedirect & "&Login_Err=" & Login_Err & "&LoginRedirectReferrer=" & LoginRedirectReferrer)
	Else
		LoginRedirect = 1
		Response.Redirect("#login.asp?LoginRedirect=" & LoginRedirect & "&Login_Err=" & Login_Err & "&Login_Message=" & Login_Message)
	End IF
End If
'Response.write("Login = " & LoggedIn)
End If
%>
<!-- End LOGIN CHECK Include File -->