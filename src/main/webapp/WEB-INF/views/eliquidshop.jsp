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
			<c:if test="${isloggedin == null }">
				<a href="/registration">Sign Up</a> | <a href="/login">Log In</a>
			</c:if> 
			<c:if test="${isloggedin == 'yes' }">
				<a href="/logout">Logout</a>
			</c:if>
			
			<!-- change this to a cart icon -->
			<a href="/cart">  |  <i class="fas fa-shopping-cart"></i></a>
		</div>
		<div class="headerlogo">
			<div class="logo">
				<a href="/"><img id ="logo1" src="/images/vape3onelogo1.png" alt="logo"></a>
			</div>
		</div>
		<div id="navigation"  class="container">
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<div class="d-md-flex d-block flex-row mx-lg-auto mx-0">
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				  </button>
				  <div class="collapse navbar-collapse" id="navbarNavDropdown">
				    <ul class="navbar-nav">
				      <li class="nav-item active">
				        <a class="nav-link coollink" href="/">Home</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/sales">Sale</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/devices">Devices</a>
				      </li>
				      <li class="nav-item">
				        <a class="nav-link coollink" href="/eliquids">E-Liquids <span class="sr-only">(current)</span></a>
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
	<div class="wrapper" id="wrapper1">
		<div class="container">
			<div class="maincontent1">
				<div class="row">
					<div id="leftnavbar" class="col-md-3">
						<div id="lefrnavbarmargin">
							<div id="catergoryheader">
								<!-- goign to change this once i have datas and when it's in spring boot -->
								<h1>E-Liquid</h1>
							</div>
							<div id="catergorylist">
								<ul id="categoryul">
									<li><a href="/eliquids">Shop by Brands</a></li>
									<li>Shop by Flavors</li>
									<li>New Arrivals</li>
									<li>Shop by Size</li>
								</ul>
							</div>
						</div>
					</div>
	
					<div id="itemscontentdiv" class="col-md-9">
						<div id="itemcontainermargin">
							<div id="sortingdiv">
								<div id="sortdiv">
									<!-- GOING TO ADD MORE SORT AND GONNA ADD QUERY -->
									<form>
										<label>Sort By:</label>
										<select>
											<option>New Arrivals</option>
											<option>Title</option>
											<option>Price: Low to High</option>
											<option>Price: High to Low</option>
										</select>
										<button class="btn btn-dark btn-sm">Go</button>
									</form>
								</div>
								<div id="pageselectiondiv">
									<p>60 90 120 All</p>
								</div>
							</div>
	
							<div id="itemscontainer">
								<div class="row">
								<c:forEach items="${alleliquids}" var="eliquid">
									<div class="itembox col-lg-3 col-md-6 col-sm-6">
										<div class="itemboxpadding">
											<div class="itemimage">
											<!-- shows the admin if the item is less than 3 -->
												<c:if test="${amiadmin == 'yes' && eliquid.quantity < 4 }">
													<div class="lowitemred">LOW QTY ITEM</div>
												</c:if>
												<a href="/items/${eliquid.id}"><img src="${eliquid.image}" alt=""></a>
												<div class="overlay">
													<div class="itemimagecontent">
														<a class="btn btn-dark btn-sm" href="/items/${eliquid.id}">View Item</a>
														<!-- shows the edit and delete for admin user -->
														<c:if test="${amiadmin == 'yes'}">
															<form action="/items/${eliquid.id}/deletethisitem" method="post">
																<input type="hidden" name="_method" value="delete">
					    										<input type="submit" value="Delete Item" class="btn btn-danger btn-sm">
															</form>
															<%-- <a class="btn btn-danger btn-sm" href="/items/${sale.id}/deletethisitem">Delete Item</a> --%>
															<a class="btn btn-primary btn-sm" href="/items/${eliquid.id}/editthisitem/">Edit Item</a>
														</c:if>
													</div>
												</div>
											</div>
											<p class="itemname">${eliquid.name}</p>
											<p class="itemflavor">${eliquid.flavor}</p>
											<p class="itemprice">$${eliquid.price}</p>
										</div>
									</div> 
								</c:forEach>
	
								</div>  <!-- end of row -->
	
	
							</div>   <!-- end of itemscontainer -->
	
	
						</div>
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