<%-- 
    Document   : searchitem
    Created on : 25 Nov, 2018, 10:35:20 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- BOOTSTRAP -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>                        
                </button>
                <a class="navbar-brand" href="index.html">E-Comm</a>
              </div>
                
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="dashboard.jsp">Hi, <%= (String) session.getAttribute("username") %>!</a></li>
                  <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                </ul>                
              </div>
              
            </div>
          </nav>
                
          <div class="container">
            <h1>You can Buy items here!</h1>
            <form method="post" onsubmit="document.getElementById('flag').value='true'">
                <table class="table table-hover">
                    <thead>
                        <tr>
                          <th>Item Name</th>
                          <th>Item Type</th>
                          <th>Seller</th>
                          <th>Price</th>
                          <th>Purchase</th>
                        </tr>
                    </thead>
                    <tbody>
                <%
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery("select * from itemlist where itemBuyer is NULL and itemSeller<>'"+((String) session.getAttribute("username"))+"'");
                while(rset.next()){
                %>
                <tr>
                    <td><%=rset.getString(1) %></td>
                    <td><%=rset.getString(2) %></td>
                    <td><%=rset.getString(3) %></td>
                    <td><%=rset.getInt(4) %></td>
                    <td><%=rset.getInt("itemid")%></td>
                    <!--input type="text" name="itemid" value="<%--=rset.getInt("itemid")--%>">
                    <input type="hidden" name="flag" id="flag" value="false"-->
                    <td><button type="submit" class="btn btn-warning" name="submit" value="<%=rset.getInt("itemid")%>">Buy Item</button></td>
                </tr>
                
                <% 
                    }
                   %>
                </tbody>
                </table>
                </form>
                <%  
                    if(request.getParameter("submit")!=null){
                        String itemid = request.getParameter("submit");
                        ResultSet buyitem = stmt.executeQuery("select * from itemlist where itemid="+itemid);
                        buyitem.next();int bi = (buyitem.getInt("itemPrice"));String bs = (buyitem.getString("itemSeller"));
                        ResultSet userinfo = stmt.executeQuery("select * from users where username='"+((String) session.getAttribute("username"))+"'");                        
                        userinfo.next();int ui = (userinfo.getInt("wallet"));
                        //out.println(bi + ui);    
                       
                         if(bi<=ui){
                             //out.println("update user set wallet=wallet - " + (bi) + " where username='"+((String) session.getAttribute("username"))+"'"+";");
                            int buy = stmt.executeUpdate("update itemlist set itemBuyer='"+((String) session.getAttribute("username"))+"' where itemId="+itemid);
                            buy = stmt.executeUpdate("update users set wallet=wallet - " + (bi) + " where username='"+((String) session.getAttribute("username"))+"'");
                            buy = stmt.executeUpdate("update users set wallet=wallet + " + (bi) + " where username='"+(bs)+"'");

                            out.println("<h1>Purchase Successfull!</h1>");
                         }
                         else{
                            out.println("<h1>Not enough money for the purchase in your wallet.</h1>");
                         }
                        
                    }
                    }catch(SQLException e){}
                catch(ClassNotFoundException e){}
                %>
                    
            
          </div>
    </body>
</html>
