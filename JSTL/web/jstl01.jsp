<%@ page import="java.util.List" %>
<%@ page import="domain.User" %>
<%@ page import="java.util.ArrayList" %><%--
JSTL
    全称 ： JSP Standard Tag Library  jsp标准标签库
    简化jsp的代码编写。 替换 <%%> 写法。 一般与EL表达式配合
怎么使用
    1. 导入jar文件到工程的WebContent/Web-Inf/lib  jstl.jar standard.jar
    2. 在jsp页面上，使用taglib 指令，来引入标签库
    3. 注意： 如果想支持 EL表达式，那么引入的标签库必须选择1.1的版本，1.0的版本不支持EL表达式。
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
--%>
<%--
常用标签
    <c:set></c:set>
    <c:if test=""></c:if>
    <c:forEach></c:forEach>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>jstl_01</title>
    </head>
    <body>
        <%--c:set--%>
        <%--声明一个对象name， 对象的值 zhangsan , 存储到了page（默认）， 指定是session --%>
        <c:set var="name" value="zhangsan" scope="session"></c:set>
        ${sessionScope.name}

        <%--c:if--%>
        <%--判断test里面的表达式是否满足，如果满足，就执行c:if标签中的输出 ， c:if 是没有else的。--%>
        <c:set var="age" value="18" scope="page"></c:set>
        <c:if test="${ age > 26 }">
            年龄大于了26岁...
        </c:if>

        <c:if test="${ age <= 26 }">
            年龄小于了26岁...
        </c:if>
        <%--定义一个变量名 flag  去接收前面表达式的值，然后存在session域中--%>
        <c:if test="${ age > 26 }" var="flag" scope="session">
            年龄大于了26岁...
        </c:if>
        ${flag}

        <%--c:forEach--%>
        <%--从1 开始遍历到10 ，得到的结果 ，赋值给 i ,并且会存储到page域中， step , 增幅为2，--%>
        <c:forEach begin="1" end="10" var="i" step="2">
            ${i}
        </c:forEach>
        <%--items : 表示遍历哪一个对象，注意，这里必须写EL表达式。 --%>
        <%--var: 遍历出来的每一个元素用user 去接收。 --%>
        <%
            List<User> userList = new ArrayList<>();
            userList.add(new User("zhangsan", 18));
            userList.add(new User("lisi", 28));
            userList.add(new User("wangwu", 38));
            userList.add(new User("maliu", 48));
            pageContext.setAttribute("list", userList);
        %>
        <c:forEach var="user" items="${list}">
            ${user.name } ----${user.age }
        </c:forEach>
    </body>
</html>
