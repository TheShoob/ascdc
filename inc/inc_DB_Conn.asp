<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-35942846-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<%
'SQL SERVER DB CONNECTION VIA global.asa
DataConnName = "ascdcsecure"
Set My = Server.CreateObject("ADODB.Connection")
My.ConnectionTimeout = Application(DataConnName & "_ConnectionTimeout")
My.CommandTimeout = Application(DataConnName & "_CommandTimeout")
My.Open Application(DataConnName & "_ConnectionString"), Application(DataConnName & "_RuntimeUserName"), Application(DataConnName & "_RuntimePassword")
%>

<%
'ACCESS DB - MEMBERS
set connASCDC = Server.CreateObject("adodb.connection")
connASCDC.Provider="Microsoft.ACE.OLEDB.12.0"
connASCDC.ConnectionString ="data source=" & Server.MapPath("_db\ASCDCdata.accdb")
'response.write(connASCDC.ConnectionString)
connASCDC.ConnectionTimeout = 30
connASCDC.CommandTimeout = 80
connASCDC.Open
%>