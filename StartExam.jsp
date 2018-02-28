<%-- 
    Document   : StartExam
    Created on : Feb 28, 2018, 1:36:54 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            
            
            ArrayList<Integer> QuestionID=new ArrayList<Integer>();
            
            String techID="";
            String selQry="select tech_id from tbl_specialization where emp_id='"+session.getAttribute("user_id")+"'";
            ResultSet rs=obj.selectCommand(selQry);
            while(rs.next())
            {
                techID=rs.getString("tech_id");
                
                String selQry1="select q_id from tbl_question where tech_id='"+techID+"'";
                ResultSet rs1=obj.selectCommand(selQry1);
                while(rs1.next())
                {
                    QuestionID.add(rs1.getInt("q_id"));
                }
            }
            
               session.setAttribute("qId",QuestionID );
               
               
               
               
               
               
               
               
               
               
               
               Integer totalCount=4;
        
        %>
    </body>
</html>
