<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        //前后台传参办法
        function bpmBefore() {
            window.location.reload();
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
                    appendTable();
                }
            };
            xhr.send(JSON.stringify(params));
        }

        var jsonArray = [{"编号": "001", "名称": "小苹果", "描述": "现代神曲，大妈的最爱"}, {"编号": "002", "名称": "mou宝", "描述": "想怎么玩就怎么完"}];
        var headArray = [];

        function parseHead(oneRow) {
            for (var i in oneRow) {
                headArray[headArray.length] = i;
            }
        }

        function appendTable() {

            parseHead(jsonArray[0]);
            var div = document.getElementById("div1");
            var table = document.createElement("table");
            var thead = document.createElement("tr");
            for (var count = 0; count < headArray.length; count++) {
                var td = document.createElement("th");
                td.innerHTML = headArray[count];
                thead.appendChild(td);
            }
            table.appendChild(thead);
            for (var tableRowNo = 0; tableRowNo < jsonArray.length; tableRowNo++) {
                var tr = document.createElement("tr");
                for (var headCount = 0; headCount < headArray.length; headCount++) {
                    var cell = document.createElement("td");
                    cell.innerHTML = jsonArray[tableRowNo][headArray[headCount]];
                    if(headCount=(headArray.length-1)){
                        alert("333!")
                    }
                    tr.appendChild(cell);
                }
                table.appendChild(tr);
            }
            div.appendChild(table);
        }



        function c1() {
            var data = [{"id": 1, "name": "张三"}, {"id": 14, "name": "张三"}, {"id": 1, "name": "张三"}, {
                "id": 1,
                "name": "张三"
            }];

            var tdArr = document.getElementById('tablebox').firstElementChild;
            for (var i = 0; i < data.length; i++) {
                var tr = document.createElement("tr");
                tr.innerHTML = '<td class="active">' + data[i].name + '</td><td class="warning" onClick=clickPerson(' + data[i].id + ') >编辑</td>';
                tdArr.appendChild(tr)
            }


        }

        function clickPerson(id) {
            console.log(id)
        }
    </script>
    <style>
        table {
            width: 600px;
            padding: 0;
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 6px 6px 6px 12px;
            color: #4f6b72;
            text-align: center;
        }

        th {
            background: #d3d3d3;

        }
    </style>

</head>
<body>
<div id="div1"></div>
<button type="button" onclick="bpmBefore() ">查询</button>
<table class="table table-hover" id="tablebox">
    <tr>
        <td class="active">用户名</td>
        <td class="warning">编辑</td>
    </tr>
</table>
<button type="button" onclick="c1()">查询2</button>
</body>
</html>
