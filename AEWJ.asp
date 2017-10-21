<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>


<head>
		<!--#include file="inc/_inc_DB_Conn.asp" -->
		<!-- #include file="adovbs.inc" -->

	<title>ASCDC</title>

<!--|| All COMON JAVASCRIPT ||-->
	<!--#include file="inc/common.js" -->
	<!--|| END All COMON JAVASCRIPT ||-->
	
	
<link href="main.css" rel="stylesheet" type="text/css" />
	
	
	
	
</head>




<body>
<!--#include file="inc/menuanchor.asp" -->
	<div id="container">
		<div id="wrapper">

            <!--||HEADER||-->
            
          <div id="mainheader">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" valign="middle"> 
						<img src="images/logoheader.png"/>			
					</td>
					<td height="100%" align="right" valign="middle">
						
						<!--#include file="inc/rightheader.asp" -->
						
					</td>
					</tr>
					<tr>
					<td valign="bottom" align="right"> 
						
					</td>
				</tr>
			</table>
		</div>
            <!--||END HEADER||-->
            
                <!--||MID AREA WITH PICTURES||-->
            <div id="maincontent">
            	<!--||NAV||-->
                  <!--#include file="inc/nav.asp" -->
				<!--||end NAV||-->  
                <table width="1024" height="300px" border="0" cellpadding="17" bgcolor="#FFFFFF" class="mytable">
                    <tr>
						<td>
						<!--||Rotator||-->
							
							
							
							
							<table border="0">
								<tr>
									<td valign="top">
							
							
							
							
							
										<table border="0" align="left" valign="top">
											<tr bgcolor="#ffffff" width="635px">
			                       				<td valign="top">
													
			                        			<!--||INC For Banner Ads||-->
													<!--#include file="inc/bannerads.asp" -->
			                        			<!--||END INC For Banner Ads||-->
			                       				</td>
												
												
												
											</tr>
												<tr  width="635px">
											<!--||Main Content Area||-->
													<td>
											
												<div id="maintitle">
													ANNUAL EVENING WITH THE JUDGES COMPLIMENTARY REGISTRATION
												</div>
												<div id="maintextarea">
													<!--||Main Content Goes Here||-->
                                                    

													<%	
													
													
													
														If Request("varUpdate") = 1 Then
															'Form Submitted
						
						ASCDCerror = 0
						
						If ASCDCerror = 0 Then
							'Declare the variables
							Dim con
							Dim rst
							Dim strSQL
							
							varComments = Request("Comments")
							
							'Mailer
							Set Mailer = Server.CreateObject("JMail.Message")
							Mailer.FromName    =	"ascdc.org"
							Mailer.From			 =	"info@ascdc.org"
							Mailer.AddRecipient 	"info@ascdc.org", "ASCDC Mgmt Staff"
							Mailer.AddRecipient 	"michael@camgmt.com", "ASCDC Webmaster"
							Mailer.Subject     =	"ASCDC: Annual Evening With The Judges Complimentary Registration"
							
							Mailer.Body    =	"The following registration was submitted:"
							Mailer.AppendText vbcrlf & " "
							Mailer.AppendText vbcrlf & " "
							
							If Request("NewMem") = 1 Then
								Mailer.AppendText    vbcrlf &	"New Member in 2016: YES"
								Mailer.AppendText    vbcrlf &	""
							Else
								Mailer.AppendText    vbcrlf &	"New Member in 2016: NO"
								Mailer.AppendText    vbcrlf &	""
							End If
							
							If Request("Judge") = 1 Then
								Mailer.AppendText    vbcrlf &	"Judge: YES"
								Mailer.AppendText    vbcrlf &	""
							Else
								Mailer.AppendText    vbcrlf &	"Judge: NO"
								Mailer.AppendText    vbcrlf &	""
							End If
							
							Mailer.AppendText    vbcrlf &	"Full Name: " & Request("FullName")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"Firm/Court: " & Request("Firm_Court")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"Address: " & Request("Address")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"City, State & Zip: " & Request("CityStateZip")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"Email: " & Request("Email")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"Phone: " & Request("Phone")
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	"Comments: "
							Mailer.AppendText    vbcrlf &	""
							Mailer.AppendText    vbcrlf &	Request("Comments")
					
							Mailer.Priority    = 	1
							if Mailer.Send("mail.midtownmicro.com:25") then
							  Response.Write "<UL><LI><font class=""ASCDC""><font size=""2"">Thank you for submitting your registration.<br><br>See you at the event!</font></font></UL>"
							else
							  Response.Write "<UL><LI><font class=""ASCDC""><font color=""#FF0000"">ERROR:</font>There was an error sending the request via email to headquarters.<BR><BR>Please send an e-mail to our <a href=""mailto:wev@camgmt.com?Subject=ASCDC AEWJ Registration E-mail ERROR""> Web Team  </a> and please copy & paste the above error message. We apologize for any inconvenience this error has caused. Our web team will address this for you ASAP.</font></UL>"
							end if
						
						End If
                    Else
