<%-- 
    Document   : AddPhase
    Created on : 23 Apr, 2018, 11:02:15 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phase Details</title>
    </head>
    <body>
        <form>
            <%
                String eid="";
                String from="";
                String to="";
                String name="";
                if(request.getParameter("did")!=null)
                {
                    String del="delete from tbl_phase where phase_id="+request.getParameter("did");
                    boolean b=obj.executeCommand(del);
                    if(b)
                    {
                        response.sendRedirect("AddPhase.jsp");
                    }
                }
                if(request.getParameter("eid")!=null)
                {
                    eid=request.getParameter("eid");
                    String sel="select phase_from,phase_to,phase_name from tbl_phase where phase_id="+eid;
                    ResultSet rs=obj.selectCommand(sel);
                    while(rs.next())
                    {
                        from=rs.getString("phase_from");
                        to=rs.getString("phase_to");
                        name=rs.getString("phase_name");
                    }
                }
            if(request.getParameter("btnsubmit")!=null)
            {
               
                if(!request.getParameter("hid").equals(""))
                {
                   String update="update tbl_phase set phase_from='"+request.getParameter("datefrom")+"',phase_to='"+request.getParameter("dateto")+"',phase_name='"+request.getParameter("txtphase")+"' where phase_id="+ request.getParameter("hid");
                   boolean b=obj.executeCommand(update);
                   if(b)
                   {
                       response.sendRedirect("AddPhase.jsp");
                   }
                }
                else
                {
                String ins="insert into tbl_phase(phase_from,phase_to,phase_name) values('"+request.getParameter("datefrom")+"','"+request.getParameter("dateto")+"','"+request.getParameter("txtphase")+"')";
                boolean b=obj.executeCommand(ins);
                if(b)
                {
                     response.sendRedirect("AddPhase.jsp");
                }
                }
            }
            %>
            <br>
            <br>
            <table align="center" border="1">
                <tr>
                    <th>Phase Name</th>
                    <td><input type="text" name="txtphase" required="" value="<%=name%>"></td>
                </tr>
                <tr>
                    <th>Phase From</th>
                    <td><input type="date" name="datefrom" required="" value="<%=from%>"></td>
                </tr>
                <tr>
                    <th>Phase From</th>
                    <td><input type="date" name="dateto" required="" value="<%=to%>">
                        <input type="hidden" name="hid" value="<%=eid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                <input type="submit" name="btnsubmit" value="Submit">
                <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
            
            <br>
            <br>
            <table border="1" align="center">
                <tr>
                    <th>S.No</th>
                    <th>Phase Name</th>
                    <th>Phase From</th>
                    <th>Phase To</th>
                </tr>
                <%
                int i=0;
                String sel="select * from tbl_phase";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {
                    i++;
                    %>
                    <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString("phase_name")%></td>
                        <td><%=rs.getString("phase_from")%></td>
                        <td><%=rs.getString("phase_to")%></td>
                        <td><a href="AddPhase.jsp?eid=<%=rs.getString("phase_id")%>">Edit</a></td>
                        <td><a href="AddPhase.jsp?did=<%=rs.getString("phase_id")%>">Delete</a></td>
                        
                    </tr>
                    <%
                }
                
                %>
            </table>
        </form>
    </body>
</html>
