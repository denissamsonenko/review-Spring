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
<link href='<spring:url value="/resources/css/style_show.css"/>' rel="stylesheet" />
<title>${news.title}</title>
</head>
<body>
<div class="wpapper">
	<div class="title">
		<div class="container">
			<div class="title__row">
				<div class="title__name"><spring:message code="title.newstitle"/></div>
				<div class="title__lang">
					<a href="?lang=en&newsId=${news.id}"><spring:message code="lang.en"/></a>
					<a href="?lang=ru&newsId=${news.id}"><spring:message code="lang.ru"/></a>
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
					<div class="news__views">
						<div class="view__title"><spring:message code="title.title"/></div>
						<div class="view__text">${news.title}</div>
					</div>
					<div class="news__views">
						<div class="view__title"><spring:message code="title.date"/></div>
						<div class="view__text">${news.date}</div>
					</div>
					<div class="news__views">
						<div class="view__title"><spring:message code="title.brief"/></div>
						<div class="view__text">${news.brief}</div>
					</div>
					<div class="news__views">
						<div class="view__title"><spring:message code="title.content"/></div>
						<div class="view__text">${news.content}</div>
					</div>
					
					<div class="view__navi">
					
						<c:url var="update" value="/news/update">
						<c:param name="newsId" value="${news.id}"/></c:url> 
						<form:form action="${update}" modelAttribute="news">
						<button type="submit"><spring:message code="button.edit"/></button>
						</form:form>			
						
						
						
						<c:url var="delete" value="/news/delete">
						<c:param name="newsId" value="${news.id}"/></c:url> 
						<spring:message code="news.alarm" var="news_alarm"/>
						<form:form action="${delete}" modelAttribute="news">
						<button type="submit" onclick="if (!(confirm('${news_alarm}'))) return false"><spring:message code="button.delete"/></button>
						</form:form>
						
			
					</div>						
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
</body>
</html>