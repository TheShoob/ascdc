<%
Function ProtectSQL(SQLString)
	If Not IsNull(SQLString) Then
		SQLString = Replace(SQLString, "'", "&#39;") ' replace single Quotes with Double Quotes
		SQLString = Replace(SQLString, ">", "&gt;") ' replace > with &gt;
		SQLString = Replace(SQLString, "<", "&lt;") ' replace < with &lt;
		SQLString = Replace(SQLString, "(","&#40;") ' replace ( with &#40;
		SQLString = Replace(SQLString, ")","&#41;") ' replace ) with &#41;
		SQLString = Replace(SQLString, "&", "&amp;")
		SQLString = Replace(SQLString, "%", "&#37;")
		' replace vblf with <br /> (This is mainly used for Memo fields).
		SQLString = Replace(SQLString, vblf,"<br />") 
		SQLString = Trim(SQLString)
		ProtectSQL = SQLString
   End If
End Function

Function ReverseSQL(SQLRevString)
	If Not IsNull(SQLRevString) Then
		SQLRevString = Replace(SQLRevString, "&#39;", "'") 
		SQLRevString = Replace(SQLRevString, "&gt;", ">") 
		SQLRevString = Replace(SQLRevString, "&lt;", "<") 
		SQLRevString = Replace(SQLRevString, "&#40;","(") 
		SQLRevString = Replace(SQLRevString, "&#41;",")") 
		SQLRevString = Replace(SQLRevString, "&amp;", "&")
		SQLRevString = Replace(SQLRevString, "%", "&#37;")
		SQLRevString = Replace(SQLRevString,"<br />", vblf)
		SQLRevString = Trim(SQLRevString)
		ReverseSQL = SQLRevString
	End If
End Function
%>


