<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HTML TABLE-7</title>
  </head>
  <body>
  <jsp:include page="sellerNav.jsp"></jsp:include>
    <center>
      <h1>Customer Order Details</h1>
      <table border="1" cellpadding="8" style="border-collapse: collapse">
        <tr>
          <th rowspan="11">HHO</th>
          <th>Order no:</th>
          <td colspan="3">#ABC001</td>
        </tr>
        <tr>
          <th>Order Date:</th>
          <td colspan="3">23-Mar-2016</td>
        </tr>
        <tr>
          <th colspan="4">Customer</th>
        </tr>
        <tr>
          <th>Name:</th>
          <td colspan="3">John Papas</td>
        </tr>
        <tr>
          <th>Address:</th>
          <td colspan="3">Independence Day 5th str,1151</td>
        </tr>
        <tr>
          <th colspan="4">Order Details</th>
        </tr>
        <tr>
          <td>1.</td>
          <td>Of Mice and Men</td>
          <td>Book</td>
          <td>$10.00</td>
        </tr>
        <tr>
          <th colspan="3">Total:</th>
          <td>$272</td>
        </tr>
      </table>
    </center>
  </body>
</html>
