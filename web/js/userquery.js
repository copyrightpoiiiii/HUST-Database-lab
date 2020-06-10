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
    var $carType = $("#ddlsheng").val()+1;
    //$carType = encodeURIComponent($carType);
    var $cashStart = $("#Balance_start").val();
    //$cashStart = encodeURIComponent($cashStart);
    var $cashEnd = $("#Balance_end").val();
    //$cashEnd = encodeURIComponent($cashEnd);
    var $peopleNum = $("#travelNum").val();
    var $ssCity =$("#keyword").val();
        $.ajax({
            type: "post",
            async: true,
            url: "../QueryServlet",
            //contentType:"utf-8",
            data: {
                "carType":$carType,
                "cashStart":$cashStart,
                "cashEnd":$cashEnd,
                "peopleNum":$peopleNum,
                "ssCity":$ssCity
            },
            dataType : 'json',
            success: function (msg) {
                //alert(msg);
                for (var i = 0 ;i < msg.length ;i++){
                    var popbox = document.getElementById("thu"+i);
                    popbox.style.display = "block";
                    var nam1 = document.getElementById("hcar"+i);
                    var nam2 = document.getElementById("pcar"+i);
                    if(msg[i].carType == '1')nam1.innerHTML="SUV,";
                    else if(msg[i].carType == '2')nam1.innerHTML="hatchback,";
                    else nam1.innerHTML="sport car,";
                    nam1.innerHTML += "行驶里程:"+msg[i].useDis+"km";
                    nam2.innerHTML="价格:"+msg[i].price+",可乘坐人数:"+msg[i].takeNum+"\<br\>使用时间:"+msg[i].useTime+"个月,所在城市:"+msg[i].city;
                    var nam3 = document.getElementById("lab"+i);
                    nam3.innerText = msg[i].id;
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

function book(e) {
    var sender = (e && e.target) || (window.event && window.event.srcElement);
    var nam1 = document.getElementById("lab"+sender.id);
    var id = nam1.innerText;
    alert(id);
    $.ajax({
        type: "post",
        async: true,
        url: "../BookServlet",
        //contentType:"utf-8",
        data: {
            "id":id
        },
        success: function (re_data) {
            if (re_data =="true") {
                alert("预定成功")
            } else alert("预定失败");
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
            // 状态
            // 错误信息
            //alert("啊哦，出错了QAQ");
        }
    });
}
