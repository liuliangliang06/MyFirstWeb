package org.skill.controller;

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
import java.util.Map;

@Controller
@RequestMapping(value = "/appointments")
public class Test {
    private  static Log logger= LogFactory.getLog(Test.class);
    @Resource(name = "jdbcTemplate")
    private JdbcTemplate template;//注入
    @RequestMapping(value="/new")
    @ResponseBody
    public JsonBackData CSS(@RequestBody Map<String, String> map){
        JsonBackData back = null;
        try {
            back = new JsonBackData();
            String state = map.get("selectedState");
            String billCodeApply = map.get("billCodeApply");
            logger.info("handleRequest被调用");
            back.setBackMsg(state+billCodeApply);
            String sql="SELECT * from webdb.login where name='"+state+"' ";
            Map singleCustomer=template.queryForMap(sql);
            String message=(String)singleCustomer.get("pwd");
            if(message.equals(billCodeApply)){
                back.setBackMsg("登录成功");
            }else{
                back.setBackMsg("密码错误");
            }
        } catch (DataAccessException e) {
            e.printStackTrace();
            back.setBackMsg("登录失败");
        }

        return back;
    }

}
