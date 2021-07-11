<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="constants.ForwardConst" %>
<%@ page import="constants.AttributeConst" %>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">

<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="actReaction" value="${ForwardConst.ACT_REACTION.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commEdt" value="${ForwardConst.CMD_EDIT.getValue()}" />
<c:set var="commCreate" value="${ForwardConst.CMD_CREATE.getValue()}" />
<c:set var="repId" value="${AttributeConst.REP_ID.getValue()}" />

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
		<c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>日報 詳細ページ</h2>

        <table>
            <tbody>
                <tr>
                    <th>氏名</th>
                    <td><c:out value="${report.employee.name}" /></td>
                </tr>
                <tr>
                    <th>日付</th>
                    <fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="reportDay" type="date" />
                    <td><fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' /></td>
                </tr>
                <tr>
                    <th>内容</th>
                    <td><pre><c:out value="${report.content}" /></pre></td><!--  <pre>は<br />を使わずに改行してくれる-->
                </tr>
                <tr>
                    <th>登録日時</th>
                    <fmt:parseDate value="${report.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createDay" type="date" />
                    <td><fmt:formatDate value="${createDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <fmt:parseDate value="${report.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="updateDay" type="date" />
                    <td><fmt:formatDate value="${updateDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </tbody>
        </table>
        <div class="mt-2">
        <form method="POST" action="<c:url value='?action=${actReaction}&command=${commCreate}' />">
        	<input type="hidden" name="${repId}" value="${report.id}">
        	<input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />
        	<button type="submit" class="btn p-0 border-0 text-primary"><i class="far fa-thumbs-up fa-2x" style="color: #528fff;"></i></button>
        	<button type="submit" class="btn p-0 border-0 text-primary"><i class="far fa-thumbs-up fa-2x" style="color: #e54747;"></i></button>
        	</form>
        </div>

        <c:if test="${sessionScope.login_employee.id == report.employee.id}">
            <p>
                <a href="<c:url value='?action=${actRep}&command=${commEdt}&id=${report.id}' />">この日報を編集する</a>
            </p>
        </c:if>

        <p>
            <a href="<c:url value='?action=${actRep}&command=${commIdx}' />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>