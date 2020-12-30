<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="document.f.username.focus();">
    <h3>Login with Username and Password</h3>
    <form name="f" action="/home/login" method="POST">
        <table>
            <tbody>
                <tr>
                    <td>User:</td>
                    <td><input type="text" name="id" value=""></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="pw"></td>
                </tr>
                <tr>
                	<td>
                		${requestScope.loginFailMsg}
					    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </td>
                    <td><input name="submit" type="submit" value="Login"></td>
                </tr>
            </tbody>
        </table>
    </form>
</body>

</html>