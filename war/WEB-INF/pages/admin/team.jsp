<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Teams Management</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/admin/team/add">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-plus-circle fa-fw"></i> Team
                    </button>
                </a>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>ISO Alpha 2</th>
                            <th>ISO Alpha 3</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${teams}" var="team">
                            <tr>
                                <td>${team.name}</td>
                                <td>${team.isoCode2}</td>
                                <td>${team.isoCode3}</td>
                                <td><a href="/admin/team/update/${team.id}"><i class="fa fa-edit fa-fw"></i></a></td>
                                <td><a href="/admin/team/delete/${team.id}"><i class="fa fa-trash-o fa-fw"></i></a></td>
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
        $('#dataTables-example').dataTable({"bLengthChange": false, "bPaginate": true});
    });
</script>