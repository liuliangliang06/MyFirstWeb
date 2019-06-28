package org.skill.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.mingrisoft.DBConnection;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

import static java.lang.System.out;


@Controller
@RequestMapping(value = "/appoint")
public class ProviderController {
    @Resource(name = "jdbcTemplate")
    private JdbcTemplate template;//注入
    String sql = "SELECT * from webdb.provider"; //查询提供者所有数据
    DBConnection DBConn = new DBConnection();// 引入连接数据库方法类
    //String sql = "11111"; //查询提供者所有数据
    String sql1 = "<tr>\n" +
            "    <td>" + sql + "</td>\n" +                   //第一行ID
            "    <td>" + sql + "</td>\n" +                //第二项NAME
            "    <td>" + sql + "</td>\n" +                //第三项联系方式
            "    <td>" + sql + "</td>\n" +                //第四项权限
            "    <td>" + sql + "</td>\n" +                //第五项备注
            "    <td><a style=\"color:#3F862E\" target=\"_blank\" href=\"newsFrontDetail.jsp?newsId=1\">详情</a></td>\n" +
            "</tr>";
    StringBuffer sb = new StringBuffer();

    @RequestMapping(value = "/select")
    @ResponseBody
    public JsonBackData DF2(@RequestBody Map<String, String> map) {
        JsonBackData back = null;
        try {
            back = new JsonBackData();
            StringBuffer sb = new StringBuffer("SELECT ID,`Name`,phone,price,type,gameserver,arrival_time,`status`,mhxylabel FROM webdb.provider");
            String all = map.get("all");
            if (all.equals("1")) {
                String oSelectType = map.get("oSelectType");  //获取前台传参类型
                String oSelectPrice = map.get("oSelectPrice");   //获取前台传参价格
                sb.append(" where type='" + oSelectType + "'");
            }
            List list = template.queryForList(sb.toString());
            // rs 是对象,只要里面有日期类型,就可以自动转换格式
            //JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd hh:mm:ss", SerializerFeature.WriteDateUseDateFormat);

            back.setBackData(list);
            back.setBackMsg("操作成功");
        } catch (DataAccessException e) {
            e.printStackTrace();
            back.setBackMsg("操作失败");
        }

        return back;
    }

    @RequestMapping(value = "/insert")
    @ResponseBody
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        //JsonBackData back = null;
        ModelAndView mv = new ModelAndView();
        //name=css&password=123
        String strId = httpServletRequest.getParameter("name");
        String  aaa=httpServletRequest.getParameter("password");
        try {
            mv.addObject("message", "hello World");
            mv.addObject("age", 15);
            mv.setViewName("/WEB-INF/admin/providerNew.jsp");  //主页视图
        } catch (DataAccessException e) {
            e.printStackTrace();
        }

        return mv;
    }


    public String DF3() {
        sql1 = sql1 + sql1;
        JsonBackData back = null;
        back = new JsonBackData();
        List singleCustomer = template.queryForList(sql);
        back.setBackMsg("成功了");
        back.setBackData(singleCustomer);
        out.println(sql1);
        return "666666666666666";
    }


}
