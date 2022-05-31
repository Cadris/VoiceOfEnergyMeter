<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>

	<div class="container mt-5">
        <div class="jumbotron">
            <center><h1 class="display-4">Voice Of Energy Meter</h1><center>
            <p class="lead">The Energy Consumed is </p>

            <center>
                <h1 class="display-5">
                    <span id="value">${value}</span> kWh
                </h1>
                <a class="btn btn-primary btn-lg px-5 mt-3" href="#" role="button" onclick="voice()">In Voice</a>
            </center>

            <hr class="my-3">
            <p>The Cost of the Consumed Amount is </p>
            <h3 class="display-5">
                Rs. <span id="valueCost">${valueCost}</span>
            </h3>
            <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
        function voice() {
            var msg = new SpeechSynthesisUtterance();
            msg.text = document.getElementById("value").textContent + "kilo watt hour";
            console.log(msg.text);
            window.speechSynthesis.speak(msg);
        }
    </script>

</body>
</html>