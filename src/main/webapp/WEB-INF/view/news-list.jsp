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
<link href='<spring:url value="/resources/css/style_showall.css"/>' rel="stylesheet" />
<title>News list view</title>
</head>
<body>
<div class="wpapper">
	<div class="title">
		<div class="container">
			<div class="title__row">
				<div class="title__name"><spring:message code="title.newstitle"/></div>
					<div class="title__lang">
						<a href="?lang=en"><spring:message code="lang.en"/></a>
						<a href="?lang=ru"><spring:message code="lang.ru"/></a>
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
					 <div class="news__info">  
						 <form:form action="delete" modelAttribute="news" class="news__info">
 							 <c:forEach var="news" items="${news}">
								<div class="news__line">
									<div class="news__title">${news.title}</div>
									<div class="news__date">${news.date}</div>
								</div>
									<div class="news__content">${news.content}</div>
								<div class="news__navi">
									
									<div class="news__view">
									<c:url var="show" value="/news/show">
									<c:param name="newsId" value="${news.id}"/>
									</c:url>
									<a href="${show}"><spring:message code="link.view"/></a>
									</div>
									
									<div class="news__edit">
									<c:url var="update" value="/news/update">
									<c:param name="newsId" value="${news.id}" /></c:url>
									<a href="${update}"><spring:message code="link.edit"/></a>
									</div>
									
									<input class="input" type="checkbox" name="newsId" value="${news.id}">
									
								</div>
							 </c:forEach>
							 	<spring:message code="news.alarm" var="news_alarm"/>
								<button type="submit" onclick="if (!(confirm('${news_alarm}'))) return false"><spring:message code="button.delete"/></button>
							 </form:form>	
						 </div> 
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