<%-- 
    Document   : HomePage
    Created on : Feb 7, 2018, 10:52:30 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String eid="";
        if(request.getParameter("id") != null)
        {
            String insQuery="insert into tbl_exam (emp_id,exam_date) values('"+session.getAttribute("user_id")+"',curdate())";
            boolean b=obj.executeCommand(insQuery);
            out.println(insQuery);
            if(b == true)
            {
                String selqry="select max(exam_id) as examid from tbl_exam";
                ResultSet rs=obj.selectCommand(selqry);
                if(rs.next())
                {
                    eid=rs.getString("examid");
                    session.setAttribute("ExamID", eid);
                    out.println(eid);
                    response.sendRedirect("StartExam.jsp");
                }
                
            }
//            else
//            {
//                
//            }
//                        
        }
    
    
    
    %>
    <body>
        <h1>Employee Home Page</h1>
        <a href="HomePage.jsp?id=1">Start Exam</a>
    </body>
</html>
