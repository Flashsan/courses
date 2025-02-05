<%--
  Created by IntelliJ IDEA.
  User: Note
  Date: 13.05.2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty sessionScope.admin}">

    <a href="newAdmin">Add admin</a>
    <table class="table">
        <thead>
        <tr>
            <th class="col">№</th>
            <th class="col">ID</th>
            <th class="col">Admin name</th>
            <th class="col">Fixed course</th>
            <th class="col">Fixed mentor</th>
            <th class="col">Edit</th>
            <th class="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="admin" items="${admin}" varStatus="status">
            <tr>
                <td class="col">${status.index+1}</td>
                <td class="col">${admin.id}</td>
                <td class="col">${admin.adminName}</td>
                <td class="col">
                    <a href="adminCourse?adminId=${admin.id}">Show courses</a>
                </td>
                <td class="col">
                    <a href="adminMentor?mentorId=${admin.id}">Show mentors</a>
                </td>
                <td class="col">
                    <a href="adminEdit?mentorId=${admin.id}">Edit</a>
                </td>
                <td class="col">
                    <form action="adminDelete" method="POST">
                    <button type="submit" id="adminDelete" name="adminDelete" value="${admin.id}"> Delete</button>
                    <a href="adminDelete?mentorId=${admin.id}">Delete</a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>



