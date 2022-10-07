<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculate">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>Số thứ nhất:</td>
                <td><input type="number" name="firstNumber"></td>
            </tr>
            <tr>
                <td>Phép tính</td>
                <td>
                    <select name="operator">
                        <option value="+">+</option>
                        <option value="-">-</option>
                        <option value="*">*</option>
                        <option value="/">/</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Số thứ hai:</td>
                <td><input type="number" name="secondNumber"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit" value="Submit">Submit</button>
                </td>
            </tr>

        </table>
    </fieldset>
</form>
</body>
</html>