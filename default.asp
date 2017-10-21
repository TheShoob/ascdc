<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
		<!--#include file="inc/inc_DB_Conn.asp" -->
		<!--#include file="inc/inc_Login_Check.asp" -->
		<title>ASCDC - Association of Southern California Defense Councel test</title>
		<link rel="stylesheet" type="text/css" href="main.css">
	</head>
	<body>
		<div id="container" class="center">
			<div class="swipeArea"></div>
			<div id="sidebar-left" class="sidebar">
				<ul>
					<div class="logo"><div style="width: 240px; height: 80px; background-color: transparent;" id="bodymovin"></div></div>
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#home.html">Home</a>
					</li>
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#memServices.html">Member Services</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#memProfile.html" alt="">Member Profile</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#expertWitnessDb.asp" alt="">Expert Witness Database</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#memRenewals.html" alt="">Membership</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#memPhotoGalleries.asp" alt="">Member Photo Galleries</a></div>
					</li>
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#verdictMagazine.html">Verdict Magazine</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#submitTrialResultsForPublication.html" alt="">Submit Trial Results for Publication</a></div>
					</li>	
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#amicus.html">Amicus</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#amicusCommittee.html" alt="">Amicus Committee</a></div>
					</li>
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#events.html">Events</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#annualSeminar.html" alt="">Annual Seminar</a></div>
					</li>	
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#resources.html">Resources</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#legProgram.html" alt="">Legislative Program</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#memSearch.html" alt="">Member Search</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#podcasts.html" alt="">Podcasts</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#photos.html" alt="">Photos</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#exemplar.html" alt="">Exemplar MIL’s, Briefs and Transcripts</a></div>
					</li>
					<!--<li class="navLink">--><!--link-->
						<!--<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#charity.html">ASCDC Cares</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent">--><!--sublinks-->
						<!--<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#volunteerOps.html" alt="">Volunteer Opportunies</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#partnerCharities.html" alt="">Partner Charities</a></div>
					</li>-->
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#aboutUs.html">About Us</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#contactUs.html" alt="">Contact Us</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#officersAndDirectors.html" alt="">Officers and Directors</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#appointedCommitteeChairs.html" alt="">Appointed Committee Chairs</a></div>
					</li>	
					<li class="navLink"><!--link-->
						<svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use><use class="underLink" xlink:href="icons.svg#under-icon"></use></svg><a href="#marketplace.html">Marketplace</a><svg class="plus"><use xlink:href="icons.svg#x-icon"></use></svg>
					</li>
					<li class="expandContent"><!--sublinks-->
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#vendorMarket.html" alt="">Vendor Market</a></div>
						<div><svg class="dot"><use class="onLink" xlink:href="icons.svg#on-icon"></use></svg><a href="#memberMarket.html" alt="">Member Market</a></div>
					</li>	
					<div class="q-btns" id="q-btn-D">
						<a href="https://www.facebook.com/Association-of-Southern-California-Defense-Counsel-ASCDC-153842077992834/"><svg><use xlink:href="icons.svg#w-facebook-icon"></use></svg></a>
						<a href="https://www.linkedin.com/groups/5016867"><svg><use xlink:href="icons.svg#w-linkedin-icon"></use></svg></a>
						<a href="https://www.youtube.com/channel/UCsj_ILgABrCrDf_ggwB-7oQ"><svg><use xlink:href="icons.svg#w-youtube-icon"></use></svg></a>
						<a href=""></a>
						<a href=""></a>
					</div>
				</ul>
			</div>
			<div id="sidebar-right" class="sidebar">
				<ul>
					<div class="box login">
					<%
						'Response.write("TEST COOKIE: " & Request.Cookies("ASCDC_ID"))
						'Response.write("TEST SESSION: " & Session("ASCDC_ID"))
					%>
					<%If LoggedIn = 1 Then%>
						<div class="icon"><svg><use xlink:href="icons.svg#user-icon"></use></svg></div>
						<span class="memName"><%=varMemberName%></span><br/><br/>
						<form action="" method="post" name="FrmLogOff" id="FrmLogOff">
							<input type="hidden" name="LogOff" id="LogOff" value=1>
							<button class="logoff" type="submit" form="FrmLogOff" value="Log Off"><svg><use xlink:href="icons.svg#logoff-icon"></use></svg></button>
						</form>
							
					<%Else%>
					
						<div class="icon"><svg><use xlink:href="icons.svg#user-icon"></use></svg></div>
						<span>LOGIN</span>
						
						

						<form action="" method="post" name="login" id="login">
							<span class="remember">Click to remember login</span><input type="checkbox" id="chkMySaveCookie" name="chkMySaveCookie" value="1" checked>
				<!--here--> <input type="text" placeholder="Enter Username" name="uname" value="" required>
							<input type="password" placeholder="Enter Password" name="psw" value="" required>
							<input type="hidden" name="theSessionID" id="theSessionID" value="<%=Session.SessionID%>">
							<input type="hidden" name="LoginRedirectReferrer" id="LoginRedirectReferrer" value="<%=Request("LoginRedirectReferrer")%>">
							<input type="hidden" name="LoginRedirect" id="LoginRedirect" value=1>
							<button class="login" type="submit" form="login" value="Submit"><svg><use xlink:href="icons.svg#login-icon"></use></svg></button>
						</form>
						<form action="" method="post" name="LoginRetrieve" id="LoginRetrieve">
							<input type="hidden" name="varRetrieve" id="varRetrieve" value=1>
							<button class="forgot" type="submit" form="LoginRetrieve" value="Forgot"><svg><use xlink:href="icons.svg#forgot-icon"></use></svg></button>
						</form>
						<%If Request("varRetrieve") = 1 Then%>
							<%If Request("varDoIt") = 1 Then%>
							Processing Request...
							
