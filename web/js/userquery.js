type = "text/javascript";

function strlen(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        var c = str.charCodeAt(i);
        //单字节加1
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            len++;
        } else {
            len += 2;
        }
    }
    return len;
}

function query() {
    for (var i = 0 ;i < 12 ;i++){
        var popbox = document.getElementById("thu"+i);
        popbox.style.display = "block";
        var nam1 = document.getElementById("hcar"+i);
        var nam2 = document.getElementById("pcar"+i);
        nam1.innerHTML="2";
        nam2.innerHTML="3";
    }
    /*var $carType = $("#ddlsheng").val();
    $carType = encodeURIComponent($carType);
    var $cashStart = $("#Balance_start").val();
    $cashStart = encodeURIComponent($cashStart);
    var $cashEnd = $("#Balance_end").val();
    $cashEnd = encodeURIComponent($cashEnd);
    var $peopleNum = encodeURIComponent($("#travelNum").val());
    var $ssCity = encodeURIComponent($("#keyword").val());
        $.ajax({
            type: "post",
            async: false,
            url: "../QueryServlet",
            //contentType:"utf-8",
            data:
                "carType=" + $carType + "&cashStart=" + $cashStart+"&cashEnd="+$cashEnd+"&peopleNum="+$peopleNum+"&ssCity="+$ssCity,
            success: function (re_data) {
                var nam = "#logInfo";
                alert(re_data);
                if (re_data === "2" || re_data ==="1") {
                    $(nam).text("登录成功");
                    if(re_data === "2")
                        window.location.replace("userquery.jsp" + "?username=" + $username);
                    else window.location.replace("adminManager.jsp" + "?username=" + $username);
                } else if(re_data === "-1"){
                    $(nam).text("用户名或密码错误!");
                } else{
                    $(nam).text("系统故障!");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
                // 状态
                // 错误信息
                //alert("啊哦，出错了QAQ");
            }
        });*/
}
