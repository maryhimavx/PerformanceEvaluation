<%-- 
    Document   : ajax_specialization
    Created on : Feb 21, 2018, 1:23:54 PM
    Author     : user
--%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     String count="";
     String tech=request.getParameter("id");
     String employee=request.getParameter("emp");
 //String user=session.getAttribute("user_id").toString();
  
        String sel="select count(*) as count from tbl_specialization where tech_id='"+tech+"'and emp_id='"+employee+"'";

        ResultSet rs=obj.selectCommand(sel);
           if (rs.next())
           {
             out.println(""+rs.getString("count"));
           }
 %>