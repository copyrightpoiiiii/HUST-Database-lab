<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TGT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-table.css" type = "text/css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="../js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/adminCar.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%
    String name = request.getParameter("username");
%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">TGT</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" data-target="#log" >
                                老朋友？
                            </button>
                        </li>
                        <li>
                        <li class="active">
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" data-target="#reg" >
                                新朋友！
                            </button>
                        </li>
                        </li>
                        <li>
                        <li class="active">
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" onclick="tableMake(<%=name%>)" >
                                查看报表
                            </button>
                        </li>
                        </li>
                        <li>
                        <li class="active">
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" onclick="appMan(<%=name%>)" >
                                管理申请
                            </button>
                        </li>
                        </li>
                    </ul>
                </div>

            </nav>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span> 条件查找
                </div>
                <div class="panel-body">
            <div class="row">
                <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-4 control-label" for="select">车辆编号</div>
                            <div class="col-md-4">
                                <input type="text" class="form-control" runat="server" id="Balance_end"
                                       name="Balance_end" />
                            </div>
                        <div class="col-md-4 control-label" for="select">保养/维修金额</div>
                        <div class="col-md-4 control-label">
                            <input type="text" class="form-control" runat="server" id="Balance_start"
                                   name="Balance_start" />
                        </div>
                        <div class="col-md-4">
                            <input type="button" ID="btnSearch" value=" 上传 "
                                   class="btn btn-success col-md-12 " onclick="update()"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                </div>
            </div>
            <table id = "table" class = "table table-bordered tab-content" ></table>

        </div>
    </div>
</div>


</body>
</html>