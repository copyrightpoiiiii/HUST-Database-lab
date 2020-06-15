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
    <script src="../js/Table.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%
    String startDate = request.getParameter("dateStart");
    String endDate = request.getParameter("dateEnd");
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
                        <li>
                        <li class="active">
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" onclick="carMan(<%=name%>)" >
                                管理车辆
                            </button>
                        </li>
                        </li>
                    </ul>
                </div>

            </nav>
            <h1 >
                <%=startDate%>~<%=endDate%>
            </h1>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-bordered">
                        <tbody>
                        <tr>
                            <td>
                                可用车辆
                            </td>
                            <td>
                                1
                            </td>
                            <td>
                                保养车辆
                            </td>
                            <td>
                               2
                            </td>
                        </tr>
                        <tr >
                            <td>
                                vip1数量
                            </td>
                            <td>
                                TB - Monthly
                            </td>
                            <td>
                                vip2数量
                            </td>
                            <td>
                                Approved
                            </td>
                        </tr>
                        <tr >
                            <td>
                                vip3数量
                            </td>
                            <td>
                                TB - Monthly
                            </td>
                            <td>
                                车辆保养费
                            </td>
                            <td>
                                Declined
                            </td>
                        </tr>
                        <tr >
                            <td>
                                罚款
                            </td>
                            <td>
                                TB - Monthly
                            </td>
                            <td>
                                客户余额
                            </td>
                            <td>
                                Pending
                            </td>
                        </tr>
                        <tr >
                            <td>
                                总收入
                            </td>
                            <td>
                                TB - Monthly
                            </td>
                            <td>
                                净收入
                            </td>
                            <td>
                                Call in to confirm
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
</div>


</body>
</html>