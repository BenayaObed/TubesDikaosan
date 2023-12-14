<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
  ${title}
  <% int i = 0; %>
  <c:if test="${sessionScope.user != null}">
      <p>Session: ${sessionScope.user.first_name}</p>
      <a href="${pageContext.request.contextPath}/logout">Logout</a>
      <c:if test="${sessionScope.user.getRole().getRole_name() == 'ADMIN'}">
        <p>List Users</p>
        <c:forEach items="${users}" var="item">
            <li>${item.first_name}</li>
            <% i++; %>
        </c:forEach>
      </c:if>
  </c:if>
</body>
</html>
