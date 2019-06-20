//弃审逻辑方法：如果当前单据被下游参照，则无法执行弃审，并提示具体参照的下游单据
function bpmBefore() {
    var xhr = new XMLHttpRequest();
    var back = null;
    //var selectedState = page.findUI("baseForm").api.getFieldValue("selectedState");//获取单据参照状态
    //var billCode = page.findUI("baseForm").api.getFieldValue("billCode");//获取单据编号
    var params = {
        'selectedState': "郑立霞",
        'billCodeApply': 666
    };//传入后台的参数
    xhr.responseType = "json";
    xhr.open("POST", "http://localhost:8080/myFirst-Web/appointments/new", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function (event) {
        if (this.readyState == 4 && this.status == 200) {
            back = event.currentTarget.response;
            var backData = back.backData;
        }
    };
    xhr.send(JSON.stringify(params));
}