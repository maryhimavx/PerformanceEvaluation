<%-- 
    Document   : ajax_question
    Created on : Feb 28, 2018, 3:46:36 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
    <script src="jq.js" type="text/javascript"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<script>
    function insert(v)
    {
        var qid=document.getElementById("quests");
        $.ajax(
                {
                    url: "ajax_insert.jsp",
                    data: {ques:qid,opt:v},
                    success: function (result) {
                        
                    }
                })
    }
</script>-->
<%
    ArrayList<Integer> a=(ArrayList<Integer>)session.getAttribute("qId");//convert qId of type string to atrraylist of integer
    
    
    int id,qids;
    String question="";
    
    id=Integer.parseInt(request.getParameter("id"));
    qids=a.get(id);
    
    
   Object qq=(Object)qids;
   Object qqs=session.getAttribute("totc");
    if(qq==qqs)
    {
        %>
        <h1 align="center" style="color: green">Exam Completed..Click Finish Exam Link to see your Result</h1>
        <h1 align="center" style="color: Red"><a href="">Finish Exam</a></h1>
        <%
    }
    
    else
    {
    
    
    String selQry="select * from tbl_question where q_id='"+qids+"'";
    ResultSet rs=obj.selectCommand(selQry);
    if(rs.next())
    {
        question=rs.getString("q_question");
        
    }
    
int qno=id+1;

%>
<input type="hidden" id="quests" name="quests" value="<%=qids%>">
<table align="center">
    <tr>
        <td><%=qno%>. <%=question%></td>
    </tr>
    <%
    
        String optMarked="";
        String select="select opt_id from tbl_examquestions eq inner join tbl_exam e on eq.exam_id=e.exam_id where eq.q_id='"+qids+"' and e.exam_id="+session.getAttribute("ExamID");
       System.out.println(select);
        ResultSet rss=obj.selectCommand(select);
        if(rss.next())
        {
            optMarked=rss.getString("opt_id");
            System.out.println(optMarked+"Previous");
        }
    
    
    
    
    
    
        String optId="";
        String sel="select opt_id,opt_name from tbl_option where q_id='"+qids+"'";
        System.out.println(sel);
        ResultSet rs1=obj.selectCommand(sel);
        while(rs1.next())
        { 
            optId=rs1.getString("opt_id");
            System.out.println(optId);
        
          %>
          <tr>
              <td><input type="radio" name="answer" id="answer" <%if(optMarked.equals(optId)) {%>checked="checked" <%}%> value="<%=rs1.getString("opt_id")%>" > <%=rs1.getString("opt_name")%></td>
          </tr>
          
    
    
    
    <%
        }
    }
    %>
</table>
 