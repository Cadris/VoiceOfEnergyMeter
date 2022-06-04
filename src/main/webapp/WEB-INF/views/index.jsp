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
    <title>Voice Of Energy Meter</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/home">Voice Of Energy Meter</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/manualEntryWeb">Manual Data Entry</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/dataChartWeb">Data Chart</a>
      </li>
    </ul>
  </div>
</nav>

	<div class="container mt-5">
        <div class="jumbotron">
            <center><h1 class="display-4">Voice Of Energy Meter</h1><center>
            <p class="lead">The Energy Consumed is </p>

            <center>
                <h1 class="display-5">
                    <span id="value">${value}</span> kWh
                </h1>
                <a class="btn btn-primary btn-lg px-5 mt-3" href="#" role="button" onclick="valueVoice()">Energy Consumed in Voice</a>
            </center>

            <hr class="my-3">
            <p>The Cost of the Consumed Amount is </p>
            <h3 class="display-5">
                Rs. <span id="valueCost">${valueCost}</span>
            </h3>
            <a class="btn btn-primary btn-lg" href="#" role="button" onclick="valueCostVoice()">Cost In Voice</a>
            <a class="btn btn-secondary btn-lg" href="https://www.cesc.co.in/wp-content/uploads/tariff/Tariff%20and%20Associated%20terms%20and%20conditions%20for%202019-20.pdf" role="button">See Tariff Chart</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
        function valueVoice() {
            var msg = new SpeechSynthesisUtterance();
            msg.text = "The Energy Consumed is " + document.getElementById("value").textContent + "kilo watt hour";
            console.log(msg.text);
            window.speechSynthesis.speak(msg);
        }
        function valueCostVoice() {
            var msg = new SpeechSynthesisUtterance();
            msg.text = "The cost of Energy Consumed is Rupees " + document.getElementById("valueCost").textContent;
            console.log(msg.text);
            window.speechSynthesis.speak(msg);
        }
        
        function ajaxCall(){
        	console.log("in");
        	$.ajax({
		   		type : "GET",
		   		contentType : "application/json",
		   		url : "/home/autoReload",
		   		dataType : 'json',
		   		
		   		success : function(data){
		   			location.reload(true); 
				}
        	});	
        }
        var ctx = "<%=request.getContextPath() %>";
       	//alert(ctx);
        $(document).ready(function(){
       		setInterval(ajaxCall,5000);
       	});
    </script>

</body>
</html>