<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Vape3One - Monterey's Premier Vape Shop</title>
	
	<!-- font awesome cdn -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">

	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- jquery and js -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="navshrink.js"></script>

	<!-- for bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>

	<link rel="stylesheet" type="text/css" href="/styles.css">	
	
	<script src="/javascript/jscript.js"></script>
	
</head>
<body>
	<div class="saveheader">
		<p>Get 10% when you use the code SAVE10</p>
	</div>
	<div id="navigation1">
		<div class="cartheader">
	
			<c:if test="${amiadmin == 'yes' }">
				<a href="/admin">Admin Page |</a>
			</c:if>
			<a href="/registration">Sign Up</a> |  
			<c:if test="${isloggedin == null }">
				<a href="/login">Log In</a>
			</c:if> 
			<c:if test="${isloggedin == 'yes' }">
				<a href="/logout">Logout</a>
			</c:if>
			
			<!-- change this to a cart icon -->
			<a href="/cart">  |  Cart</a>
	
		</div>
		<div class="headerlogo">
			<div class="logo">
				<a href="/"><img id ="logo1" src="/images/vape3onelogo1.png" alt="logo"></a>
			</div>
		</div>
		<div id="navigation"  class="container">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="d-md-flex d-block flex-row mx-md-auto mx-0">
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				  <div class="collapse navbar-collapse" id="navbarNavDropdown">
				    <ul class="navbar-nav justify-content-center">
				      <li class="nav-item active">
				        <a class="nav-link coollink" href="/">Home <span class="sr-only">(current)</span></a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/sales">Sale</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/devices">Devices</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/eliquids">E-Liquids</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/tanks">Tanks</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/accessories">Accessories</a>
				      </li>
				    </ul>
				  </div>
				</div>
			</nav>
		</div>     
	</div><!-- end of navigation1 div -->
	<div class="wrapper">
		<div class="container">
			<div class="imagecarousel" id="imagecarousel1">
				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100" src="images/car1.jpg" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/car2.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/car3.jpg" alt="Third slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100" src="images/car4.jpg" alt="Third slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
			
			<div class="itemtypesdiv">
				<div class="row">
					<div class="itemtypecontainer col-lg-3 col-md-6 col-sm-6">
						<div class="itemtypebox">
							<h3>Shop Devices</h3>
							<a href="/devices"><img src="images/itemtype4.jpg" alt=""></a>
						</div>
					</div>
					<div class="itemtypecontainer col-lg-3 col-md-6 col-sm-6">
						<div class="itemtypebox">
							<h3>Shop E-Liquids</h3>
							<a href="/eliquids"><img src="images/itemtype5.jpg" alt=""></a>
						</div>
					</div>
					<div class="itemtypecontainer col-lg-3 col-md-6 col-sm-6">
						<div class="itemtypebox">
							<h3>Shop Tanks</h3>
							<a href="tanks"><img src="images/itemtype2.jpg" alt=""></a>
						</div>
					</div>
					<div class="itemtypecontainer col-lg-3 col-md-6 col-sm-6">
						<div class="itemtypebox">
							<h3>Shop Accessories</h3>
							<a href="/accessories"><img src="images/itemtype3.jpg" alt=""></a>
						</div>
					</div>
				</div>
			</div>


			<div class="aboutusdiv">
				<div class="row">
					<div id="leftaboutdiv" class="col-lg-6 col-md-12 col-sm-12">
						<div class="leftaboutheader">
							<h2>About Us</h2>
						</div>
						<div class="aboutcontent">
							<p>Vape3one started as a group of friends wanting to help people quit smoking. Vape3One started off as a business catered to help friends and family quit smoking, a delivery service was started to help educate and provide vapes, accessories, and e-liquid to anyone wanting to quit smoking cigarettes. From there Vape3One developed a partnership with the Blue Fin on Cannery Row to sell the products inside of their location. Then they were able to grow the Vape community and open this shop in Marina, California.
							</p>

							<p>Vape3one is the first exclusive Vape shop on the Monterey Peninsula, specializing in vapes, e-cigarettes, mods, personal vaporizers, variable voltage devices, atomizers, cartomizers, tanks, rebuildable coils, wick, wire, with the largest selection of e-liquid.  VAPE3ONE's goal is to help smokers quit the habit of smoking cigarettes to provide a better and healthier alternative.</p>
						</div>
						<div class="mapdiv">
							<h2>Where are we Located?</h2>
							<div style="width: 100%">
								<iframe width="100%" height="375" src="https://maps.google.com/maps?width=100%&amp;height=600&amp;hl=en&amp;coord=36.6831113, -121.80339800000002&amp;q=3074%20Del%20Monte%20Blvd%2C%20Marina%2C%20CA%2093933+(Vape3One)&amp;ie=UTF8&amp;t=&amp;z=14&amp;iwloc=B&amp;output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.maps.ie/create-google-map/">Google map generator</a></iframe>
							</div>

						</div>
					</div>

					<div id="rightaboutdiv" class="col-lg-6 col-md-12 col-sm-12">
						<div class="rightaboutheader">
							<h2>Instagram</h2>
						</div>
						<script src="https://apps.elfsight.com/p/platform.js" defer></script>
						<div id="instafeed" class="elfsight-app-e32bad01-d7db-4817-93f0-ad855cb2f20a"></div>
					</div>
				</div>
			</div>





			<!-- FOOTER!!!!!!! -->
		<div class="footerdiv">
			<!-- Footer -->
			<footer class="page-footer font-small blue-grey lighten-5 mt-4">

			  <div style="background-color: #21d192;">
			    <div class="container">

			      <!-- Grid row-->
			      <div class="row py-4 d-flex align-items-center">

			        <!-- Grid column -->
			        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
			          <h6 class="mb-0">Get connected with us on social networks!</h6>
			        </div>
			        <!-- Grid column -->

			        <!-- Grid column -->
			        <div id="socialmediaicondiv" class="col-md-6 col-lg-7 text-center text-md-right">
			          <!-- Twitter -->
			          <a class="tw-ic" href="https://twitter.com/vape3one?lang=en" target="_blank">
			            <i class="fa fa-twitter white-text mr-4"> </i>
			          </a>
			          <!-- Google +-->
			          <a class="gplus-ic" href="https://www.facebook.com/v8pe3one/" target="_blank">
			            <i class="fa fa-facebook white-text mr-4"> </i>
			          </a>
			          <!--Yelp -->
			          <a class="li-ic" href="https://www.yelp.com/biz/vape3one-marina-2" target="_blank"> 
			            <i class="fa fa-yelp white-text mr-4"></i>
			          </a>
			          <!--Instagram-->
			          <a class="ins-ic" href="https://www.instagram.com/vape3one/?hl=en" target="_blank">
			            <i class="fa fa-instagram white-text"> </i>
			          </a>

			        </div>
			        <!-- Grid column -->

			      </div>
			      <!-- Grid row-->

			    </div>
			  </div>

			  <!-- Footer Links -->
			  <div class="container text-center text-md-left mt-5">

			    <!-- Grid row -->
			    <div class="row mt-3 dark-grey-text">

			      <!-- Grid column -->
			      <div class="col-md-3 col-lg-4 col-xl-3 mb-4">

			        <!-- Content -->
			        <h6 class="text-uppercase font-weight-bold">Newsletter Sign-up</h6>
			        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
			        <p>Be the first one to hear about our special</p>
			        <form class="form-inline">
							  <div class="form-group form-sm mx-sm-3 mb-2">
							    <label for="newsletteremail" class="sr-only">Password</label>
							    <input type="email" class="form-control form-control-sm" id="newsletteremail" name="newsletteremail" placeholder="Email Address">
							  </div>
							  <button type="submit" class="btn btn-dark btn-sm mb-2">Subscribe</button>
							</form>

			      </div>
			      <!-- Grid column -->

			      <!-- Grid column -->
			      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

			        <!-- Links -->
			        <h6 class="text-uppercase font-weight-bold">Customer Service</h6>
			        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
		      		<p>
			          <a class="dark-grey-text" href="#!">Privacy Policy</a>
			        </p>
			        <p>
			          <a class="dark-grey-text" href="#!">Age Policy</a>
			        </p>
			        <p>
			          <a class="dark-grey-text" href="#!">Refund Policy</a>
			        </p>
			        <p>
			          <a class="dark-grey-text" href="#!">Fraud Protection</a>
			        </p>

			      </div>
			      <!-- Grid column -->

			      <!-- Grid column -->
			      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

			        <!-- Links -->
			        <h6 class="text-uppercase font-weight-bold">Useful Links</h6>
			        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
			        <p>
			          <a class="dark-grey-text" href="#!">FAQ</a>
			        </p>
			        <p>
			          <a class="dark-grey-text" href="#!">Terms & Conditions</a>
			        </p>
			      </div>
			      <!-- Grid column -->

			      <!-- Grid column -->
			      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
			        <!-- Links -->
			        <h6 class="text-uppercase font-weight-bold">Contact</h6>
			        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
			        <p><i class="fa fa-home mr-3"></i> 3074 Del Monte Blvd, Marina, CA 93933</p>
			        <p><i class="fa fa-envelope mr-3"></i> allen@vape3one.com</p>
			        <p><i class="fa fa-phone mr-3"></i> +1 (831)920-1738</p>
			      </div>
			      <!-- Grid column -->

			    </div>
			    <!-- Grid row -->

			  </div>
			  <!-- Footer Links -->

			  <!-- Copyright -->
			  <div class="footer-copyright text-center text-black-50 py-3">© 2018 Copyright: Vape3One
			  </div>
			  <!-- Copyright -->

			</footer>
			<!-- Footer -->
		</div>




		</div> <!-- end of wrapper div  -->
	</div>   <!-- end of container div -->
</body>
</html>