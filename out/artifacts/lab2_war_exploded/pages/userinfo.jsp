<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="org.Dao.Query" %>
<%@ page import="org.Dao.Writer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TGT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="../js/userinfo.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String username = request.getParameter("username");
    Query queryInfo = new Query();
    ArrayList<Integer> info = queryInfo.queryInfo(username);
    ArrayList<String> apply = queryInfo.queryUserApply(username);
%>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

            <nav class="navbar navbar-default navbar-static-top" role="navigation">
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
                            <button type="button" class="btn btn-link btn-lg" data-toggle="modal" onclick="turn(<%=username%>)" >
                                租车
                            </button>
                        </li>
                        </li>
                    </ul>
                </div>

            </nav>

            <div class="tabbable" id="tabs-189608">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#panel-244526" data-toggle="tab">个人信息</a>
                    </li>
                    <li>
                        <a href="#panel-613897" data-toggle="tab">余额管理</a>
                    </li>
                    <li>
                        <a href="#panel-613898" data-toggle="tab">租借管理</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="panel-244526">
                        <p>
                            <br>
                            会员状态 :<%=info.get(2)%>
                            <br>
                            <br>
                            信用状态 :<%=info.get(0)%>
                            <br>
                        </p>
                    </div>
                    <div class="tab-pane" id="panel-613897">
                             <br>
                            余额 :<%=info.get(1)%>
                             <br>
                             <br>
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#log" onclick="add(<%=username%>)">
                                打发点喽(100元起)
                            </button>
                        </p>
                    </div>
                    <div class="tab-pane" id="panel-613898">
                        <p>
                        <div class="col-md-12 column">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        编号
                                    </th>
                                    <th>
                                        车辆编号
                                    </th>
                                    <th>
                                        租借时间
                                    </th>
                                    <th>
                                        归还时间
                                    </th>
                                    <th>
                                        状态
                                    </th>
                                </tr>
                                </thead>
                                <%
                                    for(int i =0 ;i<apply.size()/5;i++){
                                %>
                                <thead>
                                <tr>
                                    <th>
                                        <%=apply.get(i*5)%>
                                    </th>
                                    <th>
                                        <%=apply.get(i*5+1)%>
                                    </th>
                                    <th>
                                        <%=apply.get(i*5+2)%>
                                    </th>
                                    <th>
                                        <%=apply.get(i*5+3)%>
                                    </th>
                                    <th>
                                        <%=apply.get(i*5+4)%>
                                    </th>
                                </tr>
                                </thead>
                                <% } %>
                            </table>
                        </div>
                        </p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>