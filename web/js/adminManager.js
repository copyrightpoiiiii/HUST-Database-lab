type = "text/javascript";

function addFunctionAlty(value, row, index) {
    return [
        '<button id="bind" type="button" class="btn btn-default">绑定</button>',
        '<button id="unbind" type="button" class="btn btn-default">解绑</button>',
    ].join('');
}
window.operateEvents = {
    'click #bind': function (e, value, row, index) {
        alert(row.qxxh);
        $("#upload").modal('show');
    }, 'click #unbind': function (e, value, row, index) {
        alert(row.qxxh);
        $("#upload").modal('show');
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
        method: 'get',
        url: '/sys/netbar/manage/list/data',
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
            field: 'applyNo',
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
            field: 'applyTimeStr',
            title: '申请时间',
        }, {
            field: 'address',
            title: '地址',
        }, {
            field: 'operate',
            title: '操作',
            events: operateEvents,//给按钮注册事件
            formatter: addFunctionAlty//表格中增加按钮  
        }]
    });
})
