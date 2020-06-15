type = "text/javascript";

function tableMake(username) {
    $username = encodeURIComponent(username);
    window.location.replace("makeTable.jsp"+"?username="+$username);
}

function appMan(username) {
    $username = encodeURIComponent(username);
    window.location.replace("adminManager.jsp"+"?username="+$username);
}

function carMan(username) {
    $username = encodeURIComponent(username);
    window.location.replace("adminCar.jsp"+"?username="+$username);
}