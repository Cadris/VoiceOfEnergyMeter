<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Chart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <style>
        .table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
            background-color: #1ecbe1;
            color: #fff;
        }
        .scroll{
		    color:#fff;
		    margin-top:100px;
		}
		
		#toTopBtn {
		     position: fixed;
		    bottom: 26px;
		    right: 39px;
		    z-index: 98;
		    padding: 21px;
		    background-color: hsla(5,76%,62%,.8);
		    
		}
		
		.js .cd-top--fade-out {
		    opacity: .5;
		}
		
		.js .cd-top--is-visible {
		    visibility: visible;
		    opacity: 1;
		}
		
		.js .cd-top {
		    visibility: hidden;
		    opacity: 0;
		    transition: opacity .3s,visibility .3s,background-color .3s;
		}
		
		.cd-top {
		    position: fixed;
		    bottom: 20px;
		    bottom: var(--cd-back-to-top-margin);
		    right: 20px;
		    right: var(--cd-back-to-top-margin);
		    display: inline-block;
		    height: 40px;
		    height: var(--cd-back-to-top-size);
		    width: 40px;
		    width: var(--cd-back-to-top-size);
		    box-shadow: 0 0 10px rgba(0,0,0,.05) !important;
		    background: url(https://res.cloudinary.com/dxfq3iotg/image/upload/v1571057658/cd-top-arrow.svg) no-repeat center 50%;
		    background-color: hsla(5,76%,62%,.8);
		    background-color: hsla(var(--cd-color-3-h),var(--cd-color-3-s),var(--cd-color-3-l),0.8);
		}
		        
    </style>
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/home">Voice Of Energy Meter</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/home">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/manualEntryWeb">Manual Data Entry</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/dataChart">Data Chart</a>
      </li>
    </ul>
  </div>
</nav>

	<div class="container mt-5">
	<a href="#" id="toTopBtn" class="cd-top text-replace js-cd-top cd-top--is-visible cd-top--fade-out" data-abc="true"></a>
        
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="thead-dark text-center">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Power Consumed</th>
                    <th scope="col">Entry Mode</th>
                    <th scope="col">Data Insert Time</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${dataList}" var="ed" varStatus="i">
	                  <c:choose>
					    <c:when test = "${ed.status == 'NORMAL'}">
					        <tr class="text-center" style="color: red;">
			                    <th scope="row">${ed.id}</th>
			                    <td>${ed.power}</td>
			                    <td>${ed.entryMode}</td>
			                    <td>${ed.insertDate}</td>
			                  </tr>
					    </c:when> 
					    <c:otherwise>
					        <tr class="text-center">
			                    <th scope="row">${ed.id}</th>
			                    <td>${ed.power}</td>
			                    <td>${ed.entryMode}</td>
			                    <td>${ed.insertDate}</td>
			                  </tr>
					    </c:otherwise>
					  </c:choose>
				  </c:forEach>
                </tbody>
              </table>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
	    $(document).ready(function() {
	   	  $(window).scroll(function() {
	   	    if ($(this).scrollTop() > 20) {
	   	      $('#toTopBtn').fadeIn();
	   	    } else {
	   	      $('#toTopBtn').fadeOut();
	   	    }
	   	  });
	
	   	  $('#toTopBtn').click(function() {
	   	    $("html, body").animate({
	   	      scrollTop: 0
	   	    }, 1000);
	   	    return false;
	   	  });
	   	});
	    
    </script>
</body>
</html>