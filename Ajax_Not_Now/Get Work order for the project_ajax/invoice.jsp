<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="struts-html.tld" prefix="html" %>

<c:forEach var="abc" items="${requestScope.WorkOrderList}"><c:out value="${abc}~"/></c:forEach>