<%
								SQLQuery = "SELECT EMail, UserID, Password FROM tblPeople WHERE EMail = '" & request("txtEmail") & "';"
								'response.write(SQLQuery)
								Set ASCDCLogin = connASCDC.Execute(SQLQuery)
								If ASCDCLogin.EOF Then
									Response.write("<P><strong><font color=""#FF0000"">No Email Match Found</font></strong>...Please Contact ASCDC directly at: 916-239-4082</P>")
								Else
									'Send It
									SendResults = "ASCDC CREDENTIAL RETRIEVAL. "& vbcrlf & "Here is your requested login credentials: "& vbcrlf & vbcrlf & "UserID: " & ASCDCLogin("UserID") & vbcrlf &  "Password: " & ASCDCLogin("Password")
									'Now Send Email
									emailaddress = ASCDCLogin("EMail")
									Set Mailer = Server.CreateObject("JMail.Message")
									Mailer.FromName    =  "ASCDC AUTO-REPLY"
									Mailer.From =  "info@ascdc.org"
									Mailer.AddRecipient   emailaddress, emailaddress
									Mailer.AddRecipientBCC "michael@camgmt.com", "ASCDC Webmaster"
									Mailer.AddRecipientBCC "kim@camgmt.com", "Kim Ingersoll"
									Mailer.Subject     =  "ASCDC Credentials Retrieval"
									Mailer.Body    =  SendResults
									Mailer.Priority     = 1
									if not Mailer.Send("mail.midtownmicro.com:25") then
									  	'We got an error
										Response.write("ERROR SENDING E-MAIL: " & Mailer.Response)
										Response.write("<BR>Please send an e-mail to our <a href=""mailto:michael@camgmt.com?Subject=Lost Credential E-mail ERROR""> WEBMASTER </a> and please copy & paste the above error. We apologize for any inconvenience this error has caused. Our Webmaster will address this for you ASAP. If you need additional help or you cannot reach the Webmaster, please call ASCDC directly at: Welcome to the new ascdc.org website! We apologize for any inconvenience as we have some functionality that is not yet fully implemented, but will be very soon. If you have any questions, please don't hesitate to call the main office at 800-564-6791")
									else
										'email sent okay
										Response.write("Your login credentials have been emailed to " & emailAddress & ".  An e-mail should arrive shortly.")
									end if
								End If
