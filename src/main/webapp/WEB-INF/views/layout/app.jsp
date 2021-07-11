<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="constants.ForwardConst" %>
<%@ page import="constants.AttributeConst" %>

<c:set var="actTop" value="${ForwardConst.ACT_TOP.getValue()}" />
<c:set var="actEmp" value="${ForwardConst.ACT_EMP.getValue()}" />
<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="actAuth" value="${ForwardConst.ACT_AUTH.getValue()}" />

<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commOut" value="${ForwardConst.CMD_LOGOUT.getValue()}" />

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
    <title><c:out value="日報管理システム" /></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div id="header_menu">
                <h1><a href="<c:url value='/?action=${actTop}&command=${commIdx}' />">日報管理システム</a></h1>&nbsp;&nbsp;&nbsp;
                <c:if test="${sessionScope.login_employee != null}">
                    <c:if test="${sessionScope.login_employee.adminFlag == AttributeConst.ROLE_ADMIN.getIntegerValue()}">
                        <a href="<c:url value='?action=${actEmp}&command=${commIdx}' />">従業員管理</a>&nbsp;
                    </c:if>
                    <a href="<c:url value='?action=${actRep}&command=${commIdx}' />">日報管理</a>&nbsp;
                </c:if>
            </div>
            <c:if test="${sessionScope.login_employee != null}">
                <div id="employee_name">
                    <c:out value="${sessionScope.login_employee.name}" />
                    &nbsp;さん&nbsp;&nbsp;&nbsp;
                    <a href="<c:url value='?action=${actAuth}&command=${commOut}' />">ログアウト</a>
                </div>
            </c:if>
        </div>
        <div id="content">${param.content}</div>
        <div id="footer">by Taro Kirameki.</div>
    </div>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>