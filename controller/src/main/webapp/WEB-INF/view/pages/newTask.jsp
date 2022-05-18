<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: s-afe
  Date: 15.05.2022
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1>Create Task</h1>

<fieldset>
    <form action="newTask" method="post">
        Name <input name="Name" class='lf--input' placeholder='Your username' type="Name"><br>
        Curse: <select name="Course">
        <c:forEach var="course" items="${courses}" varStatus="status">
            <option value="${course.id}">${course.name}</option>
        </c:forEach>
    </select><br>
        <input type='submit' value='Create'>
    </form>
</fieldset>
