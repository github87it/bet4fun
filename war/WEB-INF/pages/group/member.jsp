<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Member</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Member Information
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form:form action="/group/member/process" method="POST" commandName="member" >
                            <form:hidden path="groupId" />
                            <fieldset>
                                <div class="form-group">
                                    <form:label path="email">Email: <span class="required-indicator">*</span></form:label>
                                    <form:input path="name" required="" class="form-control" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <form:button name="add" class="btn btn-primary" value="Add" />
                                    <a href="/group/${member.groupId}" class="btn btn-default">Cancel</a>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>