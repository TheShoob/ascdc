<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/ProtectSQL.asp" -->
<!--#include file="inc/inc_Login_Check.asp" -->
<!--#include file="inc/adovbs.inc" -->
<title>Member Marketplace</title>
<link rel="stylesheet" type="text/css" href="page.css">

<script type="text/javascript">
  <!--
      function toggle_visibility(id) {
         var e = document.getElementById(id);
         if(e.style.display == 'block')
            e.style.display = 'none';
         else
            e.style.display = 'block';
      }
  //-->
  </script>

  <script type="text/javascript">
  <!--
      function phonenumber(inputtxt)  
      {  
        var phoneno = /^\d{10}$/;
        if(inputtxt.value.match(phoneno))  
          {  
            return true;  
          }  
        else  
          {    
            return false;  
          }  
      }  
    //-->
  </script>

  <script type="text/javascript">
      /*function phonedisplay(num) {
        var newphone = '(';
        var newnum = num.replace(/\D/g, '');  
        for (var i = 0; i < 10; i++) { 
            if (i == 3) {
              newphone += ") ";
            }
            if (i == 6) {
              newphone += '-';
            }
            newphone += num[i];
        
        }
        newphone += '\n';
        return newphone;  
      }*/
      //<![CDATA[
      $(window).load(function(){
          $(".phone").text(function(i, text) {
              text = text.replace(/\D/g,'');
              text = text.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
              return text;
          });
});//]]>
  </script>

  <script type="text/javascript">
    function formsubmit(contactPhone) {
      if (phonenumber(contactPhone)) {
        document.getElementById('frmSub').submit();
      } else {
        if (document.frmSub.flgContact.value = 2 {
            alert("Please input phone number as 1234567890");
        } else {
            document.getElementById('frmSub').submit();
        }
      }
    }
  </script>
  
  
  <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript"><!--||JS for expanding/collapsing content||-->  
      $(document).ready(function(){
          
          $("#expanderHeadInfo").click(function(){
              $("#expanderContentInfo").slideToggle();
              if ($("#expanderSignInfo").html() == ""){
                  $("#expanderSignInfo").html("")
                  var site = '';
                  document.getElementById('ExpiFrame').src = site;
              }
              else {
                  $("#expanderSignL1").html("")
                  var site = '';
                  document.getElementById('ExpiFrame').src = site;
              }
          });
      });
    </script>
    
    <style>
	  .infoEx {
		  background-color: #75C999;
		  background-image: url(images/infoIcon.png);
		  background-position: 20px;
		  background-size: 30px 30px;
		  background-repeat: no-repeat;
		  color: #FFFFFF;
		  padding: 20px;
		  text-align: center;
	  }
	  
	  .infoText {
		  font-size: 14px;
		  color: #004627;
		  width: 80%;
		  display: block;
		  margin: 0 auto;
	  }
	</style>
</head>

<body>
    <h1>ASCDC Member Marketplace</h1>


















<%
If Request("varSUB") = 1 Then







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












End If
%>








    <form id="frmSubMemFilter" name="frmSubMemFilter" action="memberMarket.asp" method="post">
    <select name="marketCatID" id="marketCaID" class="pick" value="">
    <option value=0>All Categories</option>
        <%
            SQLQuery = "SELECT * FROM tblMarketCats ORDER BY listingCatName;"
            Set rsCatsList = My.Execute(SQLQuery)
            If Not rsCatsList.EOF Then
                'varCount = 0
                Do While Not rsCatsList.EOF
                    'varCount = varCount + 1
            %>
                        <option value=<%=rsCatsList("ID")%><%If CInt(Request("marketCatID")) = CInt(rsCatsList("ID")) Then%> Selected<%End If%>><%=rsCatsList("listingCatName")%></option>
            <%
                    rsCatsList.MoveNext
                Loop
            End If
        %>
    </select>

    <div class="searchWrap">
        <input type="radio" name="flgEmpType" id="flgEmpType" value=1<%If Request("flgEmpType") = 1 Then%> checked<%End If%>> <span class="someText">Staff</span> <input type="radio" name="flgEmpType" id="flgEmpType" value=2<%If Request("flgEmpType") = 2 Then%> checked<%End If%>> <span class="someText">Attorney</span> <input type="radio" name="flgEmpType" id="flgEmpType" value=3<%If Request("flgEmpType") = 3 Then%> checked<%End If%>> <span class="someText">N/A</span>
        <input type="hidden" name="varMemFilter" id="varMemFilter" value="1">
        <input class="search" name="subMemFilter" type="submit" value="Filter">
    </div>
    </form>
    <div class="mResults">
    <%
        CatsSQLQuery = "SELECT * FROM tblMarket WHERE flgActive='True'"
        If Request("flgEmpType") = 1 Then
        CatsSQLQuery = CatsSQLQuery & " AND flgStaff = 'True'"
        End If
        If Request("flgEmpType") = 2 Then
        CatsSQLQuery = CatsSQLQuery & " AND flgAttorney = 'True'"
        End If
        If Request("marketCatID") = 1 Then
        CatsSQLQuery = CatsSQLQuery & " AND catID = 1"
        End If
        If Request("marketCatID") = 3 Then
        CatsSQLQuery = CatsSQLQuery & " AND catID = 3"
        End If
        If Request("marketCatID") = 5 Then
        CatsSQLQuery = CatsSQLQuery & " AND catID = 5"
        End If
        CatsSQLQuery = CatsSQLQuery & " ORDER BY listingSubDate DESC;"
        'Response.write(CatsSQLQuery)
        'CatsSQLQuery = "SELECT ID, PeopleID, catID, ListingTitle, listingDescription, listingExpires, flgStaff, flgAttorney, flgActive, flgContact, listingSubDate, contactName, contactPhone, contactEmail, newlistingURL) FROM tblMarket WHERE flgActive='True' ORDER BY listingSubDate DESC;"
        Set rsMarket = My.Execute(CatsSQLQuery)
        varListingURL = ""
        
        If Not rsMarket.EOF Then
            Do While Not rsMarket.EOF
            If Not rsMarket("newlistingURL") = "" Then
                varListingURL = rsMarket("listingURL")
            Else
                varListingURL = ""
            End If
            If DateDiff("n", rsMarket("listingExpires"), now()) >= 1 Then
                'Don't List
            Else
                'Get Info & List
                CatsSQLQuery = "SELECT * FROM tblMarketCats WHERE ID=" & rsMarket("catID") & ";"
                Set rsMarketCatName = My.Execute(CatsSQLQuery)
                If Not rsMarketCatName.EOF Then
                    varCatName = rsMarketCatName("listingCatName")
                    Select Case varCatName
                        Case "Employment Opportunities"
                            varCatName = "Hiring"
                        Case "Seeking Employment"
                            varCatName = "Seeking Job"
                    End Select
                Else
                    varCatName = ""
                End If
                If rsMarket("flgStaff") = True Then
                    varJobType = "Staff"
                Else
                    varJobType = "Attorney"
                End If
    %>
    <div class="aJob"><!--job-->
        <a href="#" onclick="toggle_visibility('<%=rsMarket("ID")%>');"><%=rsMarket("listingTitle")%><br>(<%=varCatName%> - <%=varJobType%>)&nbsp;<img width="14" src="images/ExpandIcon.png"></a>
        <div id="<%=rsMarket("ID")%>" class="jobExpand" style="display:none;">
            <em><%=rsMarket("listingDescription")%></em>
            <br>
            
            <%If rsMarket("flgContact") = True Then%>
            <%
                'Look Up Contact Info For Member
                Set con = Server.CreateObject("ADODB.Connection")
                con.Open connASCDC
                'Select record to be updated
                strSQL = "SELECT tblPeople.PeopleID, tblPeople.FName, tblPeople.LName, tblPeople.Email, tblFirms.FirmPhone FROM tblFirms INNER JOIN tblPeople ON tblFirms.FirmID = tblPeople.FirmID WHERE (((tblPeople.PeopleID)=" & CInt(rsMarket("PeopleID")) & "));"
                'response.write(strSQL)
                Set rsProfile = Server.CreateObject("ADODB.Recordset")
                rsProfile.Open strSQL, con, adOpenStatic, adLockOptimistic, adCmdText
                varContactFName = rsProfile("FName")
                varContactLName = rsProfile("LName")
                varContactEmail = "<a href='mailto:" & rsProfile("Email") & "'>" & rsProfile("Email") & "</a>"
                varContactPhone = rsProfile("FirmPhone")
                'Response.write(varContactFName & " " & varContactLName & "<br>" & varContactEmail & "<br>" & varContactPhone & "<br>")
                Response.write(varContactFName & " " & varContactLName & "<br>" & varContactEmail & "<br>")
            %>
                <span class="phone"><%=rsProfile("FirmPhone")%></span>
                
            <%Else%>
                <%=rsMarket("contactName")%><br>
                <%If Not rsMarket("contactPhone") = "" Then%>
                <span class="phone"><%=rsMarket("contactPhone")%></span>
                <br>
                <%End If%>
                <a href="mailto:<%=rsMarket("contactEmail")%>"><%=rsMarket("contactEmail")%></a><br>
            <%End If%>
            <%If varListingURL = "" Then%><%Else%><a href="<%=varListingURL%>" target="_blank">Listing Link</a><%End If%>
        </div>
        </div>  
<%
            End If
            rsMarket.MoveNext
            Loop
        Else
            Response.write("<div align='center'>No Records Found For Those Options!</div>")
        End If
%>                      
    </div>
    
    <div class="divide"></div>
    
    <a name="SUBFORM" id="SUBFORM"><div class="jobPost">
        <div align="center"><strong><u>Submit Listing</u></strong></div>
        <%If Not LoggedIn = 1 Then%>
            Only Members can submit listings. <strong>Please login</strong> if you would like to submit a listing to the Member Market.
        <%Else%>
            Note: All listings automatically expire in 60 days from submission:<br>				
            <form id="frmSub" name="frmSub" action="memberMarket.asp" method="post">
            <input type="hidden" name="varSUB" id="varSUB" value=1>
            <select name="CatID" id="CatID">
            <option value=0 SELECTED>Select A Category</option>
            <%
                    SQLQuery = "SELECT * FROM tblMarketCats ORDER BY listingCatName;"
                    Set rsCatsList = My.Execute(SQLQuery)
                    If Not rsCatsList.EOF Then
                        'varCount = 0
                        Do While Not rsCatsList.EOF
                            'varCount = varCount + 1
                    %>
                                <option value=<%=rsCatsList("ID")%>><%=rsCatsList("listingCatName")%></option>
                    <%
                            rsCatsList.MoveNext
                        Loop
                    End If
            %>
            </select>
            <input type="text" name="listingTitle" id="listingTitle" size="50" maxlength="255" placeholder="Title" value="">
            <textarea name="listingDescription" id="listingDescription" maxlenght="500" placeholder="Description (max 500 chars)"></textarea>
            <input type="text" name="listingURL" id="listingURL" size="50" maxlength="500" placeholder="Link (http://...)" value="">Select Type:<br><br>
        
            <input type="radio" name="flgEmpType" id="flgEmpType" value=1> <span class="someText">Staff</span>
            <input type="radio" name="flgEmpType" id="flgEmpType" value=2> <span class="someText">Attorney</span>
            <input type="radio" name="flgEmpType" id="flgEmpType" value=3 checked> <span class="someText">N/A</span> 
            <br><br>
            
            <input type="radio" name="flgContact" id="flgContact" value="1" checked> <span class="someText">Use My Contact Info</span>
            <input type="radio" name="flgContact" id="flgContact" value="2"> <span class="someText">Or Use Other:</span> <br><br>
        
            <input type="text" name="contactName" id="contactName" size="20" maxlength="255" placeholder="Name" value="">
            <input type="text" name="contactPhone" id="contactPhone" size="10" maxlength="255" placeholder="Phone" value="">
            <input type="text" name="contactEmail" id="contactEmail" size="10" maxlength="255" placeholder="Email" value="">
            <input type="button" id="saveForm" name="saveForm" onclick="checkIT(this.form)" value="Submit">
            </form>
        <%End If%>
    </div></a>

<SCRIPT LANGUAGE="JavaScript">

function checkIT(form) {

    var iMyCat = form.CatID.options[form.CatID.selectedIndex].value;
    if (iMyCat == 0) {
		alert("Please provide a selection for 'Category'.");
		form.CatID.focus();
		return (false);
	}
	if (form.listingTitle.value == "" || form.listingTitle.value == " ") {
		alert("You must provide a Title for this listing.");
		form.listingTitle.focus();
		return (false);
	}
	if (form.listingDescription.value == "" || form.listingDescription.value == " ") {
		alert("You must provide a Description for this listing.");
		form.listingDescription.focus();
		return (false);
	}
	if ((form.flgContact.value == "2") && (form.contactName.value == "")) {
		alert("Please input a name (First & Last)");
		form.contactName.focus();
		return (false);
	}
	if ((form.flgContact.value == "2") && (form.contactPhone.value == "")) {
		alert("Please input a phone number");
		form.contactPhone.focus();
		return (false);
	}
	if ((form.flgContact.value == "2") && (form.contactPhone.value != "")) {
	    var phoneno = /^\d{10}$/;
        if(!form.contactPhone.value.match(phoneno)) {
		    alert("Please input a valid 10 digit phone number. Example: 1234567890");
		    form.contactPhone.focus();
		    return (false);
	    }
	}
	if ((form.flgContact.value == "2") && (form.contactEmail.value == "")) {
		alert("Please input an Email Address");
		form.contactEmail.focus();
		return (false);
	}
	if ((form.flgContact.value == "2") && (form.contactEmail.value != "")) {
	    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if(!form.contactEmail.value.match(mailformat)) {
		    alert("Please input a valid Email Address");
		    form.contactEmail.focus();
		    return (false);
	    }
	}
	
	form.submit()
	return false
}

</SCRIPT>
</body>
</html>
