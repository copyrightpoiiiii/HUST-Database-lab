type = "text/javascript";

function addFunctionAlty(value, row, index) {
    return [
        '<button id="bind" type="button" class="btn btn-default">通过</button>',
        '<button id="unbind" type="button" class="btn btn-default">拒绝</button>',
        '<button id="ret" type="button" class="btn btn-default">还车</button>',
    ].join('');
}
window.operateEvents = {
    'click #bind': function (e, value, row, index) {
        $.ajax({
            type: "post",
            async: false,
            url: "../changeServlet",
            //contentType:"utf-8",
            data: {
                "id":row.id,
                "state":2,
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
            url: "../changeServlet",
            //contentType:"utf-8",
            data: {
                "id":row.id,
                "state":3,
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
    },'click #ret': function (e, value, row, index) {
        $.ajax({
            type: "post",
            async: false,
            url: "../changeServlet",
            //contentType:"utf-8",
            data: {
                "id":row.id,
                "state":3,
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
        url: '../getApplyServelet',
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
        /*responseHandler: function(res){
            return res.attributes.Unit;
        },*/
        columns: [{
            checkbox: true
        }, {
            field: 'id',
            title: '申请编号',
        }, {
            field: 'username',
            title: '用户名称',
        }, {
            field: 'credit',
            title: '信用度',
        }, {
            field: 'phone',
            title: '手机号',
        }, {
            field: 'ssCity',
            title: '地址',
        }, {
            field: 'operate',
            title: '操作',
            events: operateEvents,//给按钮注册事件
            formatter: addFunctionAlty//表格中增加按钮  
        }]
    });
})
