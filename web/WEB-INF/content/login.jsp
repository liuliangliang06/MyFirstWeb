<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/20
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>智能系统</title>
</head>
<body>
<div class="main-left">
    <ul class="main-nav" style="display:none;">
        <li id="liBA" data="BA"><a id="aBA" href="javascript:void(0)" onclick="Login.ChangeSys('BA')">BA系统</a></li>
        <li id="liZH" data="ZH"><a id="aIntegrated" href="javascript:void(0)" onclick="Login.ChangeSys('ZH')">综合管理</a></li>
        <li id="lisitemanage" class="active" data="sitemanage"><a id="aSite" href="javascript:void(0)" onclick="Login.ChangeSys('sitemanage')">现场管理</a></li>
        <!--<li id="lirelationmanage" data="relationmanage"><a id="aRelation" href="javascript:void(0)" onclick="Login.ChangeSys('relationmanage')">相关方</a></li>-->
    </ul>
    <div class="table">
        <span id="span_logincom" class="loginmod-current" onclick="ChangeLoginMode('1')">账户登录</span>
        <span style="width:1%;color:red;height:18px;line-height:18px;display:inline-block;font-size:16px;color:#777777;">|</span>
        <span id="span_loginqrcode" class="loginmod-common" onclick="ChangeLoginMode('2')">扫码登录</span>
        <div style="width:100%; border-bottom:1px solid #777777;"></div>
        <table id="tb_logincom" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tbody><tr>
                <td>
                    <span class="mini-textbox mini-required" id="user" style="border-width: 0px;"><span class="mini-textbox-border"><input type="text" class="mini-textbox-input" autocomplete="off" placeholder="用户名" id="user$text" name="user"></span><input type="hidden"></span>
                </td>
            </tr>
            <tr>
                <td><span class="mini-textbox mini-password mini-required" id="pwd" style="border-width: 0px;"><span class="mini-textbox-border"><input type="password" class="mini-textbox-input" autocomplete="off" placeholder="密码" id="pwd$text"></span><input type="hidden"></span></td>
            </tr>
            <tr>
                <td>
                    <div class="w-small" style="width:200px;margin-right:6px;">
                        <span class="mini-textbox mini-required" id="verifycode" style="border-width: 0px;"><span class="mini-textbox-border"><input type="text" class="mini-textbox-input" autocomplete="off" placeholder="验证码" id="verifycode$text"></span><input type="hidden"></span>
                    </div>
                    <span id="validResult" style="float:left;margin-top:5px;margin-right:5px; width:16px; height:16px;display:inline-block;" class="validCode_Tip"></span>
                    <img id="imgcode" class="yzm" src="/Login/VerifyCodeImg.ashx?1=1&amp;t=1560997633775" alt="验证码" onclick="Login.imgCode()" width="80" height="31">

                </td>
            </tr>
            <!--<tr id="trXgf" style="height: 16px; line-height: 16px;display:none;">
                <td style="height: 16px; line-height: 16px;">
                    <input id="xfg" name="login_usertype" type="radio" value="1" style="width:16px;height:16px;line-height:16px;background-color:transparent;" />
                    <label for="xfg" style="color: white;font-size:14px;">相关方用户</label>
                    <input id="ygs" name="login_usertype" type="radio" value="0" style="margin-left:30px;width:16px;height:16px;line-height:16px;background-color:transparent;" checked="checked" />
                    <label for="ygs" style="color: white;font-size:14px;">一公司用户</label>
                </td>
            </tr>-->
            <tr>
                <td>
                    <input id="remember" class="check" type="checkbox" value="" style="margin-top:10px;height:13px;" checked="checked"><label for="remember" class="check-text" id="spanRemember">记住登录信息</label>
                    <select id="selLang" onchange="Login.ChangeLang()">
                        <option value="cn">中文</option>
                        <option value="en">English</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><a id="login_button" class="btn-mm" onclick="Login.onLogin()">登 录</a></td>
            </tr>
            </tbody></table>
        <table id="tb_loginqrcode" width="100%" border="0" cellspacing="0" cellpadding="0" height="300" style="display:none;">
            <tbody><tr style="height:200px;">
                <td align="center" valign="bottom">
                    <div id="div_qrcode" style="width: 150px;height:133px;padding-top:17px;background-color:#FFFFFF;display:none;">
                        <img id="qrcode_login" src="" onclick="QRCodeLogin.getQRCode();">
                    </div>

                </td>
            </tr>
            <tr>
                <td align="center" style="color:#DDDDDD;font-size:14px;" valign="top">
                    打开中建八一云+APP　扫描二维码
                </td>
            </tr>
            </tbody></table>
    </div>
</div>
</body>
</html>
