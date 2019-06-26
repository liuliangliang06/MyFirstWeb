
//前后台传参办法

function bpmBefore() {
    var xhr = new XMLHttpRequest();
    var back = null;
    var params = {
        'selectedState': "zhenglixia",
        'billCodeApply': 666
    };//传入后台的参数
    xhr.responseType = "json";
    xhr.open("POST", "http://localhost:8080/myFirst-Web/appoint/select", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function (event) {
        if (this.readyState == 4 && this.status == 200) {
            back = event.currentTarget.response;
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
    parseHead(jsonArray[0]);
    var div = document.getElementById("selectTable");
    var table = document.createElement("table");
    table.id = 'tablebox';
    table.class='table';
    var thead = document.createElement("tr");
    for (var count = 0; count < headArray.length; count++) {
        var td = document.createElement("th");
        var a = headArray[count];
        td.innerHTML = HanHua(a);
        thead.appendChild(td);
    }
    var td2 = document.createElement("th");
    td2.innerHTML ='操作按钮';
    thead.appendChild(td2);
        table.appendChild(thead);
    for (var tableRowNo = 0; tableRowNo < jsonArray.length; tableRowNo++) {
        var tr = document.createElement("tr");
        for (var headCount = 0; headCount < headArray.length; headCount++) {
            var cell = document.createElement("td");
            cell.innerHTML = jsonArray[tableRowNo][headArray[headCount]];
            tr.appendChild(cell);
        }
        var cell = document.createElement("td");
        cell.innerHTML = '<td><input id="warning"  type="button"   value="查看" onClick=clickPerson(' + jsonArray[tableRowNo].ID + ')><td><input  type="button"   value="删除" onClick=clickPerson(' + jsonArray[tableRowNo].ID + ')></td>';
        tr.appendChild(cell);
        tr.appendChild(cell);
        table.appendChild(tr);
    }
    div.appendChild(table);
}

function clickPerson(id) {
    console.log(id)
}




/*  移除默认查询框*/
function removeDivSelectTable() {
    document.getElementById('selectTable').removeChild(document.getElementById('tablebox'));
    window.location.reload();  //刷新页面
}

/*渲染方法，将数据库自动转化为页面自动,provider表*/
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
    } else {
        return a;
    }


}