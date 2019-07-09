<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .zhichu {
            color: #F00;
        }
        .shouru {
            color: #3F0;
        }
        .shouru {
            color: #6F0;
        }
        #form1 {
            text-align: center;
        }
    </style>
</head>

<body>
<div align="center">
    <h1>记账</h1>
<p>类型:
    <label>
        <input type="radio" name="RadioGroup1" value="支出" id="RadioGroup1_0" />
        <span class="zhichu">支出</span></label>
    <label>
        <input type="radio" name="RadioGroup1" value="收入" id="RadioGroup1_1" />
        <span class="shouru">收入</span></label>
    <label>
        <input type="radio" name="RadioGroup1" value="转账" id="RadioGroup1_2" />
        转账</label>
    <label>
        <input type="radio" name="RadioGroup1" value="借出" id="RadioGroup1_3" />
        借出</label>
    <label>
        <input type="radio" name="RadioGroup1" value="借入" id="RadioGroup1_4" />
        借入</label>
    <label>
        <input type="radio" name="RadioGroup1" value="还入" id="RadioGroup1_5" />
        还入</label>
    <label>
        <input type="radio" name="RadioGroup1" value="还出" id="RadioGroup1_6" />
        还出</label>
</p>
<p>标题:
    <label for="title"></label>
    <input name="title" type="text" id="title" size="60" />
</p>
<p>日期:
    <input name="date" type="text" id="date" size="20" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    金额:
    <label for="price">
        <input name="price" type="text" id="price" size="20" />
    </label>
</p>
<p>说明:
    <label for="exp"></label>
    <textarea name="exp" id="exp" cols="45" rows="10"></textarea>
    <br />
</p>
<form id="form1" name="form1" method="post" action="">
    <input type="submit" name="btnAdd" id="btnAdd" value="提交表单" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="remake" id="remake" value="重置表单" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" name="btnReturn" id="btnReturn" value="返回" />
</form>
</div>
</body>
</html>
