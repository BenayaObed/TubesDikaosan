<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="session" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
  ${title}
  <% int i = 0; %>

  <c:choose>
    <c:when  test="${sessionScope.user != null}">
      <p>List Users</p>
        <c:forEach items="${users}" var="item">
            <li>${item.first_name}</li>
            <% i++; %>
        </c:forEach>
        <a href="${pageContext.request.contextPath}/logout">logout</a> <br>
        <p>Create Product</p>
        <form action="${pageContext.request.contextPath}/dashboard/products/save" method="post" enctype="multipart/form-data">
          <input type="text" name="name_product" placeholder="Product" />
          <br>
          <input type="text" name="category_id" placeholder="Category id" />
          <br>
          <input type="text" name="price" placeholder="Price" />
          <br>
          <input type="text" name="visible" placeholder="visible" />
          <input type="text" name="visible" placeholder="visible" />
          <br>
          <input type="file" name="images" />
          <br>
          <input type="file" name="images" />
          <br>
          <input type="submit" value="Submit" />
        </form>
    </c:when>
    <c:otherwise>
      <a href="${pageContext.request.contextPath}/login">login</a>
    </c:otherwise>
  </c:choose>

</body>
</html>
