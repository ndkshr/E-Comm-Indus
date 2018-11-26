<%-- 
    Document   : signup
    Created on : 25 Nov, 2018, 11:05:42 AM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Comm : Sign Up</title>
        
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
            <form method="post" onsubmit="checkpswd()">
                <input type="hidden" name="submitflag" value="True">
                
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" placeholder="Enter your Name" required />
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" placeholder="Enter your E-mail id" required />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required />
                </div>
                <div class="form-group">
                    <label for="repassword">Password</label>
                    <input type="password" class="form-control" name="repassword" id="repassword" placeholder="Re enter your password" required />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                </div>
            </form>
        
            <%
            
            String pass = request.getParameter("password");            
            String repass;
            repass= request.getParameter("repassword");
            if(pass!=null && repass!=null)
            {if(!pass.equals(repass)){
               out.println("<p style='color:red;'>Passwords do not match!</p>");
            }
            
            else{
                /*
                1. Check wheather the username is available in the database or not.
                2. if it is available put the entered data into database. else, return username unavailable.
                3. forward to the dashboard page.     
                4. Put things in the session.
                */
                try{
                String username = request.getParameter("username");
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
                Statement stmt = conn.createStatement();            
                ResultSet rset = stmt.executeQuery("select * from users where username='"+ username +"'");
                int wallet;
                if(rset.next()){
                    
                    out.println("<p style='color:red;'>Username <strong>" + username + "</strong> is already taken!</p>");
                }
                
                else{                                      
                    
                    int newuser = stmt.executeUpdate("insert into users values('" + (username) + "', '" + (password) + "', 500, '" + (name) + "')");
                    out.println(newuser + " is added!");
                    HttpSession sess = request.getSession();
                    sess.setAttribute("username", request.getParameter("username"));
                    out.println((String) session.getAttribute("username"));
                    %>
                    <jsp:forward page="dashboard.jsp" >
                        <jsp:param name="uname" value="<%=username%>" />
                        <jsp:param name="wallet" value="<%=500%>" />
                    </jsp:forward>>
                    <%
                }
                
                }catch(SQLException e){}
                catch(ClassNotFoundException e){}
            }
            }
            %>
        </div>
    </body>
</html>
