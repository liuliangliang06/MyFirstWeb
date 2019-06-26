package org.skill.controller;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.annotation.Resource;

public class ProviderEntity {
    /*@Resource(name = "jdbcTemplate")
    private JdbcTemplate template;//注入
    String  sql="SELECT * from webdb.provider";//查询提供者所有数据*/
    private int id;
    private String name;
    private String phone;
    private String remarks;
    private String textrue;
    private String sSql;

    public String getsSql() {
        return sSql;
    }

    public void setsSql(String sSql) {
        this.sSql = sSql;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getTextrue() {
        return textrue;
    }

    public void setTextrue(String textrue) {
        this.textrue = textrue;
    }
}
