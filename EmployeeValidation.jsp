<%-- 
    Document   : EmployeeValidation
    Created on : 23 Apr, 2018, 10:55:00 AM
    Author     : user
--%>
<%@page import="sentimentalanalysis.PESentimentAnalysis"%>
<%@page import="java.io.File"%>
<%@page import="sentimentalanalysis.PECommentSection"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee validation</title>
    </head>
    <body>
        <form>
            <br>
            <br>
            <%
                if(request.getParameter("btnsubmit")!=null)
                {
                    String mark=request.getParameter("txtmark");
                    String comment=request.getParameter("txtvalue");
                    System.out.println(comment);
                    PECommentSection s=new PECommentSection();
                   double cvalue= s.CommentSection(comment);
                   //,hrmark_sentiment
                   String ins="insert into(hrmark_value,emp_id,phase_id,hrmark_sentiment,hr_comment) values('"+mark+"','"+session.getAttribute("emp")+"','"+session.getAttribute("phase")+"','"+cvalue+"','"+comment+"')";
                   boolean b=obj.executeCommand(ins);
                   if(b)
                   {
                      %>
                      <script>
                          alert("Value Saved");
                           setTimeout(function(){window.location.href='ViewEmployee.jsp'},100);
                      </script>
                      <%
                   }
                }
            %>
             <!--select emp_name,work_name,work_description,module_name,assign_deadline,assign_actualend,work_estimatedend from  tbl_clientwork cw inner join tbl_workmodule wm on cw.work_id=wm.work_id inner join tbl_workassign wa on wm.module_id=wa.module_id inner join tbl_emp e on wa.emp_id=e.emp_id-->
            <!--SELECT * FROM  tbl_clientwork--> 
<!--WHERE work_postdate >='2018-02-01' AND work_postdate <= '2018-02-30'-->
            <table align="center" border="1">
                <tr>
                    <th>S.No</th>
                    <th>Work Name</th>
                    <th>Description</th>
                    <th>Estimated End</th>
                    <th>Module name</th>
                    <th>Deadline</th>
                    <th>Actual End</th>
                </tr>
                <%
                    String pfrom="";
                    String pto="";
                    String sel1="select phase_from,phase_to from tbl_phase where phase_id="+session.getAttribute("phase");
                    ResultSet rs1=obj.selectCommand(sel1);
                    while(rs1.next())
                    {
                        pfrom=rs1.getString("phase_from");
                        pto=rs1.getString("phase_to");
                    }
                    int i=0;
                    
                String sel="SELECT DISTINCT * FROM  tbl_clientwork cw inner join tbl_workmodule wm on cw.work_id=wm.work_id inner join tbl_workassign wa on wm.module_id=wa.module_id WHERE work_postdate >='"+pfrom+"' AND work_postdate <= '"+pto+"' and wa.emp_id="+session.getAttribute("emp");
                ResultSet rs=obj.selectCommand(sel);
                out.println(sel);
                while(rs.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("work_name")%></td>
                        <td><%=rs.getString("work_description")%></td>
                        <td><%=rs.getString("work_estimatedend")%></td>
                        <td><%=rs.getString("module_name")%></td>
                        <td><%=rs.getString("assign_deadline")%></td>
                        <td><%=rs.getString("assign_actualend")%></td>
                        
                    </tr>
                    <%
                }
                %>
                
    
            </table>
                <br>
                <br>
                <table align="center" border="1">
                <tr>
                    <th>Valuation</th>
                    <td>
                        <textarea name="txtvalue" required="" rows="5" cols="20">
                            Must end with space and dot
                            eg: Good .
                        </textarea></td>
                </tr>
                <tr>
                    <th>Mark</th>
                    <td>
                        <input type="text" name="txtmark" required="">
                        </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Submit">
                    </td>
                </tr>
                </table>
        </form>
    </body>
</html>
