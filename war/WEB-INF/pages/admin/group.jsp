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
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/admin/group/add">
                    <button type="button" class="btn btn-primary">
                        <i class="fa fa-plus-circle fa-fw"></i> Group
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
                            <th>Description</th>
                            <th>Owner</th>
                            <th>Expire Date</th>
                            <th>Time Zone</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${groups}" var="group">
                            <tr>
                                <td>${group.name}</td>
                                <td>${group.description}</td>
                                <td>${group.owner}</td>
                                <td><fmt:formatDate value="${group.expiredDate}" pattern="MM/dd/yyyy" /></td>
                                <td>${group.displayTimeZone}</td>
                                <td><a href="/admin/group/update/${group.id}"><i class="fa fa-edit fa-fw"></i></a></td>
                                <td><a href="/admin/group/delete/${group.id}"><i class="fa fa-trash-o fa-fw"></i></a></td>
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
        $('#dataTables-example').dataTable({"bLengthChange": false, "bPaginate": false});
    });
</script>