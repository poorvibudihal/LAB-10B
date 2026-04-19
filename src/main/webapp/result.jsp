<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Result Page</title>

<style>
.container {
    width: 350px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
.pass { color: green; }
.fail { color: red; }
</style>

</head>
<body>

<div class="container">

<h2>Student Result</h2>

<p><b><%= request.getAttribute("message") %></b></p>

<% if(request.getAttribute("rollno") != null) { %>

<p>Roll No: <%= request.getAttribute("rollno") %></p>
<p>Name: <%= request.getAttribute("name") %></p>

<p>Sub1: <%= request.getAttribute("s1") %></p>
<p>Sub2: <%= request.getAttribute("s2") %></p>
<p>Sub3: <%= request.getAttribute("s3") %></p>
<p>Sub4: <%= request.getAttribute("s4") %></p>
<p>Sub5: <%= request.getAttribute("s5") %></p>

<p>Average: <%= request.getAttribute("average") %></p>

<p class="<%= "PASS".equals(request.getAttribute("result")) ? "pass" : "fail" %>">
Result: <%= request.getAttribute("result") %>
</p>

<% } %>

<br>
<a href="index.jsp">Back to Form</a>

</div>

</body>
</html>