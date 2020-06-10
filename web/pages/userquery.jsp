<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TGT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="../js/userquery.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
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
                        <li class="active">
                            <button type="submit" class="btn btn-link btn-lg" data-toggle="modal" href="userinfo.jsp" >
                                个人信息
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
                                    <div class="col-md-4 control-label" for="select">汽车类型</div>
                                    <div class="col-md-4">
                                        <select ID="ddlsheng" class="form-control">
                                            <option Value="0">SUV</option>
                                            <option Value="1">hatchback</option>
                                            <option Value="2">sport car</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">价格</div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="Balance_start"
                                               name="Balance_start" />
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="Balance_end"
                                               name="Balance_end" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">乘坐人数</div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="travelNum"
                                               name="travelNum" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label">出发地</div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="keyword"
                                               name="keyword" />
                                    </div>
                                    <div class="col-md-4">
                                        <input type="button" ID="btnSearch" value=" 查 询 "
                                               class="btn btn-success col-md-12 " onclick="query()"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!--查询 按钮-->
                </div>

        </div>
    </div>
    <div class="col-md-12 column">
        <%
            for(int i = 0; i < 4 ; i++){
        %>
        <div class="row">
            <%
                for(int j = 0; j < 3 ; j ++){
            %>
            <div class="col-md-4">
                <div class="thumbnail" id = "thu<%=i*3+j%>" style="display: none">
                    <div class="caption" id = "car<%=i*3+j%>" >
                        <h3 id="hcar<%=i*3+j%>">
                            Thumbnail label
                        </h3>
                        <p id="pcar<%=i*3+j%>">
                            Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                        </p>
                        <p>
                            <a class="btn" onclick="book(this)" id ="<%=i*3+j%>" >预定</a>
                        </p>
                        <div id="lab<%=i*3+j%>" style="display: none"></div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        %>
        <ul class="pagination">
            <li>
                <a href="#">Prev</a>
            </li>
            <li>
                <a href="#">1</a>
            </li>
            <li>
                <a href="#">2</a>
            </li>
            <li>
                <a href="#">3</a>
            </li>
            <li>
                <a href="#">4</a>
            </li>
            <li>
                <a href="#">5</a>
            </li>
            <li>
                <a href="#">Next</a>
            </li>
        </ul>
    </div>
</div>
</body>


</html>