<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form:form action="saveUser" method="post" modelAttribute="user">
      <table>
        <tr>
          <th>Name</th>
          <td>
            <form:input path="username" /> 
           <%--  <form:errors path="name"  /> --%>
          </td>
          <th>Email</th>
          <td>
            <form:password path="password" /> 
           <%--  <form:errors path="email"  /> --%>
          </td>
          <td><button type="submit">Submit</button></td>
        </tr>
      </table>
    </form:form>
</body>
</html>