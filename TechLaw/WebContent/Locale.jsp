<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String lang = request.getParameter("lang");
	if (lang != null) {
		session.setAttribute("locale", lang);
	}
	response.sendRedirect("index.jsp");
%>