<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Result Form</title>

<script>
function validateForm() {
    let fields = ["rollno","name","sub1","sub2","sub3","sub4","sub5"];

    for (let i = 0; i < fields.length; i++) {
        let val = document.forms["myForm"][fields[i]].value;
        if (val === "") {
            alert("All fields must be filled!");
            return false;
        }
    }

    // Marks validation
    for (let i = 1; i <= 5; i++) {
        let mark = document.forms["myForm"]["sub"+i].value;
        if (mark < 0 || mark > 100) {
            alert("Marks must be between 0 and 100");
            return false;
        }
    }

    return true;
}
</script>

<style>
.container {
    width: 350px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ccc;
}
</style>

</head>

<body>

<div class="container">
<h2>Student Marks Entry</h2>

<form name="myForm" action="processResult" method="post" onsubmit="return validateForm()">

Roll No: <input type="text" name="rollno"><br><br>
Name: <input type="text" name="name"><br><br>

Sub1: <input type="number" name="sub1"><br><br>
Sub2: <input type="number" name="sub2"><br><br>
Sub3: <input type="number" name="sub3"><br><br>
Sub4: <input type="number" name="sub4"><br><br>
Sub5: <input type="number" name="sub5"><br><br>

<input type="submit" value="Calculate Result">

</form>
</div>

</body>
</html>