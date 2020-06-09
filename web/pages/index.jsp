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
    <script src="../js/index.js"></script>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
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
                    </ul>
                </div>

            </nav>
            <div class="jumbotron">
                <h1>
                    欢迎来到TGT租车网
                </h1>
                <p>
                    在这里你可以体验到：
                </p>
                <p>
                    1.线上租车
                </p>
                <p>
                    2.极速审核
                </p>
                <p>
                    3.线下取车
                </p>
                <p>
                    4.就近还车
                </p>
                <p>
                    5.线上支付
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="#">开始体验</a>
                </p>
            </div>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="log" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--登陆框头部-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    欢迎登陆！
                </h4>
            </div>
            <!--登陆框中间部分(from表单)-->
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <!--用户框-->
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" placeholder="username" required="required">
                        </div>
                    </div>
                    <!--密码框-->
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label" >密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" placeholder="password" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <span class="form-group" id="logInfo"></span>
                        </div>
                    </div>
                    <!--登陆按钮-->
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" onclick="judge()">登录</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="reg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true" data-backdrop="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!--登陆框头部-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title" id="myModalLabel2">
                    欢迎注册！
                </h4>
            </div>
            <!--登陆框中间部分(from表单)-->
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <!--用户框-->
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="regusername" placeholder="username" required="required">
                        </div>
                    </div>
                    <!--密码框-->
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label" >密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="regpassword" placeholder="password" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label" >手机号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="regphone" placeholder="phonenum" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <span class="form-group" id="regInfo"></span>
                        </div>
                    </div>
                    <!--登陆按钮-->
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default" onclick="userReg()">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>