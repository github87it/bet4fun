<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Team Information</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form:form action="/admin/team/process" method="POST" commandName="teamForm" modelAttribute="teamForm">
                        	<form:hidden path="id"/>
                            <fieldset>
                                <div class="form-group">
                                    <form:label path="name">Name </form:label>
                                    <form:input path="name" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <form:label path="isoCode2">Country <span class="required-indicator">*</span></form:label>
                                    <form:select path="isoCode2" class="form-control bfh-countries" data-country="${teamForm.isoCode2}" data-flags="true"></form:select>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="Submit" class="btn btn-primary">Submit</button>
                                    <a href="/admin/team" class="btn btn-default">Cancel</a>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>