<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
        <title>forward - redirect</title>
</head>
<body>
<h1>Test Forward - Redirect</h1>
<br/>
<form action="/think" method ="post">
    <fieldset>
        <legend>My Think</legend>
        Enter my think: <input type="text" name="think"/> <br>
        <input type="submit" name ="send" value = "Send">
    </fieldset>
</form>
</body>
</html>