%>
																
																<div align="center"><strong>* indicates required fields</strong></div>
																<table width="100%" border="0" cellspacing="2" cellpadding="2">
																	<form action="AEWJ.asp" method="post" name="ProfileForm" id="ProfileForm">
																	
																	<tr>
																		<td colspan="2" width="40%"><font class="bluefont"><strong>PLEASE SELECT ONE*</strong>:</font></td>
																	</tr>
																	<tr>
																		<td colspan="2" width="40%"><font class="bluefont">New Member in 2016:</font><input type="checkbox" name="NewMem" id="NewMem" value="1"> <strong>OR</strong> <font class="bluefont">Judge:</font><input type="checkbox" name="Judge" id="Judge" value="1"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">Full Name*</font></td>
																		<td><input type="text" name="FullName" value="" size="50"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">Firm/Court*</font></td>
																		<td><input type="text" name="Firm_Court" value="" size="50"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">Address*</font></td>
																		<td><input type="text" name="Address" value="" size="50"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">City, State & Zip*</font></td>
																		<td><input type="text" name="CityStateZip" value="" size="50"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">Email*</font></td>
																		<td><input type="text" name="Email" value="" size="50"></td>
																	</tr>
																	<tr>
																		<td width="40%"><font class="bluefont">Phone*</font></td>
																		<td><input type="text" name="Phone" value="" size="50"></td>
																	</tr>
																	
																		<tr>
																			<td><font class="bluefont">Comments/Questions: </font></td>
																			<td><textarea cols="20" rows="3" name="Comments" style="font-size: 12pt; background-color: FFFFFF; color: 000000; font-weight: 545; width: 300px;"></textarea></td>
																		</tr><input type="hidden" name="varUpdate" id="varUpdate" value="1">
																	<tr>

																		</tr>

																		<td>
																			<font class="bluefont">Submit When Finished:</font>
																		</td>
																		<td align="center">
																		
																		
																		<script type="text/javascript" language="JavaScript"><!--
																		
																		document.write('<input type="button" name="SubmitIt" value="Submit Registration" onclick="checkIt(document.ProfileForm);">');
																		
																		//--></script>
																		
																		</td>
																	</tr>
																	</form>
																</table><br>
<div align="center"><strong>NOTE:</strong> If you would like to bring a guest,<br>there is a $75.00 fee. Please use <a href="/PDF/2016 Annual Evening with the Judges Invite and RSVP Card.pdf"><strong><u>THIS FORM</u></strong></a>.</div>
																
<%

														End If

%>


                                                    

                                                    
                                                    
                                                    
                                                    
                                                    <!--||END Main Content Goes Here||-->
												</div>
													</td>
												</tr>
											
										</table>
										<br>
			
										
										
										
										
										</td>
										<td id="divider">
                                    	</td>
                                    
                                   		<td valign="top" align="right">
										
										<!--||this is the Right Side Pannle||-->
										<!--#include file="inc/rightside.asp" -->
										<!--||this is the END of Right Side Pannle||-->
									
							</td>
							</tr>
							</table>
							
							
							
                        </td>
                    </tr>
                </table>
                <!--#include file="inc/footer.asp" -->
            </div>
				<!--||END MID AREA WITH PICTURES||-->
          
      </div>
	 </div>
<SCRIPT LANGUAGE="JavaScript">

window.onload = function(){
    document.forms.ProfileForm.SubmitIt.disabled = false;
}

function checkIt(form) {


	if (form.FullName.value == "" || form.FullName.value == " ") {
		alert("Please provide a Full Name.");
		form.FullName.focus();
		return (false);
	}
	
	if (form.Firm_Court.value == "" || form.Firm_Court.value == " ") {
		alert("Please provide a Firm or Court Name.");
		form.Firm_Court.focus();
		return (false);
	}

	if (form.Address.value == "" || form.Address.value == " ") {
		alert("Please provide an Address.");
		form.Address.focus();
		return (false);
	}
	
	if (form.CityStateZip.value == "" || form.CityStateZip.value == " ") {
		alert("Please provide a City, State and Zip.");
		form.CityStateZip.focus();
		return (false);
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
	
	if (form.Phone.value == "" || form.Phone.value == " ") {
		alert("Please provide a Phone Number.");
		form.Phone.focus();
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
