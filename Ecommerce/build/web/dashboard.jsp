<%-- 
    Document   : dashboard
    Created on : 25 Nov, 2018, 2:13:56 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="javax.servlet.http.HttpSession"%>
<%@page  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Comm : <%= (String) session.getAttribute("username") %></title>
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
                  <li><button class="btn btn-success navbar-btn">Hi, <%= (String) session.getAttribute("username") %>!</button></li>
                  <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                </ul>                
              </div>
              
            </div>
          </nav>
        

                  
        <div class="container">
            <h1><%= (String) session.getAttribute("username") %>, this is where you trade!</h1>
            <form action="sellitem.jsp" method="post">
                <input type="hidden" name="username" value="<%= (String) session.getAttribute("username") %>">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Sell Item</button>
                </div>
            </form>
            <form action="searchitem.jsp" method="post">
                <input type="hidden" name="username" value="<%= (String) session.getAttribute("username") %>">
                <div class="form-group">
                    <button type="submit" class="btn btn-danger">Search Items to Buy</button>
                </div>
            </form>
            
            <h3>Press Sell Item to sell items on this site and press the search items button to search for items you wish to purchase.</h3>
            
            <h1>You have <span style="color: #ff9966;">
                    <% 
                        try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("select wallet from users where username='" + ((String) session.getAttribute("username")) + "'");
                        if(rs.next())
                        out.println(rs.getInt(1));
                        }catch(SQLException e){}
                        catch(ClassNotFoundException e){}
                    %>
                    (wallet-money)</span> left in your wallet.</h1>
        </div>
    </body>
</html>
