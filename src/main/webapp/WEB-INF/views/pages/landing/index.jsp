<%@ page language="java" import="javax.servlet.http.HttpSession" %>
<html>
<body>
  <!-- get session value test from controller -->

  <!-- chceck session user if login or not -->
  <c:if test="${user}">
    <h1>${user}</h1>
    <a href="${pageContext.request.contextPath}/api/logout">Logout</a>

    <c:forEach items="${data_user}" var="data">
      <p>${data.first_name}</p>
    </c:forEach>

  </c:if>
  
  <!-- destroy sessio -->
</body>
</html>
