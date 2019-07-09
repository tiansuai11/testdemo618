<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="width:980px; margin:0px auto; text-align:center">
    <div style="text-align:center">
        <h3>记账管理系统</h3>
    </div>
    <div style="text-align:center">
        <form id="searchForm" action="${pageContext.request.contextPath}/index" method="post">
            类型:
            <select name="tid" id="tid">
                <option value="-1">--财务类型--</option>
                <c:if test="${requestScope.billtypeList!=null}">
                    <c:forEach items="${requestScope.billtypeList}" var="btp">
                        <option value="${btp.tid}"
                                <c:if test="${btp.tid==billsParam.tid}">selected="selected"</c:if>>${btp.name}</option>
                    </c:forEach>
                </c:if>
            </select>&nbsp;&nbsp;
            时间：
            <input name="min_sal" type="text" id="min_sal" size="10" value="${billsParam.min_day}"/>
            到
            <input name="max_sal" type="text" id="max_sal" size="10" value="${billsParam.max_day}"/>
            &nbsp;&nbsp;&nbsp;
            <input type="hidden" name="pageIndex" id="pageIndex" value="1"/>
            <input type="submit" name="btnQuery" id="btnQuery" value="查询"/>
        </form>
    </div>

    <div style="width:950px; padding-right:30px; line-height:40px; height:40px; text-align:right">
        <a href="${pageContext.request.contextPath}/insert">添加记账</a>&nbsp;
    </div>
    <table width="980" border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>标题</td>
            <td>记账时间</td>
            <td>类别</td>
            <td>金额</td>
            <td>说明</td>
            <td>详细</td>
            <td>删除</td>
            <td>修改</td>
        </tr>

        <c:if test="${requestScope.info.list!=null}">
            <c:forEach var="emp" items="${requestScope.info.list}">
                <tr>
                    <td>${emp.title}</td>
                    <td><fmt:formatDate value="${emp.billtime}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                    <td>${emp.billtype.name}</td>
                    <td>${emp.price}</td>
                    <td>${emp.exp}</td>
                    <td><a href="${pageContext.request.contextPath}/detail/${emp.id}">详细</a></td>
                    <td><a href="javascript:do_delete(${emp.id})">删除</a></td>
                    <td><a href="${pageContext.request.contextPath}/update/${emp.id}">修改</a></td>
                </tr>
            </c:forEach>
        </c:if>

        <tr>
            <td colspan="9" align="center" valign="middle">
                <a href="javascript:do_page(1)">首页</a>&nbsp;
                <a href="javascript:do_page(${requestScope.info.pageNum-1})">上一页</a>&nbsp;

                <c:forEach var="n" items="${requestScope.info.navigatepageNums}">
                    <a href="javascript:do_page(${n})">${n}</a>&nbsp;
                </c:forEach>

                <a href="javascript:do_page(${requestScope.info.pageNum+1})">下一页</a>&nbsp;
                <a href="javascript:do_page(${requestScope.info.pages})">尾页</a>&nbsp;
                ${requestScope.info.pageNum}/${requestScope.info.pages}页
            </td>
        </tr>
    </table>
    </form>
</div>
</body>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.0.min.js"></script>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="application/javascript">
    function do_page(pn) {
        $("#pageIndex").val(pn);
        $("#searchForm").submit();
    }
    function do_delete(id) {
        var url="${pageContext.request.contextPath}/delete/"+id;
        if(confirm("确认删除吗？")) {
            location.href = url;
        }
    }
    function do_delete_list() {
        if(confirm("确认删除吗？")) {
            $("#deleteForm").submit();
        }
    }
</script>
</html>
