<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">CHOOSE YOUR TEAM</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="#about">About</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
                <c:if test="${LoggedIn}">
	                <li class="dropdown">
	                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Administration <b class="caret"></b></a>
	                	<ul class="dropdown-menu">
	                        <li><a href="/admin/group">Group Management</a></li>
	                        <li><a href="/admin/team">Team Management</a></li>
	                	</ul>
	                </li>
                	<c:forEach items="${groups}" var="group">
                		<li class="dropdown">
		                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">${group.name} <b class="caret"></b></a>
		                	<ul class="dropdown-menu">
		                        <li><a href="/group/${group.id}">Group Management</a></li>
		                	</ul>
		                </li>
                	</c:forEach>
                </c:if>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
				    <c:when test="${LoggedIn}">
				      <li><a href="${logoutURL}">Log out</a></li>
				    </c:when>
				    <c:otherwise>
				      <li><a href="${loginURL}">Log in</a></li>
				    </c:otherwise>
			    </c:choose>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>