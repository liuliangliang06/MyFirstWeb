//前后台传参办法

function bpmBefore() {
    var xhr = new XMLHttpRequest();
    var back = null;
    var params = {
        'all': 0,
    };//传入后台的参数
    xhr.responseType = "json";
    xhr.open("POST", "http://localhost:8080/myFirst-Web/appoint/select", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function (event) {
        if (this.readyState == 4 && this.status == 200) {
            back = event.currentTarget.response;
            removeDivSelectTable('selectTable', 'tablebox')
            jsonArray = back.backData;
            appendTable(jsonArray);
        }
    }
    xhr.send(JSON.stringify(params));
}


function parseHead(oneRow) {
    for (var i in oneRow) {
        headArray[headArray.length] = i;
    }
}

/*根据json语句，生成表格方法*/
var headArray = [];

function appendTable(jsonArray) {
    headArray = [];
    parseHead(jsonArray[0]);
    var div = document.getElementById("selectTable");
    var table = document.createElement("table");
    table.id = 'tablebox';
    table.class = 'table';
    var thead = document.createElement("tr");
    for (var count = 0; count < headArray.length; count++) {
        var td = document.createElement("th");
        var a = headArray[count];
        td.innerHTML = HanHua(a);
        thead.appendChild(td);
    }
    var td2 = document.createElement("th");
    td2.innerHTML = '操作按钮';
    thead.appendChild(td2);
    table.appendChild(thead);
    for (var tableRowNo = 0; tableRowNo < jsonArray.length; tableRowNo++) {
        var tr = document.createElement("tr");
        for (var headCount = 0; headCount < headArray.length; headCount++) {
            var cell = document.createElement("td");
            var a = jsonArray[tableRowNo][headArray[headCount]];
            cell.innerHTML = HanHuaMain(headCount, a);
            tr.appendChild(cell);
        }
        var cell = document.createElement("td");
        cell.innerHTML = '<td><input id="warning"  type="button"   value="查看" onClick=clickPerson(' + jsonArray[tableRowNo].ID + ')><td>' +
            '<input  type="button"   value="删除" onClick=clickPerson(' + jsonArray[tableRowNo].ID + ')></td>';
        tr.appendChild(cell);
        tr.appendChild(cell);
        table.appendChild(tr);
    }
    div.appendChild(table);
}

function clickPerson(id) {
    console.log(id)
}


/*  移除默认 元素框elemntid1中的elemntid2*/
function removeDivSelectTable(elemntid1, elemntid2) {

    if ((document.getElementById('' + elemntid1 + '')) && (document.getElementById('' + elemntid2 + ''))) {
        document.getElementById('' + elemntid1 + '').removeChild(document.getElementById('' + elemntid2 + ''));
    }
}


/*渲染方法，将数据库自动转化为页面表头自动,provider表*/
function HanHua(a) {
    if (a == 'Name') {
        return '昵称';
    } else if (a == 'ID') {
        return '序号';
    } else if (a == 'phone') {
        return '联系方式'
    } else if (a == 'remarks') {
        return '备注'
    } else if (a == 'textrue') {
        return '组织'
    } else if (a == 'price') {
        return '价格'
    } else if (a == 'type') {
        return '类型'
    } else if (a == 'comyid') {
        return '权限'
    } else if (a == 'gameserver') {
        return '服务器'
    } else if (a == 'arrival_time') {
        return '到期时间'
    } else if (a == 'status') {
        return '状态'
    } else if (a == 'mhxylabel') {
        return '标签'
    } else {
        return a;
    }

}

/*渲染方法，将数据库自动转化为页面表头自动,provider表,headCount判断*/
function HanHuaMain(headCount, td) {
    if (headCount == 8) {
        if (td == 'A') {
            return '超级用户';
        } else if (td == 'B') {
            return 'VIP用户';
        } else if (td == 'C') {
            return '一般用户';
        } else return td;
    } else if (headCount == 4) {
        if (td == '1') {
            return '化圣'
        } else if (td == '2') {
            return '单开'
        } else if (td == '3') {
            return '五开'
        } else return td;
    } else if (headCount == 6) {
        return formatDate(td);
    } else {
        return td;
    }
}

function black() {
    var xhr = new XMLHttpRequest();
    var back = null;
    var a='aaaa';
    var b="我成功了";
    var params = {
        'all': 0,
    };//传入后台的参数
    xhr.responseType = "json";
    xhr.open("POST", "http://localhost:8080/myFirst-Web/appoint/insert?name='"+a+"'&password='"+b+"'", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function (event) {
        if (this.readyState == 4 && this.status == 200) {
            back = event.currentTarget.response;
           window.location.href="http://localhost:8080/myFirst-Web/appoint/insert";
            // window.open('http://localhost:8080/myFirst-Web/appoint/insert', 'newwindow', 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
        }
    }
    xhr.send(JSON.stringify(params));
}

function formatDate(datetimes) {
    var date = new Date(datetimes);
    Y = date.getFullYear() + '-';
    M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    D = date.getDate() + ' ';
//      h = date.getHours() + ':';
//      m = date.getMinutes() + ':';
//      s = date.getSeconds();
//      年 月 日 时 分 秒
    return Y + M + D;
}