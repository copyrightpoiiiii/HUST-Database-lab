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

function judge() {
    var $username = $("#username").val();
    var nameLen = strlen($username);
    $username = encodeURIComponent($username);
    var $password = $("#password").val();
    $password = encodeURIComponent($password);
    var pwdLen = strlen($password);
    if (nameLen <= 10 && pwdLen <= 10) {
        $.ajax({
            type: "post",
            async: false,
            url: "../LoginServlet",
            //contentType:"utf-8",
            data:
                "uname=" + $username + "&upwd=" + $password,
            success: function (re_data) {
                var nam = "#logInfo";
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
        });
    } else {
        var nam = "#logInfo";
        $(nam).text("输入过长!");
    }
}

function userReg() {
    var $username = $("#regusername").val();
    var nemLen = strlen($username);
    $username = encodeURIComponent($username);
    var $pwd1 = $("#regpassword").val();
    var pwdLen = strlen($pwd1);
    $pwd1 = encodeURIComponent($pwd1);
    var $phone = $("#regphone").val();
    $phone = encodeURIComponent($phone);
        if (nemLen <= 10 && pwdLen <= 10) {
            $.ajax({
                type: "post",
                async: false,
                url: "../RegServlet",
                //contentType:"utf-8",
                data:
                    "regname=" + $username + "&phone=" + $phone + "&upw=" + $pwd1,
                success: function (re_data) {
                    var nam = "#regInfo";
                    if (re_data == "true") {
                        $(nam).text("注册成功");
                        window.location.replace("userquery.jsp" + "?username=" + $username);
                    } else {
                        $(nam).text("用户名已被使用!");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status + XMLHttpRequest.readyState + textStatus);
                    // 状态
                    // 错误信息
                    //alert("啊哦，出错了QAQ");
                }
            });
        } else {
            var nam = "#regInfo";
            $(nam).text("输入过长！");
        }
}

