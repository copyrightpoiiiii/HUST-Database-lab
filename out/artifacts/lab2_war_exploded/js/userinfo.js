type = "text/javascript";

function add(username) {
    username = encodeURIComponent(username);
    $.ajax({
        type: "post",
        async: false,
        url: "../fundServlet",
        //contentType:"utf-8",
        data: "username="+username,
        success: function (re_data) {
            if (re_data =="true") {
                alert("充值成功")
            } else alert("充值失败");
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
            // 状态
            // 错误信息
            //alert("啊哦，出错了QAQ");
        }
    });
}

function turn(username) {
    $username = encodeURIComponent(username);
    window.location.replace("userquery.jsp" + "?username=" + $username);
}
