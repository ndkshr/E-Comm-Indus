<%-- 
    Document   : login
    Created on : 25 Nov, 2018, 10:58:38 AM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Comm : Login</title>
        
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
                  <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                  <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
              </div>
            </div>
          </nav>
        
        <div class="container">
            <form method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" placeholder="Enter your E-mail id" required />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Log In</button>
                </div>
            </form>
            <%
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
                    Statement stmt = conn.createStatement();
                    ResultSet rset = stmt.executeQuery("select password, wallet from users where username='"+ username +"'");
                    int wallet;
                    if(rset.next()){
                        wallet = rset.getInt("wallet");
                        String dbPassword = rset.getString("password");
                        if(dbPassword.equals(password)){
                            
                            /*We have to put things inside the session.*/
                                    
                            HttpSession sess = request.getSession();
                            sess.setAttribute("username", request.getParameter("username"));
                            //out.println((String) session.getAttribute("username"));
        
                            %>
                            <jsp:forward page="dashboard.jsp">
                                <jsp:param name="uname" value="<%=username%>" />
                                <jsp:param name="wallet" value="<%=wallet%>" />
                            </jsp:forward>
                            <%
                        }
                    else{
                        out.println("<p style='color:red;'>Invalid credentials!</p>");
                    }
                    }
                }catch(SQLException e){}
                catch(ClassNotFoundException e){}
            %>
        </div>
    </body>
</html>
