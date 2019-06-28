package org.skill.controller;


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

import javax.annotation.Resource;
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
            StringBuffer sb = new StringBuffer("SELECT * from webdb.provider");
            String all=map.get("all");
            if (all.equals("1")) {
                String oSelectType = map.get("oSelectType");  //获取前台传参类型
                String oSelectPrice = map.get("oSelectPrice");   //获取前台传参价格
                sb.append(" where type='" + oSelectType + "'");
            }
            List list = template.queryForList(sb.toString());
            back.setBackData(list);
            back.setBackMsg("操作成功");
        } catch (DataAccessException e) {
            e.printStackTrace();
            back.setBackMsg("操作失败");
        }

        return back;
    }


    //写一个方法，传来的参数是个sql语句，然后生成视图，遍历两次生成一个<tr><td>
    //Map singleCustomer = template.queryForMap(sql);

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
