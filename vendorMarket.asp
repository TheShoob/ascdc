<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!--#include file="inc/inc_DB_Conn.asp" -->
<!--#include file="inc/adovbs.inc" -->
<title>Vendor Marketplace</title>
<link rel="stylesheet" type="text/css" href="page.css">
</head>

<body>
    <h1>ASCDC Vendor Marketplace</h1>
    <p>Click here if you would like to view the <a href="#memberMarket.asp">ASCDC Member Marketplace</a></p>
    <form id="frmSubVenFilter" name="frmSubVenFilter" action="vendorMarket.asp" method="post">                               				
    <select name="vendorCatID" id="vendorCatID" class="pick" value="" onchange='this.form.submit()'>
        <option value=0>All Categories</option>
        <%
            SQLQuery = "SELECT * FROM tblMarketVendorCats ORDER BY vendorCatName;"
            Set rsVendorCatsList = My.Execute(SQLQuery)
            If Not rsVendorCatsList.EOF Then
                'varCount = 0
                Do While Not rsVendorCatsList.EOF
                    'varCount = varCount + 1
        %>
                        <option value=<%=rsVendorCatsList("ID")%><%If CInt(Request("vendorCatID")) = CInt(rsVendorCatsList("ID")) Then%> Selected<%End If%>><%=rsVendorCatsList("vendorCatName")%></option>
            <%
                    rsVendorCatsList.MoveNext
                Loop
            End If
            %>
    </select>
    <br>
    <div align="center"><a href="http://ascdc.org/PDF/Vendor-Market-Form.pdf" target="_blank">Click here for the Vendor Submission Form</a></div>
    <div>
        All Vendors of this Category
    </div>
        
        <ul>
    <%
        SQLQuery2 = "SELECT * FROM tblMarketVendors WHERE flgActive='True'"
        If CInt(Request("vendorCatID")) > 0 Then
        SQLQuery2 = SQLQuery2 & " AND catID = " & CInt(Request("vendorCatID"))
        End If
        SQLQuery2 = SQLQuery2 & "ORDER BY vendorName;"
        Set rsMarketVendors = My.Execute(SQLQuery2)
        If Not rsMarketVendors.EOF Then
        Do While Not rsMarketVendors.EOF
        If DateDiff("d", rsMarketVendors("listingExpires"), now()) >= 1 Then
        'Don't List
        Else
        'List It
    %>
            <li>
                <strong><%=rsMarketVendors("vendorName")%></strong>
                <br><br>
                <%=rsMarketVendors("vendorAddress")%>
                <br>
                <%=rsMarketVendors("vendorCity")%>,&nbsp;<%=rsMarketVendors("vendorState")%>&nbsp;<%=rsMarketVendors("vendorZip")%><br>
                Phone: <%=rsMarketVendors("vendorPhone")%>
                <br>
                <%If not rsMarketVendors("vendorFax") = "" Then%>
                Fax: <%=rsMarketVendors("vendorFax")%>
                <br>
                <%End If%>
                <%If not rsMarketVendors("vendorURL") = "" Then%>
                <a href="<%=rsMarketVendors("vendorURL")%>" target="_blank"><%=rsMarketVendors("vendorURL")%></a>
                <br>
                <%End If%>
                <p>
                    <%=rsMarketVendors("vendorDescription")%>
                </p>
                <a href="<%=rsMarketVendors("vendorURL")%>" target="_blank">
                    <img src='img/ads/VendorMarketAds/<%=rsMarketVendors("vendorBannerAd")%>'>
                </a>
            </li>
            <br>
    <%
        End If
        rsMarketVendors.MoveNext
        Loop
        Else
        Response.write("<div align='center'>No Records Found For That Option!</div>")
        End If
    %>
    </ul>
</body>
</html>
