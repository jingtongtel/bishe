<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<pre>
<%
	Enumeration<String> attributeNames = request.getAttributeNames();
	while (attributeNames.hasMoreElements()) {
		String attributeName = attributeNames.nextElement();
		Object attribute = request.getAttribute(attributeName);
		if (attributeName == "javax.servlet.error.status_code") {

			if (attribute.equals(404)) {
				out.println("输入错误的url");

			} else if (attribute.equals(403)) {
				out.println("不允许直接输入网址访问");
			}else if (attribute.equals(400)) {
				out.println("入参格式错误");
			}else if (attribute.equals(500)) {
				out.println("输入数据错误");
			}else if (attribute.equals(405)) {
				out.println("请使用post方式传输");
			}
		out.println("request.attribute['" + attributeName + "'] = " + attribute); 
		}
	}
%>
</pre>
</body>
</html>