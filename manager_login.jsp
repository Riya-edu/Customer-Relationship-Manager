<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page of Customer Relationship Manager</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<link rel="stylesheet" href="css/stylesheet.css" type="text/css">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"><link rel="stylesheet" href="./style.css">

</head>
<div id="container">
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
    <div class="box-form">
        <div class="left">
            <div class="overlay">
                <b>
            <p style="font-size:75px">Customer Relationship Manager</p>
            </b>
            <i>
            <p style="font-size:25px">Welcome to the Customer Relationship Manager. Please login using your credentials. </p>
           </i>
        </div>
        </div>

        <div class="right">
            <h5>Manager Login</h5>
            <br>
        <button class="btn" data-btn><a href="login.jsp">Admin Login</a></button>
        <button class="btn" data-btn><a href="customer_login.jsp">Customer Login</a></button>
    <br>
    <br>
            <p>Don't have an account? <a href="#">Create Your Account</a> it takes less than a minute</p>
            <div class="inputs">
            <form method="post" action="manager_login_servlet">
                <input type="email" name="musername" placeholder="Username">
                <br>
                <input type="password" name="mpassword" placeholder="Password">
                <p>forget password?</p>
                <div class="remember-me--forget-password">
                    <!-- Angular -->
        <label>
            <input type="checkbox" name="item" checked/>
            <span class="text-checkbox">Remember me</span>
        </label>
            <button type=submit style="cursor:pointer" value=Login>Login</button>
            </div>
                
                </form>
            </div>
            <br>
               
                <br>
                
        </div>
       
    </div> 
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
<script type="text/javascript">

  var status = document.getElementById("status").value;
  if(status=="failed"){
	  swal("Sorry", "Wrong email or password", "error")
  }

</script> 
</body>

</html>