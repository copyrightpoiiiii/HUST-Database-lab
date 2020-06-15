type = "text/javascript";

function addFunctionAlty(value, row, index) {
    return [
        '<button id="bind" type="button" class="btn btn-default">保养</button>',
        '<button id="unbind" type="button" class="btn btn-default">开始使用</button>',
    ].join('');
}
window.operateEvents = {
    'click #bind': function (e, value, row, index) {
        $.ajax({
            type: "post",
            async: false,
            url: "../changeCarServlet",
            //contentType:"utf-8",
            data: {
                "id":row.id,
                "state":1,
            },
            success: function (re_data) {
                if (re_data =="true") {
                    alert("修改成功")
                } else alert("修改失败");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
                // 状态
                // 错误信息
                //alert("啊哦，出错了QAQ");
            }
        });
    }, 'click #unbind': function (e, value, row, index) {
        $.ajax({
            type: "post",
            async: false,
            url: "../changeCarServlet",
            //contentType:"utf-8",
            data: {
                "id":row.id,
                "state":0,
            },
            success: function (re_data) {
                if (re_data =="true") {
                    alert("修改成功")
                } else alert("修改失败");
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
                // 状态
                // 错误信息
                //alert("啊哦，出错了QAQ");
            }
        });
    }
};

$(document).ready(function() {
    $('#table').bootstrapTable({
        pagination: true,
        showColumns: true,
        pageSize: 10,
        pageNumber: 1,
        pageList: [10, 25, 50],
        showRefresh: true,
        smartDisplay: false,
        singleSelect: true, // 单选checkbox
        clickToSelect: true,
        uniqueId: 'id',
        method: 'post',
        url: '../getCarServlet',
        dataType: 'json',
        sidePagination: 'server',
        toolbar: '#toolbar',
        queryParams: function (params) {
            var params = {
                offset: params.offset,   //数据起始
                limit: params.limit,  //偏移量
                netbarName: $("#netbarName").val(),
                netbarNo: $("#netbarNo").val(),
                areaCode: $("#areaCode").val()
            };
            return params;
        },
        columns: [{
            checkbox: true
        }, {
            field: 'id',
            title: '车辆编号',
        }, {
            field: 'useTime',
            title: '使用时间',
        }, {
            field: 'useDis',
            title: '行驶距离',
        }, {
            field: 'upkeepDate',
            title: '上次维修时间',
        }, {
            field: 'City',
            title: '地址',
        }, {
            field: 'state',
            title: '状态',
        }, {
            field: 'operate',
            title: '操作',
            events: operateEvents,//给按钮注册事件
            formatter: addFunctionAlty//表格中增加按钮  
        }]
    });
})

function tableMake(username) {
    $username = encodeURIComponent(username);
    window.location.replace("makeTable.jsp"+"?username="+$username);
}

function appMan(username) {
    $username = encodeURIComponent(username);
    window.location.replace("adminManager.jsp"+"?username="+$username);
}

function update() {
    var $id = $("#Balance_end").val();
    var $money = $("#Balance_start").val();
    $.ajax({
        type: "post",
        async: true,
        url: "../keepServlet",
        //contentType:"utf-8",
        data: {
            "id":$id,
            "money":$money
        },
        success: function (msg) {
            if (msg == "true") {
                alert("修改成功");
            } else {
                alert("修改失败");
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
            // 状态
            // 错误信息
            //alert("啊哦，出错了QAQ");
        }
    });
}
