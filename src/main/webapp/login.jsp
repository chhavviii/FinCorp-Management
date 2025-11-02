<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BFSI Login</title>
</head>
<body>

<div class="container" 
     style="width:300px; margin:50px auto; padding:20px; border:1px solid #ccc; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.1); font-family:Arial, sans-serif; background:#f9f9f9;">

  <h2 style="text-align:center; margin-bottom:20px; color:#333;">BFSI Login</h2>

  <form action="login" method="post" style="display:flex; flex-direction:column;">
    
    <label for="username" style="margin-bottom:5px; font-weight:bold;">Username:</label>
    <input type="text" id="username" name="username" required 
           style="padding:8px; margin-bottom:15px; border:1px solid #ccc; border-radius:5px;">

    <label for="password" style="margin-bottom:5px; font-weight:bold;">Password:</label>
    <input type="password" id="password" name="password" required 
           style="padding:8px; margin-bottom:20px; border:1px solid #ccc; border-radius:5px;">

    <input type="submit" value="Login" 
           style="padding:10px; background:#28a745; color:white; border:none; border-radius:5px; cursor:pointer; font-weight:bold;">
  </form>
</div>

</body>
</html>