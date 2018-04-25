<%-- 
    Document   : guest_footer
    Created on : Apr 25, 2018, 11:26:37 AM
    Author     : user
--%>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html><!--<![endif]-->
<head>
<title>Calisto</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/foundation.min.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" href="js/slider/flexslider.css">
<link rel="stylesheet" href="js/slider/flexcar.css">
<link href='http://fonts.googleapis.com/css?family=Quando' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,300' rel='stylesheet' type='text/css'>
<script src="js/vendor/custom.modernizr.js"></script>
<script>
Modernizr.load({
    // test if browser understands media queries
    test: Modernizr.mq('only all'),
    // if not load ie8-grid
    nope: 'css/ie8-grid-foundation-4.css'
});
</script>
<!--[if lt IE 9]>
<link rel="stylesheet" href="css/ie-fixes.css">
<![endif]-->
</head>
<body>
<!--<div class="header">
  <div class="row">
    <div class="columns large-12">
      <div class="row header-inner">
        <div class="columns large-4 small-12"> <a href="index.html"><img src="images/logo.png" alt="" class="logo"></a> </div>
        <div class="columns large-8">
          <nav>
            <section>
              <ul class="sf-menu large-12">
                <li class="active"><a href="index.html">Home</a></li>
                <li><a href="about.html">About us</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li class="has-dropdown"><a href="services.html">Services</a>
                  <ul class="dropdown">
                    <li class="has-dropdown"><a href="#">Dropdown Level 1a</a>
                      <ul class="dropdown">
                        <li><a href="#">Dropdown Level 2a</a></li>
                        <li><a href="#">Dropdown Level 2b</a></li>
                      </ul>
                    </li>
                    <li><a href="#">Dropdown Level 1b</a></li>
                    <li><a href="#">Dropdown Level 1c</a></li>
                    <li><a href="#">Dropdown Level 1d</a></li>
                    <li><a href="#">See all &rarr;</a></li>
                  </ul>
                </li>
                <li><a href="contact.html">Contact Us</a></li>
              </ul>
            </section>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="columns large-12 small-top-menu">
      <div class="row">
        <div class="columns large-12 plr0 top-nav">
          <form name="dropdown" class="dropdown" action="#">
            <nav>
              <section>
                <select name="selected" id="target" accesskey="E" onChange="goToNewPage(document.dropdown.selected)">
                  <option value="index.html">home</option>
                  <option value="about.html">about us</option>
                  <option value="blog.html">blog</option>
                  <option value="gallery.html">gallery</option>
                  <option value="services.html">services</option>
                  <option value="contact.html">contact us</option>
                </select>
              </section>
            </nav>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="slider">
    <div class="row">
      <div class="columns large-12">
        <div class="row flexslider-row">
          <div class="columns large-12">
            <div class="flexslider">
              <ul class="slides">
                <li> <img src="images/slide1.jpg" alt=""> </li>
                <li> <img src="images/slide2.jpg" alt=""> </li>
                <li> <img src="images/slide1.jpg" alt=""> </li>
                <li> <img src="images/slide2.jpg" alt=""> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="tagline">
  <div class="row">
    <div class="columns large-12">
      <div class="center">
        <h1>WELCOME TO OUR WEBSITE</h1>
        <p> Diam in turpis ut mauris, hac vel pulvinar, lacus lundium lectus, placerat? A aenean! Lectus sed phasellus montes? Velit aenean elit, ut aenean tempor! Ac turpis ac integer augue, rhoncus pid augue dignissim. Lectus rhoncus urna lectus in est integer amet? </p>
      </div>
    </div>
  </div>
</div>
<div class="service-box">
  <div class="row service">
    <div class="columns large-4">
      <h1 class="service-subtitle">Scelerisque aliquet adipiscing</h1>
      <p><img src="images/3up1.jpg" alt="" class="threeUp"></p>
      <p> scelerisque pellentesque duis nascetur crasamet sitter sit eros egestas eu? Aliquet pid porta elit acniitem esm Risus arcu augue lorem ipsum sit dolor esmet duiscra sit eros egestas eu? Aliquet pid porta elit acnisitem sit Risus arcu augue lorem ipsum sit dolor esmet </p>
      <p> <a class="button custom">details</a> </p>
    </div>
    <div class="columns large-4">
      <h1 class="service-subtitle">Scelerisque aliquet adipiscing</h1>
      <p><img src="images/3up2.jpg" alt="" class="threeUp"></p>
      <p> scelerisque pellentesque duis nascetur crasamet sitter sit eros egestas eu? Aliquet pid porta elit acniitem esm Risus arcu augue lorem ipsum sit dolor esmet duiscra sit eros egestas eu? Aliquet pid porta elit acnisitem sit Risus arcu augue lorem ipsum sit dolor esmet </p>
      <p> <a class="button custom">details</a> </p>
    </div>
    <div class="columns large-4">
      <h1 class="service-subtitle">Scelerisque aliquet adipiscing</h1>
      <p><img src="images/3up1.jpg" alt="" class="threeUp"></p>
      <p> scelerisque pellentesque duis nascetur crasamet sitter sit eros egestas eu? Aliquet pid porta elit acniitem esm Risus arcu augue lorem ipsum sit dolor esmet duiscra sit eros egestas eu? Aliquet pid porta elit acnisitem sit Risus arcu augue lorem ipsum sit dolor esmet </p>
      <p> <a class="button custom">details</a> </p>
    </div>
  </div>
