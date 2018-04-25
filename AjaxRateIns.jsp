<%-- 
    Document   : AjaxRateIns
    Created on : 23 Apr, 2018, 10:06:20 AM
    Author     : user
--%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%
    String ins="insert into tbl_rating(rating_value,work_id) values('"+request.getParameter("id") +"','"+session.getAttribute("work") +"')";
    boolean b=obj.executeCommand(ins);
    System.out.println(ins);
%>
