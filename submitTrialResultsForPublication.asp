<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/inc_Login_Check.asp" -->
<title>Verdict Publication Submission</title>
<link rel="stylesheet" type="text/css" href="page.css">
</head>

<body>
        <span class="pageTitle">Verdict Publication Submission<div class="arrow-down"></div></span>
        
    <h1>Trial Publication Submission</h1>
    <h3>Describe your Defense Verdict for Publication in Verdict Magazine</h3>
    <p>
        Let us help you advertise your trial successes! Have you won a defense verdict in a jury trial? Have you obtained a defense judgment in a bench trial, or following a dispositive ruling during or after trial, such as by nonsuit, directed verdict, or JNOV? If so, complete the information in the form below (or <a href="http://info.legalsolutions.thomsonreuters.com/trialsdigest/form.asp" target="_blank">submit your favorable trial result to Westlaw</a> and <a href="mailto:ascdc@camgmt.com?subject=Defense Verdict Submission">send us a copy</a> in a Word or PDF file) and we will publish it in Verdict Magazine.
    </p>
    <hr>
    <!--||FORM GOES HERE||-->
<%
                If LoggedIn = 1 Then
                    If Request("varSubIt") = 1 Then
                        Set Mailer = Server.CreateObject("JMail.Message")
                        Mailer.FromName    =	"ASCDC Website"
                        Mailer.From =	"ascdc@camgmt.com"
                        Mailer.AddRecipient 	"kim@camgmt.com", "ASCDC Mgmt Staff"
                        Mailer.AddRecipientBCC 	"michael@camgmt.com", "ASCDC Webmaster"
                        Mailer.Subject     =	"ASCDC: Defense Verdict For Publication"
                        mailBody = mailBody & "Submission:" & vbcrlf & vbcrlf
                        mailBody = mailBody & "Case Name:" & vbcrlf
                        mailBody = mailBody & Request("txtCaseName") & vbcrlf
                        mailBody = mailBody & "Court, Case No.:" & vbcrlf
                        mailBody = mailBody & Request("txtCaseNum") & vbcrlf
                        mailBody = mailBody & "Judge's Name:" & vbcrlf
                        mailBody = mailBody & Request("txtJudge") & vbcrlf
                        mailBody = mailBody & "Verdict/Judgment Date:" & vbcrlf
                        mailBody = mailBody & Request("txtVDate") & vbcrlf
                        mailBody = mailBody & "Nature of Defense Ruling:" & vbcrlf
                        mailBody = mailBody & Request("txtNature") & vbcrlf
                        mailBody = mailBody & "One Sentence Description:" & vbcrlf
                        mailBody = mailBody & Request("txtDescription") & vbcrlf
                        mailBody = mailBody & "Plaintiffs' Counsel:" & vbcrlf
                        mailBody = mailBody & Request("txtPCounsel") & vbcrlf
                        mailBody = mailBody & "Defense Counsel:" & vbcrlf
                        mailBody = mailBody & Request("txtDCounsel") & vbcrlf
                        mailBody = mailBody & "Additional Notes:" & vbcrlf
                        mailBody = mailBody & Request("txtAddNotes") & vbcrlf
                        Mailer.Body = mailBody

                        Mailer.Priority    = 	1
                        if Mailer.Send("mail.midtownmicro.com:25") then
                            Response.Write "Thank you for submitting the trial information.<br><br>The information you submitted has been sent to the ASCDC Management Offices for review and publication in an upcoming issue.<br><br>If there are any questions please contact <a href='mailto:ascdc@camgmt.com'>ascdc@camgmt.com</a>.<br>&nbsp;<p>Thanks,<br>ASCDC Management Staff</p>"
                        else
                            Response.Write "ERROR SENDING E-MAIL: " & Mailer.Response & "<BR>Please send an e-mail to our <a href=""mailto:michael@camgmt.com?Subject=CEA Change Request E-mail ERROR""> WEBMASTER </a> and please copy & paste the above error. We apologize for any inconvenience this error has caused. Our Webmaster will address this for you ASAP."
                        end if
                    Else
%>
    <div class="form">
        <form action="submitTrialResultsForPublication.asp" method="post" name="SubmitForm" id="SubmitForm">

        <input type="hidden" name="varSubIt" id="varSubIt" value="1">

        <div class="fWrap">
            <span>Case Name*</span><input type="text" name="txtCaseName" id="txtCaseName" value="E.g., Smith vs. ABC Corp."></input>
        </div>
        <div class="fWrap">
            <span>Court, Case No.</span><input type="text" name="txtCaseNum" id="txtCaseNum" value="E.g., LASC, no. CV1234567"></input>
        </div>
        <div class="fWrap">
            <span>Judge's Name</span><input type="text" name="txtJudge" id="txtJudge" value=""></input>
        </div>
        <div class="fWrap">
            <span>Verdict/Judgment Date</span><input type="text" <input type="text" name="txtVDate" id="txtVDate" maxsize="10" value="##/##/##"></input>
        </div>
        <br><br>
        <div class="fWrap">
            <span>Nature of Defense Ruling</span><input type="text" name="txtNature" id="txtNature" value="E.g., jury verdict for defense"></input>
        </div>
        <div class="fWrap">
            <span>One Sentence Description</span><input type="text" name="txtDescription" id="txtDescription" size="50" value="E.g., Unanimous jury finds no negligence in personal injury action by 9-year-old student against school district arising out of failure to supervise students on field trip, or 9-3 jury verdict finding no product defect in asbestos action against brake part manufacturer, based on allegations that plaintiff who worked at parts counter developed mesothelioma from bystander exposure to brake work.">
        </div>
        <div class="fWrap">
            <span>Plaintiffs' Counsel</span><input type="text" name="txtPCounsel" id="txtPCounsel" value=""></input>
        </div>
        <div class="fWrap">
            <span>Defense Counsel</span><input type="text" name="txtDCounsel" id="txtDCounsel" value=""></input>
        </div>
        <div class="fWrap">
            <span>Additional Notes</span><textarea name="txtAddNotes" id="txtAddNotes" cols="30" rows="10"></textarea>
        </div>
        <div class="fWrap">
            <span>Submit To Headquarters:</span><div><input class="btn" type="Submit" name="SubmitIt" value="Submit"><div class="checkmark" onclick"checkIt(document.SubmitForm);"></div></input></div>
        </div>
        <script type="text/javascript" language="JavaScript">
                                                            			<!--
                                                            			//document.write('<input type="button" name="Button" id="Button" value="Submit" onclick="checkIt(document.SubmitForm);">');
                                                            			//-->
                                                            			</script>
    </form>
    <SCRIPT LANGUAGE="JavaScript">
        function checkIt(form) {
            var submitted = false;
            if(submitted == true) { return; }
            form.Button.value = 'Please Wait...Sending Request...';
            form.Button.disabled = true;
            submitted = true;	
            form.submit()
            return false
        }
        </SCRIPT>
<%
            End If
        Else
%>
<p>You must be logged in as a member to access this content.</p>
    <!--<br><a href="http://www.ascdc.org/_Login.asp">Login</a>-->
<%
        End If
%>
    </div>    
</body>
</html>