</div>
<div class="front-testimonial">
  <div class="row">
    <div class="columns large-12">
      <div class="flexcar">
        <ul class="slides">
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/test.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Elementum phasellus, diam tempor ultrices a mauris </h1>
                <p> Elementum phasellus, diam tempor ultrices a mauris, placerat odio nunc turpis? Aenean facilisis nisi turpis parturient sed pid massa et in est, et magna turpis ac a dapibus urna </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Rebecca Jones,</span><span class="profession"> Seo Consultant</span>, <span class="company">XYZ Pvt Ltd</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/test1.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Elementum phasellus, diam tempor ultrices a mauris </h1>
                <p> Elementum phasellus, diam tempor ultrices a mauris, placerat odio nunc turpis? Aenean facilisis nisi turpis parturient sed pid massa et in est, et magna turpis ac a dapibus urna </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Ricky David,</span><span class="profession"> Seo Consultant</span>, <span class="company">XYZ Pvt Ltd</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/test1.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Elementum phasellus, diam tempor ultrices a mauris </h1>
                <p> Elementum phasellus, diam tempor ultrices a mauris, placerat odio nunc turpis? Aenean facilisis nisi turpis parturient sed pid massa et in est, et magna turpis ac a dapibus urna </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Rani Malik,</span><span class="profession"> Seo Consultant</span>, <span class="company">XYZ Pvt Ltd</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
        <div class="test-nav"> <span class="leftarrow"><img src="images/leftarrow.png" alt=""></span><span class="rightarrow"><img src="images/rightarrow.png" alt=""></span> </div>
      </div>
    </div>
  </div>
</div>
<footer class="footer">
  <div class="row">
    <div class="columns large-12 footer-inner">
      <div class="row">
        <div class="columns large-4 useful-links">
          <div>
            <h2 class="footer-title">Quick links</h2>
            <ul class="footer-list">
              <li><a href="#">Home</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Products</a></li>
              <li><a href="#">Gallery</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </div>
        </div>
        <div class="columns large-4 contact">
          <div>
            <h2 class="footer-title">Contactus</h2>
            <ul class="footer-list">
              <li><span class="small-icon"><img src="images/address.png" alt=""></span>255, Willson Street,Caulfield, Melbourne</li>
              <li><span class="small-icon"><img src="images/phone.png" alt=""></span>Tel:(122)3456789, (121)3456079, (121)2341234</li>
              <li><span class="small-icon"><img src="images/fax.png" alt=""></span>(121)5647289, (122)34526589</li>
              <li><span class="small-icon"><img src="images/email.png" alt=""></span>email@domain.com</li>
              <li><span class="social-media"><a href="#">t</a></span><span class="social-media"><a href="#">f</a></span><span class="social-media"><a href="#">y</a></span><span class="social-media"><a href="#">g</a></span></li>
            </ul>
          </div>
        </div>
        <div class="columns large-4 about">
          <div>
            <h2 class="footer-title">Aboutus</h2>
            <p><img src="images/about.png" alt=""></p>
            <p>Placerat urna et tristique in! Scelerisque integer nisi pha sellus, nec phasellus arcualiquet etiam magna massa sit cursus adipiscing sed, nec? Aenean odio! Cumac dolor dapibus tincidunt lorem ipsum dolor sit esmet placerat urna et tristique in! Scelerisque integer nisi phasellus</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>-->
<div class="credit-row">
  <div class="row">
    <div class="columns large-11 credit"> &copy; 2045 All rights reserved by <a href="#">Calisto.</a> Design by: <a href="http://topwebsitetemplates.org">topwebsitetemplates.org</a></div>
    <div class="columns large-1"> <img src="images/toparrow.png" alt="" class="scrollToTop"> </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.js"></script>
<script src="js/slider/jquery.flexslider.js"></script>
<script>
Modernizr.load({
    test: Modernizr.placeholder,
    nope: 'js/placeholder.min.js'
});
function goToNewPage() {
    if (document.getElementById('target').value) {
        window.location.href = document.getElementById('target').value;
    }
}
</script>
<script>
$(document).ready(function () {
    $('ul.sf-menu').superfish({
        animation: {
            height: 'show'
        },
        delay: 400
    });
    $("img.scrollToTop").click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
    });
    $('.flexslider').flexslider();
    $('.flexcar').flexslider();
});
</script>
</body>
</html>