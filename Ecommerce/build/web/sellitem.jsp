<%-- 
    Document   : sellitem
    Created on : 25 Nov, 2018, 7:06:58 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Comm : Sell Item</title>
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
            <h1>You can sell items here!</h1>
            <form method="post">
                <input type="hidden" name="flag" value="flag">
                <div class="form-group">
                    <label for="itemname">Item Name</label>
                    <input type="text" class="form-control" name="itemname" placeholder="Enter the Item Name" required />             
                </div>
                <div class="form-group">
                    <label for="itemtype">Item Type</label>
                    <input type="text" class="form-control" name="itemtype" placeholder="Enter the item type" required />
                </div>
                <div class="form-group">
                    <label for="itemprice">Item Price</label>
                    <input type="number" class="form-control" name="itemprice" placeholder="Enter the price for the item" required />
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-danger">Put Item on Sale</button>
                </div>
            </form>
            <%
                String itemname = request.getParameter("itemname");
                String itemtype = request.getParameter("itemtype");
                String itemprice = request.getParameter("itemprice");
                String itemseller = (String) session.getAttribute("username");                             
                //out.println(itemseller);
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecomm", "root", "root");
                    Statement stmt = conn.createStatement();
                    //out.println("*" + itemseller + "*");
                    if(request.getParameter("itemname")!=null){
                        //out.println(request.getParameter("itemname"));
                        out.println("Item put on sale");
                        int sellitem = stmt.executeUpdate("insert into itemlist (itemName,itemType,itemSeller,itemPrice,itemBuyer) values('"+ request.getParameter("itemname") +"', '"+ request.getParameter("itemtype") +"', '"+ itemseller +"', "+ request.getParameter("itemprice") +", NULL )");
                        //out.println(itemseller);
                    }
                    
                }catch(SQLException e){}
                 catch(ClassNotFoundException e){}
            %>
        </div>
    </body>
</html>
