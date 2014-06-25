<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Match</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-lg-6">
                        <form:form action="/group/match/process" method="POST" commandName="match">
                            <form:hidden path="groupId" />
                            <form:hidden path="id" />
                            <fieldset>
                                <div class="form-group">
                                    <form:label path="home">Home Team<span class="required-indicator">*</span></form:label>
                                    <form:select path="home" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label path="guess">Guess Team<span class="required-indicator">*</span></label>
                                    <form:select name="guess" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <form:label path="hScore">Home Team Score<span class="required-indicator">*</span></form:label>
                                    <form:input name="hScore" type="number" value="${betMatchInstance?.hScore}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <form:label path="gScore">Guess Team Score<span class="required-indicator">*</span></form:label>
                                    <g:field name="gScore" type="number" value="${betMatchInstance?.gScore}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <form:label path="date">Date<span class="required-indicator">*</span></form:label>
                                    <g:datePicker name="date" precision="hour"  value="${betMatchInstance?.date}"  />
                                </div>
                                <div class="form-group">
                                    <form:label path="hRate">Home Team Rate<span class="required-indicator">*</span></form:label>
                                    <g:field name="hRate" type="text" value="${betMatchInstance?.hRate}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <form:label path="gRate">Guess Team Rate<span class="required-indicator">*</span></form:label>
                                    <g:field name="gRate" type="text" value="${betMatchInstance?.gRate}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <form:label path="amount">Bet Amount<span class="required-indicator">*</span></form:label>
                                    <g:field name="amount" type="number" value="${betMatchInstance?.amount}" class="form-control" required=""/>
                                </div>
                                <div class="form-group">
                                    <g:submitButton name="create" class="btn btn-primary" value="Save" />
                                    <g:link class="btn btn-default" action="index">Cancel</g:link>
                                </div>
                            </fieldset>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>