// Filter
function myFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("myDIV");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}

//menu onmouseover event
function changeBorder(id){
    document.getElementById(id).style="background-color:#AAAAAA";
}
//menu onmouseout event
function changeBack(id){
    document.getElementById(id).style="background-color:none";
}
//clock
var hour = 0;
var minute = 0;
var second = 0;
function clock(){
    // var time = new Date();
    // var hour = time.getHours();
    // var minute = time.getMinutes();
    // var second = time.getSeconds();
    second++;
    if(second >= 60){
        second = 0;
        minute++;
    }    
    if(minute >= 60){
        minute = 0;
        hour++;
    }
    var time;
    if(hour < 10) time = '0'+hour+":";
    else time = hour+":";
    if(minute < 10) time += '0'+minute+":";
    else time += minute+":";
    if(second < 10) time += '0'+second;
    else time += second;
    document.getElementById("timmer").innerHTML = time;
    setTimeout("clock()",1000);
}
// function showDate(){
//     var time = new Date();
//     var year = time.getFullYear();
//     var month = time.getMonth();
//     var date = time.getDate();
//     var time1 = year+"."+month+"."+date;
//     document.getElementById("timmer").innerHTML = time1;
// }