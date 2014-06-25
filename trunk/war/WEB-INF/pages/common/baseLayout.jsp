<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><tiles:getAsString name="title" /></title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/css/bootstrap.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Flags CSS -->
    <link href="/resources/css/flags/css/flag-icon.css" rel="stylesheet">
    <link href="/resources/css/flags/assets/docs.css" rel="stylesheet">
	<!-- JQuery UI CSS -->
	<link href="/resources/css/ui-lightness/jquery-ui-1.10.4.css" rel="stylesheet">    
	<!-- Bootstrap Form Helpers CSS -->
	<link href="/resources/css/bootstrap-formhelpers.css" rel="stylesheet">    
	<!-- JQuery DataTables CSS -->
	<link href="/resources/css/jquery.dataTables.css" rel="stylesheet">    

    <!-- Add custom CSS here -->
    <link href="/resources/css/half-slider.css" rel="stylesheet">
    
    <!-- JavaScript -->
    <script src="/resources/js/jquery-1.10.2.js"></script>
    <script src="/resources/js/jquery-ui-1.10.4.js"></script>
    <script src="/resources/js/jquery.dataTables.js"></script>
    <script src="/resources/js/bootstrap.js"></script>
    <script src="/resources/js/bootstrap-formhelpers.js"></script>

</head>

<body>
    <tiles:insertAttribute name="header"/>
    <div id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
                <div class="carousel-caption">
                    <h1>A Full-Width Image Slider Template</h1>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
                <div class="carousel-caption">
                    <h1>Caption 2</h1>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
                <div class="carousel-caption">
                    <h1>Caption 3</h1>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </div>
    
    <div class="container">

        <div class="row section">
            <tiles:insertAttribute name="body"/>
        </div>

        <hr>

        <footer>
            <tiles:insertAttribute name="footer"/>
        </footer>

    </div>
    <!-- /.container -->

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 3000 //changes the speed
    })
    </script>
</body>

</html>
