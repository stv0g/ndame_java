<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="java.util.ArrayList"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8"></meta>
<title>n-Damen Problem - Backtracking</title>
<link rel="stylesheet" type="text/css" href="schach.css" />
<script src="schach.js" type="text/javascript"></script>
</head>
<body onload="schach(document.getElementById('sols').childNodes[1].value)">
<div id="wrapper">
<div id="header">n-Damen Problem</div>

<%@ page import="de.steffenvogel.ndame.DameArr" %>

<%
int n = (request.getParameter("n") == null) ? 5 : Integer.parseInt(request.getParameter("n"));
if (n >  16) {
	out.println("n too large!");
}
else {
	long start = System.currentTimeMillis();

	DameArr dame = new DameArr(n);
    dame.run();
	

	long diff = (System.currentTimeMillis() - start);
	
%>
 
F&uuml;r das n-Damen-Problem mit Schachbrettgr&ouml;&szlig;e <%= n %> wurden <%= dame.solcount %> L&ouml;sungen gefunden.<br /><br />

<%
	if (n < 14) {
%>
<select id="sols" onchange="schach(this.value)" size="2">
<%
		for (int[] solution : dame.getSolutions()) {
			String solutionFormatted = new String();
			
			for (Integer i : solution) {
				solutionFormatted += (i + 1) + "|";
			}
			solutionFormatted = solutionFormatted.substring(0, solutionFormatted.length() - 1);
			
			out.println("<option value=\"" + solutionFormatted + "\">" + solutionFormatted + "</option>");
		}
%>
</select>
<div id="show">Bitte eine L&ouml;sung w&auml;hlen, um diese anzuzeigen.</div>
<% } %>
<br style="clear:both" />
<br />Dazu wurde folgende Zeit ben&ouml;tigt: <%= diff %> ms.
<% } %>
<form action="index.jsp" method="get">
<span>Schachbrettgr&ouml;&szlig;e = </span><select onchange="submit()" name="n">
<%
for (int i = 1; i < 14; i++) {
	out.println("<option" + ((i == n) ? " selected=\"selected\"" : "") + " value=\"" + i + "\">" + i + "</option>");
}
%>
</select>
</form>
<div id="copy">&copy; Steffen Vogel<br />
<a href="mailto:info@steffenvogel.de">info@steffenvogel.de</a><br />
<a href="http://www.steffenvogel.de">http://www.steffenvogel.de</a><br />
Based on Micha's Javascript &amp; CSS frontend</div>
</div>
</body>
</html>
