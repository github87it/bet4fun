<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Groups Management</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Group Information
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <tbody>
                                    <tr><td>${group.name}</td></tr>
                                    <tr><td>${group.description}</td></tr>
                                    <tr><td>${group.owner}</td></tr>
                                    <tr><td><fmt:formatDate pattern="MM/dd/yyyy" value="${group.expiredDate}"/></td></tr>
                                    <tr><td>${group.timezone}</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="/group/members/add/${group.id}">
                            <button type="button" class="btn btn-primary"><i class="fa fa-plus-circle fa-fw"></i> Member</button>
                        </a>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-user">
                                <thead>
                                    <tr><th>Members</th></tr>
                                    <tr><th></th></tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${members}" var="u">
                                        <tr>
                                            <td>${u.username}</td>
                                            <td>
                                                <a href="/group/delete/${group.id}/${u.id}">
                                                    <i class="fa fa-trash-o fa-fw"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a href="/group/matches/add/${group.id}">
                        <button type="button" class="btn btn-primary"><i class="fa fa-plus-circle fa-fw"></i> Match</button>
                    </a>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-match">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Match</th>
                                    <th>Rate</th>
                                    <th>Result</th>
                                    <th>Amount</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${matches}" var="match">
                                <tr class="odd">
                                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${match.date}"/></td>
                                    <td>
                                        <span>
                                            ${match.home.name}&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.home.isoCode2}"></span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;vs&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span class="flag-icon flag-icon-${match.guess.isoCode2}"></span>&nbsp;&nbsp;
                                            ${match.guess.name}
                                        </span>
                                    </td>
                                    <td>${match.hRate}:${match.gRate}</td>
                                    <td>${match.hScore}:${match.gScore}</td>
                                    <td>${match.amount}</td>
                                    <td>
                                        <a href="/group/matches/update/${group.id}/${match.id}">
                                            <i class="fa fa-edit fa-fw"></i>
                                        </a>
                                        <a href="/group/matches/delete/${group.id}/${match.id}">
                                            <i class="fa fa-trash-o fa-fw"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
<script>
    $(document).ready(function() {
        $('#dataTables-match').dataTable();
        $('#dataTables-user').dataTable();
    });
</script>