%>
							
							<%Else%>
								<table border="0" cellspacing="2" cellpadding="2" align="center">
								<form action="_Login.asp" method="post" name="frmRet" id="frmRet">
								<tr>
								<td><font size="1" class="basefont"><strong>Email Address:</strong></font></td>
								<td><input type="text" name="txtEmail" id="txtEmail" size="15"></td>
								</tr>
								<input type="hidden" name="varRetrieve" id="varRetrieve" value=1>
								<input type="hidden" name="varDoIt" id="varDoIt" value=1>
								<tr>
								<td colspan="2">
									<input type="submit" name="LoggOff" value="Retrieve My Login Credentials">
								</td>
								</form>
								</tr>
								</table>
							<%End If%>
						<%End If%>

						
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
										ForwardURL = "http://ascdc.org/_dev/"
								End Select
							Else
								ForwardURL = "http://ascdc.org/_dev/"
							End If
						End If
						ascdcForward = 0
						errorcode = 0
						LoggedIn = 0
						theSessionID = Request("theSessionID")
						If Request("LogOff") = 1 Then
							Response.Cookies("ASCDC_ID").Expires = Now - 1
							Session("ASCDC_ID") = ""
							Response.write("<div class='successLog'>Logoff Successful!!</div>")
						Else
							'Response.write("!?!?!?!")
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
									Response.write("We could not find a match for the login credentials you provided (Username and/or Password). Please be aware that your credentials are <strong>CASE-SENSITIVE</strong>.<P>To request your username and password, please use the '<a href=http://www.ascdc.org/_Login.asp?varRetrieve=1><strong>Auto-Retrieve My Login Credentials</strong></a>' form to have your credentials automatically sent via the e-mail address associated with your membership.<P>If you believe you have an active membership and the credentials you provided are correct, please use the 'Contact Us' link on any page to get help (be sure to provide as much detail as you can). We apologize for any inconvenience.")
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
										Response.write("We found a match for your login credentials. However, your membership is not currently active. Use the 'Contact' feature to request support if you wish to re-activate your membership. Membership dues are due on 1/1 of every year. You have a 90 day grace period to get them paid before you are not allowed to login to the site. It looks as though your 90 day grace period has lapsed.")
									End If
									If errorcode = 0 Then
										LoggedIn = 1
										Session("ASCDC_ID") = ASCDCUser("UserID")
										'Response.write("You have successfully logged in and can now access Member's Only content.")
										Login_Message = "You have successfully logged in and can now access Member's Only content."
										If Request("chkMySaveCookie") = 1 Then
											Response.Cookies("ASCDC_ID")=ASCDCUser("UserID")
											Response.Cookies("ASCDC_ID").Expires=Now + 365
											Response.write("You have successfully logged in and can now access Member's Only content. We have also saved a cookie to your computer that, if not deleted, will save your login state for ASCDC.org for 365 days. Please be sure to save your username and password in a secure place so that you will have it when you are required to login again.")
											Login_Message = "You have successfully logged in and can now access Member's Only content. We have also saved a cookie to your computer that, if not deleted, will save your login state for ASCDC.org for 365 days. Please be sure to save your username and password in a secure place so that you will have it when you are required to login again."
										End IF
										If Not Request("ForwardURL") = "" Then
											'Forward to Forward URL
											Response.Redirect(Request("ForwardURL"))
										Else
											Response.Redirect("http://ascdc.org/_dev/")
										End If
									End If
								End If
							Else
								'don't use session variables or cookies :(
								'errorcode = 1
								'Response.write("We have determined that your browser does not allow Cookies.<br><br><strong>NOTE: Some actions, such as logging out and them immediately trying to login again or leaving your browser open at ASCDC.org for an extended period of time before attempting to login may reset your session variable or cause it to time-out. This will cause this error, in which case you should close your browser completely and return to ascdc.org to attempt to login again.</strong><br><br>In order to login to this site you must at least allow Session Cookies (Session Cookies are temporary Cookies that are stored on your computer when you login to this site and are deleted when you logout or close your browser). <P>Also, if you allow First-party Cookies, this will allow you to store your ID on your computer by selecting 'Save Login' so that you are not required to login every time you visit the site.<br><br><strong>NOTE: WE DO NOT STORE YOUR PASSWORD IN COOKIES!</strong><P> If you need help determining how to change the settings in your browser to allow session cookies please see this link: <a href=""http://www.google.com/cookies.html"" target=""_blank""><strong>How to Enable Cookies</strong></a><P>Sorry for any inconvenience. If you need help, please use the 'Contact ASCDC' link to request help.")
								'Login_Message = "We have determined that your browser does not allow Cookies.<br><br><strong>NOTE: Some actions, such as logging out and them immediately trying to login again or leaving your browser open at ASCDC.org for an extended period of time before attempting to login may reset your session variable or cause it to time-out. This will cause this error, in which case you should close your browser completely and return to ascdc.org to attempt to login again.</strong><br><br>In order to login to this site you must at least allow Session Cookies (Session Cookies are temporary Cookies that are stored on your computer when you login to this site and are deleted when you logout or close your browser). <P>Also, if you allow First-party Cookies, this will allow you to store your ID on your computer by selecting 'Save Login' so that you are not required to login every time you visit the site.<br><br><strong>NOTE: WE DO NOT STORE YOUR PASSWORD IN COOKIES!</strong><P> If you need help determining how to change the settings in your browser to allow session cookies please see this link: <a href=""http://www.google.com/cookies.html"" target=""_blank""><strong>How to Enable Cookies</strong></a><P>Sorry for any inconvenience. If you need help, please use the 'Contact ASCDC' link to request help."
							End If
						End If
					End If
    				%>
					</div>
					<div class="box events">
						<div class="icon">
							<svg><use xlink:href="icons.svg#calendar-icon"></use></svg>
						</div>
						<span>EVENTS</span>
			
						<div class="event">
							<a href="#events.html" class="eventDate">???NOV<br>2</a><a href="#events.html" class="eventTitle"><span>Brown Bag at VCSC with Judges O'Neill and Reiser</span></a><a href="http://ascdc.org/PDF/Nov-2017-Ventura-Brown-Bag.pdf" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>
						<div class="event">
							<a href="#events.html" class="eventDate">NOV<br>14</a><a href="#events.html" class="eventTitle"><span>Business Development for Women</span></a><a href="http://ascdc.org/PDF/ASCDC%20Biz%20Development%20for%20Women%202017.pdf" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>			
						<div class="event">
							<a href="#events.html" class="eventDate">NOV<br>16</a><a href="#events.html" class="eventTitle"><span>Latest Developments in the <em>Howell</em> Paradigm</span></a><a href="http://ascdc.org/PDF/ASCDC%20Hot%20Topic%20-%20Howell%2017.pdf" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>
						<div class="event">
							<a href="#events.html" class="eventDate">NOV<br>30</a><a href="#events.html" class="eventTitle"><span>Construction Defect Seminar & Judicial Reception</span></a><a href="" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>
						<div class="event">
							<a href="#events.html" class="eventDate">DEC<br>12</a><a href="#events.html" class="eventTitle"><span>Hot Topic Seminar by ASCDC Lawyer Defense Committee</span></a><a href="" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>
						<div class="event">
							<a href="#events.html" class="eventDate">DEC<br>12</a><a href="#events.html" class="eventTitle"><span>Judicial and New Member Reception</span></a><a href="" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>						
						<div class="event">
							<a href="#annualSeminar.html" class="eventDate">FEB<br>8-9</a><a href="#annualSeminar.html" class="eventTitle">ASCDC 57th Annual Seminar</span></a><a href="http://ascdc.org/PDF/ASCDC%20AS18%20early-bird%20postcard.pdf" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>		
						<!--<div class="event">
							<a href="" class="eventDate">SEPT<br>14-15</a><a href="#events.html" class="eventTitle">Litigation Conference </a><a href="" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div>
						 <div class="event">
							<a href="" class="eventDate">AUG<br>20</a><a href="" class="eventTitle">Title of the event </a><a href="" class="eventDoc"><svg><use xlink:href="icons.svg#pdf-icon"></use></svg></a>
						</div> -->
					</div>
					<div class="box ad">
						<div id="rotator1">
							<a href="" target="_blank"><img height="80" src="img/ads/ad_02.png" width="300" /></a>
							<a href="" target="_blank"><img height="80" src="img/ads/ad_03.png" width="300" /></a>
							<a href="" target="_blank"><img height="80" src="img/ads/ad_04.png" width="300" /></a>
						</div>
					</div>
					<div class="box ad">
						<div id="rotator2">
							<a href="" target="_blank"><img height="80" src="img/ads/ad_02.png" width="300" /></a>
							<a href="" target="_blank"><img height="80" src="img/ads/ad_03.png" width="300" /></a>
							<a href="" target="_blank"><img height="80" src="img/ads/ad_04.png" width="300" /></a>
						</div>
					</div>
					<a href="#test1.html" class="box locate-a-member"><div class="icon"><svg><use xlink:href="icons.svg#spyglass-icon"></use></svg></div><span>LOCATE A <br>MEMBER</span></a>
					<a href="#test1.html" class="box listserve"><div class="icon"><svg xmlns="http://www.w3.org/2000/svg"><use xlink:href="icons.svg#listserv-icon"></use></svg></div><span>LISTSERVE <br>OPT IN/OUT</span></a>
				</ul>
			</div>
			<div class="main-content">
				<div id="menu-area-left" class="menu-area">
					<div class="menuBtn" id="menu-btn-left">
						<span class="bar"></span>
						<span class="bar"></span>
						<span class="bar"></span>
					</div>
				</div>
				<div class="q-btns" id="q-btn-M">
					<a href=""><svg><use xlink:href="icons.svg#facebook-icon"></use></svg></a>
					<a href=""><svg><use xlink:href="icons.svg#linkedin-icon"></use></svg></a>
					<a href=""><svg><use xlink:href="icons.svg#youtube-icon"></use></svg></a>
					<a href=""><svg><use xlink:href="icons.svg#mail-icon"></use></svg></a>
					<a href=""><svg><use xlink:href="icons.svg#phone-icon"></use></svg></a>
				</div>
				<div id="menu-area-right" class="menu-area">
					<div class="menuBtn" id="menu-btn-right">
						<span class="bar"></span>
						<span class="bar"></span>
						<span class="bar"></span>
					</div> 
				</div>
				<div id="content">
					<div id="loading" class="spinner">
						<div class="bounce1"></div>
						<div class="bounce2"></div>
						<div class="bounce3"></div>
					</div>
					<iframe src="home.html" name="contentFrame" id="changeSrc" frameborder="0" scrolling="no" width="100%" alt="main content area"></iframe>
				</div>
			</div>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script>window.jQuery || document.write('<script src="jquery-3.2.1.min.js">\x3C/script>')</script>
		<script type="text/javascript" src="jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" src="bodymovin.min.js"></script>
		<script type="text/javascript" src="main.js"></script>
		<script>
		var animData = {
			wrapper: document.getElementById('bodymovin'),
			animType: 'html',
			loop: false,
			prerender: true,
			autoplay: true,
			path: 'logo.json'
		};
		var anim = bodymovin.loadAnimation(animData);
	</script>		
	</body>
</html>