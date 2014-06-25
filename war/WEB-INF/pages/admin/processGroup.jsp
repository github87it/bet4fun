<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Group Information</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form:form action="/admin/group/process" method="POST" commandName="group" modelAttribute="group">
                        	<form:hidden path="id"/>
                            <fieldset>
                                <div class="form-group">
                                    <form:label path="name">Name<span class="required-indicator">*</span></form:label>
                                    <form:input path="name" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="description">Description<span class="required-indicator">*</span></form:label>
                                    <form:input path="description" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="owner">Owner Email<span class="required-indicator">*</span></form:label>
                                    <form:input path="owner" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="expiredDate">Expired Date<span class="required-indicator">*</span></form:label>
                                    <form:input path="expiredDate" required="" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="timezone">Time Zone<span class="required-indicator">*</span></form:label>
                                    <select id="countries_timezones1" class="form-control bfh-countries" data-country="VN"></select>
									<br><br>
									<form:select path="timezone" class="form-control bfh-timezones" data-country="countries_timezones1"></form:select>
                                </div>
                                <div class="form-group">
                                    <form:button class="btn btn-primary">Submit</form:button>
                                    <a href="/admin/group" class="btn btn-default">Cancel</a>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$(function() {
	$( "#expiredDate" ).datepicker();
});
</script>	