<%@page import="java.time.LocalDate"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />
<link href='<spring:url value="/resources/css/style_edit.css"/>' rel="stylesheet" />
<title>News edit</title>	
</head>
<body>
<div class="wpapper">
	<div class="title">
		<div class="container">
			<div class="title__row">
				<div class="title__name"><spring:message code="title.newstitle"/></div>
				<div class="title__lang">
					<a href="update?newsId=${news.id}&lang=en"><spring:message code="lang.en"/></a>
						<a href="update?newsId=${news.id}&lang=ru"><spring:message code="lang.ru"/></a>
												<br><br>
						<span><security:authentication property="principal.username" /></span>
						<a href="${pageContext.request.contextPath}/logout"><spring:message code="link.logout"/></a>	
				</div>	
			</div>		
		</div> 
	</div> 
	<div class="news">
		<div class="container">
			<div class="news__row">
				<div class="news__nav">
					<div class="news__nav1">
						<div class="news__name"><spring:message code="title.news"/></div>
						<ul class="news__li">
							<li><a href="<spring:url value="/news/list"/>"><spring:message code="link.list"/></a></li>
							<li><a href="<spring:url value="/news/create"/>"><spring:message code="link.create"/></a></li>
						</ul>
					</div>
				</div>
				<div class="news__list">							

				<form:form action="edit" modelAttribute="news" method="post">
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.title"/></div>
						<form:input path="title" value='${news.title}' class="edit__textbox1"/>		
					</div>
					<form:errors path="title" class="error"/>
					
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.date"/></div>
						<c:set var="now" value="<%= LocalDate.now() %>" />
						 <input class="edit__textbox2" placeholder="${now}" readonly/>
					</div>
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.brief"/></div>
						<form:textarea path="brief" wrap="soft" value='${news.brief}' class="edit__textbox3" />
					</div>
					<form:errors path="brief" class="error"/>
					
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.content"/></div>
						<form:textarea path="content" wrap="soft" value='${news.content}' class="edit__textbox4" />
					</div>
					<form:errors path="content" class="error"/>					
					<div class="news__navi">
						<div class="button">
							<button type="submit"><spring:message code="button.save"/></button>
							<button type="reset"><spring:message code="button.cancel"/></button>
						</div>
					</div>
					</form:form> 
				</div>
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<div class="footer__row">
				<div class="footer__text">Copyright EPAM 2008. All rights reserved.</div>
			</div>
		</div>
	</footer>
</div>
</body>
</html>