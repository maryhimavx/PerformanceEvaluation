<%-- 
    Document   : option
    Created on : Feb 22, 2018, 11:01:23 AM
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
        String qName="",optID="",Option="",isAns="";
        if(request.getParameter("btnsubmit") != null)
            {
                if(!request.getParameter("hid").equals(""))
                {
                   
                    String optname=request.getParameter("txtoption");
                    String q=request.getParameter("selQuestion");
                    String answer=request.getParameter("isAnswer");
                    
                    String upQuery="update tbl_option set opt_name='"+optname+"',q_id='"+q+"',opt_isanswer='"+answer+"'where opt_id='"+request.getParameter("hid")+"'";
                    boolean b=obj.executeCommand(upQuery);
                    
                    if(b == true)
                    {
                        response.sendRedirect("option.jsp");
                    }
                    else
                    {
                        out.println(upQuery);
                    }
                    
                }
                else
                {
                    String optName=request.getParameter("txtoption");
                    String qestion=request.getParameter("selQuestion");
                    String isAnswer=request.getParameter("isAnswer");

                    String insQuery="insert into tbl_option(opt_name,q_id,opt_isanswer) values ('"+optName+"','"+qestion+"','"+isAnswer+"')";
                    boolean b=obj.executeCommand(insQuery);

                    if( b== true)
                    {
                        response.sendRedirect("option.jsp");
                    }
                    else
                    {
                        out.println(insQuery);
                    }
                }

        }
          if (request.getParameter("delid") != null)
          {
                  String del = "delete from tbl_option where opt_id='" + request.getParameter("delid") + "'";
                  boolean b = obj.executeCommand(del);
                  response.sendRedirect("option.jsp");

           }
           if (request.getParameter("edid") != null) 
           {
                  String selQuery = "select * from tbl_option where opt_id='" + request.getParameter("edid") + "'";

                  ResultSet rs1 = obj.selectCommand(selQuery);
                  if (rs1.next()) 
                  {
                      optID = rs1.getString("opt_id");
                      
                      Option = rs1.getString("opt_name");
                      qName = rs1.getString("q_id");
                      isAns=rs1.getString("opt_isanswer");
                      

                  }

              }
    
        
    
    
    %>
    
    <body>
        <form method="post">
            <h2 align="center">Add options</h2>
            <input type="hidden" name="hid" value="<%=optID%>">
            <table align="center">
                <tr>
                    <td>Question</td>
                    <td>
                        <select name="selQuestion">

                            <option>--Select--</option>

                            <%
                                String selq2 = "select * from tbl_question";
                                ResultSet rs3 = obj.selectCommand(selq2);
                                while (rs3.next()) 
                                {
                            %>
                            <option value="<%=rs3.getString("q_id")%>" <% if (qName.equals(rs3.getString("q_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs3.getString("q_question")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Option</td>
                    <td><input type="text" name="txtoption" value="<%=Option%>"></td>
                </tr>
                <tr>
                    <td>Is answer?</td>
                    <td align="center">
                        <input type="radio" name="isAnswer" value="1"  />Yes
                        <input type="radio" name="isAnswer" value="0" checked/>No
                    </td>
                    
                </tr>
                 <tr>
                    <td align="center"><input align="center" type="submit" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
                        
            </table>
            <table border="1" align="center">
                
                <th>Sl.No</th>
               
                <th>Question</th>
                <th>option</th>
                <th>IsAnswer</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_question q,tbl_option o where q.q_id=o.q_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                     String ans="",ansYesNo="";
                     
                     ans=rs.getString("opt_isanswer");
                     
                     if(ans.equals("1"))
                     {
                         ansYesNo="Yes";
                     }
                     else
                     {
                         ansYesNo="No";
                     }
                     
                             
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                         <td><%=rs.getString("q_question")%></td>
                  
                       
                        <td><%=rs.getString("opt_name")%></td>
                        <td><%=ansYesNo%></td>
                        <td><a href="option.jsp?delid=<%=rs.getString("opt_id")%>">Delete</a></td>
                        <td><a href="option.jsp?edid=<%=rs.getString("opt_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
            
        </form>
    </body>
</html>
