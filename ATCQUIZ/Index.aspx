<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US" class="no-js">

<head>
    <!-- ==============================================
		Title and Meta Tags
		=============================================== -->
    <meta charset="utf-8" />
    <title>ATCQuiz
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- ==============================================
		Favicons
		=============================================== -->
    <link rel="shortcut icon" href="assets/favicon.ico" />
    <link rel="apple-touch-icon" href="assets/apple-touch-icon.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="assets/apple-touch-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="assets/apple-touch-icon-114x114.png" />

    <!-- ==============================================
		CSS
		=============================================== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link id="main" rel="stylesheet" href="css/designr-theme-cyan2.css" />
    <link id="theme" rel="stylesheet" href="css/designr-theme-cyan2.css" />


    <!-- ==============================================
		Fonts
		=============================================== -->
    <link href="http://fonts.googleapis.com/css?family=Lato:400,300,300italic,400italic,700,700italic,900" rel="stylesheet" type="text/css" />

    <!-- ==============================================
		JS
		=============================================== -->

    <!--[if lt IE 9]>
			<script src="js/respond.min.js"></script>
		<![endif]-->

    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body data-spy="scroll" data-target="#main-nav" data-offset="200">


    <!--=== PAGE PRELOADER <div id="page-loader"><span class="page-loader-gif"></span></div>===-->

    <!-- ==============================================
		MAIN NAV
		=============================================== -->
    <div id="main-nav" class="navbar navbar-fixed-top">
        <div class="container">

            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#site-nav">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>

                <!-- ======= LOGO ========-->
                <a class="navbar-brand scrollto" href="#home"><i class="fa fa-plane"></i><span id="invisible">--</span>ATCQuiz </a><span class="label label-danger" style="float: right;">alpha</span><br />
                <!-- <span>for real professionals</span></a> -->

            </div>

            <div id="site-nav" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="sr-only">
                        <a href="#home" class="scrollto">ToDo</a>
                    </li>
                    <li>
                        <a href="#services" class="scrollto">Process</a>
                    </li>
                    <li>
                        <a href="#about" class="scrollto">About</a>
                    </li>
                    <li>
                        <a href="#contact" class="scrollto">Contact</a>
                    </li>
                    <li>
                        <a href="Login.aspx" class="btn btn-theme transparent">Log In</a>
                    </li>
                </ul>
            </div>
            <!--End navbar-collapse -->

        </div>
        <!--End container -->

    </div>
    <!--End main-nav -->

    <!-- ==============================================
		HEADER
		=============================================== -->
    <header id="home" class="jumbotron">

        <div class="container">

            <div class="message-box clearfix">

                <div class="left-col">
                    <p>
                        read your <span>world</span><br />
                        and plan it wisely
                    </p>
                </div>

                <div class="right-col flexslider home-slider" style="z-index: 1;">

                    <ul class="slides">

                        <li>
                            <p>Ideas</p>
                        </li>

                        <li>
                            <p>Plans</p>
                        </li>

                        <li>
                            <p>Dreams</p>
                        </li>

                    </ul>

                </div>
                <!--End home-slider -->

            </div>
            <!--End message-box -->

        </div>
        <!--End container -->

    </header>
    <!--End header -->

    <!-- ==============================================
		SERVICES
		=============================================== -->
    <section id="services">

        <div class="container">

            <h1 class="section-title scrollimation scale-in"><span>Process</span> to reach your dream<i class="fa fa-cogs" id="wrench"></i></h1>

            <div class="row services scrollimation fade-left">
                <div class="col-md-3 text-center">
                    <a href="#service" class="icon"><i class="fa fa-plane"></i></a>
                    <h2>Imagine</h2>
                </div>
                <div class="col-md-3 details">
                    <p style="font-weight: normal;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent in condimentum nunc, cursus elementum orci.Nam consectetur erat vehicula justo interdum maximus id ac lacus. Curabitur vel felis bibendum, aliquam mauris. </p>
                </div>
                <div class="col-md-3 text-center">
                    <a href="#service" class="icon"><i class="fa fa-check"></i></a>
                    <h2>Validate</h2>
                </div>
                <div class="col-md-3 details">
                    <p>Cras consequat mauris nunc, at vestibulum nisi dictum vel. Quisque egestas arcu eu euismod maximus. Morbi a justo accumsan, maximus dolor vitae, convallis nisi. Fusce quis risus ac lorem consequat sagittis id vitae orci.</p>
                </div>
            </div>
            <!--End row (top) -->

            <div class="row line visible-md visible-lg">
                <div class="col-md-3"><span class="spot"></span></div>
                <div class="col-md-3"><span class="spot"></span></div>
                <div class="col-md-3"><span class="spot"></span></div>
                <div class="col-md-3"><span class="spot"></span></div>
            </div>
            <!--End row -->

            <div class="row services bottom-row scrollimation fade-right">
                <div class="col-md-3 text-center col-md-push-3">
                    <h2>Develop</h2>
                    <a href="#service" class="icon"><i class="fa fa-pencil"></i></a>
                </div>
                <div class="col-md-3 details col-md-pull-3">
                    <p>Sed cursus risus augue, sit amet blandit magna congue ut. Pellentesque lobortis vehicula felis, in vehicula neque ultricies nec. Nullam laoreet diam ut bibendum volutpat. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                </div>
                <div class="col-md-3 text-center  col-md-push-3">
                    <h2>Launch</h2>
                    <a href="#service" class="icon"><i class="fa fa-rocket"></i></a>
                </div>
                <div class="col-md-3 details  col-md-pull-3">
                    <p>Ridiculus mus. Suspendisse potenti. Quisque venenatis ligula eu massa placerat, eu vehicula lectus sodales. Vivamus non ipsum sit amet sapien semper blandit sit amet ac neque. Donec velit est, malesuada eu accumsan eu.</p>
                </div>
            </div>
            <!--End row (bottom)-->

        </div>
        <!--End container -->

    </section>
    <!--End services section-->

    <!-- ==============================================
		ABOUT
		=============================================== -->
    <section id="about">

        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-sm-offset-1 scrollimation fade-right">
                </div>
                <div class="col-sm-6 col-sm-offset-1 scrollimation fade-left">
                    <h1>About</h1>
                    <p>Ridiculus mus. Suspendisse potenti. Quisque venenatis ligula eu massa placerat, eu vehicula lectus sodales. Vivamus non ipsum sit amet sapien semper blandit sit amet ac neque. Donec velit est, malesuada eu accumsan eu.</p>
                    <a href="Login.html" class="btn btn-theme register">Register</a>
                </div>
            </div>
            <!--End row -->

        </div>
        <!--End container -->

    </section>
    <!--End about section -->

    <!-- ==============================================
		SKILLS
		=============================================== -->
    <section id="skills">

        <div class="container">

            <div class="row skills">

                <div class="col-sm-6 col-md-3 text-center">
                    <span class="chart" data-percent="60"><span class="percent">60</span></span>
                    <h2 class="text-center">Personal projects</h2>
                </div>
                <div class="col-sm-6 col-md-3 text-center">
                    <span class="chart" data-percent="80"><span class="percent">80</span></span>
                    <h2 class="text-center">Volunteering ideas</h2>
                </div>
                <div class="col-sm-6 col-md-3 text-center">
                    <span class="chart" data-percent="70"><span class="percent">70</span></span>
                    <h2 class="text-center">Charity projects</h2>
                </div>
                <div class="col-sm-6 col-md-3 text-center">
                    <span class="chart" data-percent="30"><span class="percent">30</span></span>
                    <h2 class="text-center">Start-up companies</h2>
                </div>

            </div>
            <!--End row -->

        </div>
        <!--End container -->

    </section>
    <!--End skills section -->
 
    <!-- ==============================================
		CONTACT
		=============================================== -->
    <section id="contact">

        <div class="container">

            <h1 class="section-title scrollimation scale-in">Get in <span>contact</span> with us</h1>

            <div class="row">

                <div class="col-sm-5 contact-info scrollimation fade-right">

                    <p>Our team at BrightIdeas stays at your disposal and can provide live feedback for your projects, so do not hesitate to contacts us via email.</p>
                    <ul class="socials">
                        <li><a href="#twitter-link"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#facebook-link"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#dribbble-link"><i class="fa fa-dribbble"></i></a></li>
                        <li><a href="#gplus-link"><i class="fa fa-google-plus"></i></a></li>
                    </ul>

                </div>

                <form id="contact-form" class="col-sm-7 scrollimation fade-left" action="#" method="post" novalidate>

                    <div class="form-group">
                        <label class="control-label" for="contact-name">Nume</label>
                        <div class="controls">
                            <i class="fa fa-user"></i>
                            <input id="contact-name" name="contactName" placeholder="My name is..." class="form-control input-lg requiredField" type="text" data-error-empty="My email is">
                        </div>
                    </div>
                    <!-- End name input -->

                    <div class="form-group">
                        <label class="control-label" for="contact-mail">Email</label>
                        <div class=" controls">
                            <i class="fa fa-envelope"></i>
                            <input id="contact-mail" name="email" placeholder="My email is..." class="form-control input-lg requiredField" type="email" data-error-empty="My email is..." data-error-invalid="Invalid email address">
                        </div>
                    </div>
                    <!-- End email input -->

                    <div class="form-group">
                        <label class="control-label" for="contact-message">Mesaj</label>
                        <div class="controls">
                            <i class="fa fa-comment"></i>
                            <textarea id="contact-message" name="comments" placeholder="I would like to tell you about..." class="form-control input-lg requiredField" rows="5" data-error-empty="I would like to tell you about..."></textarea>
                        </div>
                    </div>
                    <!-- End textarea -->

                    <p>
                        <button name="submit" type="submit" class="btn btn-theme btn-lg" data-error-message="Error!" data-sending-message="Sending..." data-ok-message="Message sent"><i class="fa fa-paper-plane"></i>Send</button>
                    </p>
                    <input type="hidden" name="submitted" id="submitted" value="true" />

                </form>
                <!-- End contact-form -->

            </div>
            <!-- End row -->

        </div>
        <!-- End container -->

    </section>
    <!-- End contact section -->

    <!-- ==============================================
		FOOTER
		=============================================== -->
    <footer id="main-footer">

        <div class="container">

            <div class="row">

                <div class="col-sm-6 left-col">
                    <h1 class="small-logo">BrightIdeas<br>
                        <span>enable the creativity, we simplify the rest</span></h1>
                    <ul class="footer-nav">
                        <li><a class="scrollto" href="#home">Home</a></li>
                        <li><a class="scrollto" href="#services">Process</a></li>
                        <li><a class="scrollto" href="#about">About</a></li>
                        <li><a class="scrollto" href="#contact">Contact</a></li>
                    </ul>
                    <p>
                        &copy;Copyright 2015 BrightIdeas / All rights reserved
                        <br />
                        
                    </p>
                </div>

                <div class="col-sm-6 right-col">
                    <h2>Still don't know what to do?</h2>
                    <p class="bott text">Sed cursus risus augue, sit amet blandit magna congue ut. Pellentesque lobortis vehicula felis, in vehicula neque ultricies nec. Nullam laoreet diam ut bibendum volutpat. Cum sociis natoque penatibus et magnis dis parturient montes.</p>
                </div>

            </div>
            <!-- End row -->

        </div>
        <!-- End container -->

    </footer>
    <!-- End footer -->

    <!-- ==============================================
		SCRIPTS
		=============================================== -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/libs/jquery-1.9.1.min.js">\x3C/script>')</script>

    <script src="js/libs/bootstrap.min.js"></script>
    <script src='js/jquery.scrollto.js'></script>
    <script src='js/jquery.flexslider.min.js'></script>
    <script src='js/twitterFetcher_v10_min.js'></script>
    <script src='js/jquery.masonry.min.js'></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.easypiechart.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/designr.js"></script>
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>


</body>


</html>
