<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/styles.css">
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" />
<link href='<spring:url value="/resources/css/style_edit2.css"/>' rel="stylesheet" />
<title>Login form</title>
</head>
<body>
<div class="wpapper">
	<div class="title">
		<div class="container">
			<div class="title__row">
				<div class="title__name"><spring:message code="title.newstitle"/></div>
				<div class="title__lang">
					<a href="login?lang=en"><spring:message code="lang.en"/></a>
						<a href="login?lang=ru"><spring:message code="lang.ru"/></a> 
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
 
 				<form action='<spring:url value="/loginAction"/>' method="post">
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.username"/></div>
						
						 <input type="text" name="username" class="edit__textbox1" placeholder="<spring:message code="title.username"/>"/>
					</div>
					
					<div class="edit__news">
						<div class="edit__title"><spring:message code="title.password"/></div>
						<input class="edit__textbox2" type="password" name="password" placeholder="<spring:message code="title.password"/>" />						
					</div>
									<c:if test="${param.error != null}">          
        							<p class="error">  
           							 Invalid username and password.  
       								 </p>  
    								</c:if>
 					
					<div class="news__navi">
						<div class="button">
							<button type="submit"><spring:message code="button.enter"/></button>
						</div>
					</div>
					</form> 
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