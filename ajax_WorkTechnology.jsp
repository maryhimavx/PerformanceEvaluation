<%-- 
    Document   : ajax_WorkTechnology
    Created on : Feb 21, 2018, 2:49:20 PM
    Author     : user
--%>

<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     String count="";
     String tech=request.getParameter("id");
     String Work=request.getParameter("work");
 //String user=session.getAttribute("user_id").toString();
  
        String sel="select count(*) as count from tbl_worktechnology where tech_id='"+tech+"'and work_id='"+Work+"'";

        ResultSet rs=obj.selectCommand(sel);
           if (rs.next())
           {
             out.println(""+rs.getString("count"));
           }
 %>