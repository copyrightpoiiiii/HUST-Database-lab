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
                                    <div class="col-md-4 control-label" for="select">归属地</div>
                                    <div class="col-md-4">
                                        <select ID="ddlsheng" class="form-control">
                                            <option Value="0">全国</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">

                                        <select ID="ddlshi" class="form-control">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">余额</div>
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
                                    <div class="col-md-4 control-label" for="select">是否VIP</div>
                                    <div class="col-md-4">
                                        <select ID="select_IsVIP" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="-1">全部</option>
                                            <option Value="0">是</option>
                                            <option Value="1">否</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">日期</div>
                                    <div class="col-md-4">
                                        <input type="text" id="txtfrom" runat="server" class="form-control"
                                               placeholder="选择开始日期" οnfοcus="WdatePicker({dateFmt:'yyyy/MM/dd'})">
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" id="txtto" runat="server" class="form-control"
                                               placeholder="选择结束日期" οnfοcus="WdatePicker({dateFmt:'yyyy/MM/dd'})">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">代驾次数</div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="daijicount_start"
                                               name="daijicount_start" />
                                    </div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="daijicount_end"
                                               name="daijicount_end" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">生日月份</div>
                                    <div class="col-md-4">
                                        <select ID="BirthdayMonth" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="0">全部</option>
                                            <option Value="1">1月</option>
                                            <option Value="2">2月</option>
                                            <option Value="3">3月</option>
                                            <option Value="4">4月</option>
                                            <option Value="5">5月</option>
                                            <option Value="6">6月</option>
                                            <option Value="7">7月</option>
                                            <option Value="8">8月</option>
                                            <option Value="9">9月</option>
                                            <option Value="10">10月</option>
                                            <option Value="11">11月</option>
                                            <option Value="12">12月</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">跟踪状态</div>
                                    <div class="col-md-4">
                                        <select ID="TrackingState" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="-1">全部</option>
                                            <option Value="0">有意向</option>
                                            <option Value="1">无意向</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">再联系时间</div>
                                    <div class=" col-md-8 ">
                                        <input type="text" id="NextContactDate" runat="server" class="form-control"
                                               placeholder="选择日期"
                                               οnfοcus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">集团用户</div>
                                    <div class="col-md-4">
                                        <select ID="GroupUser" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="-1">全部</option>
                                            <option Value="0">个人用户</option>
                                            <option Value="1">集团用户</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label" for="select">客户类型</div>
                                    <div class="col-md-4">
                                        <select ID="CustomersType" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="0">全部</option>
                                            <option Value="1">预付用户</option>
                                            <option Value="2">推荐用户</option>
                                            <option Value="3">普通用户</option>
                                            <option Value="4">定额合约后付费商户</option>
                                            <option Value="5">非定额后付费合约商户</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-3 control-label" for="select">开票</div>
                                    <div class="col-md-3">
                                        <select ID="ddl_Invoice" runat="server" AutoPostBack="True"
                                                class="form-control">
                                            <option Value="-1">全部</option>
                                            <option Value="1">已开发票</option>
                                            <option Value="0">未开发票</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 control-label" for="select">标记</div>
                                    <div class="col-md-3">
                                        <select ID="ddlRemark" class="form-control">
                                            <option Value="0">全部</option>
                                            <option Value="1">空号</option>
                                            <option Value="2">通话中</option>
                                            <option Value="3">拒接</option>
                                            <option Value="4">无人接听</option>
                                            <option Value="5">停机</option>
                                            <option Value="6">非本人</option>
                                            <option Value="7">不需要</option>
                                            <option Value="8">酒店</option>
                                            <option Value="9">E代驾</option>
                                            <option Value="10">重复数据</option>
                                            <option Value="11">其他</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-8 col-xs-8 col-xxs-12">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-md-4 control-label">关键字</div>
                                    <div class="col-md-4">
                                        <input type="text" class="form-control" runat="server" id="keyword"
                                               name="keyword" />
                                    </div>
                                    <div class="col-md-4">
                                        <input type="button" ID="btnSearch" value=" 筛 选 "
                                               class="btn btn-success col-md-12 " />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--查询 按钮-->
                </div>
            </div>

        </div>
    </div>
</div>


</html>