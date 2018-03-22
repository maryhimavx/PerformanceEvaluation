<%-- 
    Document   : ajax_exam
    Created on : Mar 21, 2018, 3:49:47 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
  String qid=request.getParameter("qid");
    String opt=request.getParameter("opt");
    System.out.println("ques"+qid);
    System.out.println("opt"+opt);
    
    String examqid="";
    String sel="select examQ_id from tbl_examquestions where exam_id='"+session.getAttribute("ExamID")+"' and q_id='"+qid+"'";
    ResultSet rs=obj.selectCommand(sel);
    if(rs.next())
    {
        examqid=rs.getString("examQ_id");
        String update="update tbl_examquestions set opt_id='"+opt+"' where examQ_id="+examqid;
        obj.executeCommand(update);
        System.out.println(update);
    }
    else
    {
    
    
    String ins="insert into tbl_examquestions(exam_id,q_id,opt_id) values('"+session.getAttribute("ExamID")+"','"+qid+"','"+opt+"')";
    System.out.println(ins);
    obj.executeCommand(ins);
    }
%>