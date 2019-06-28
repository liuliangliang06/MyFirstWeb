package org.skill.controller;

import org.springframework.jdbc.core.JdbcTemplate;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;

public class ProviderEntity {
    /*@Resource(name = "jdbcTemplate")
    private JdbcTemplate template;//注入
    String  sql="SELECT * from webdb.provider";//查询提供者所有数据*/
    private int id;
    private String name;
    private String phone;
    private String remarks;
    private String textrue;

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getComyid() {
        return comyid;
    }

    public void setComyid(String comyid) {
        this.comyid = comyid;
    }

    public int getGameserver() {
        return gameserver;
    }

    public void setGameserver(int gameserver) {
        this.gameserver = gameserver;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(Date arrival_time) {
        this.arrival_time = arrival_time;
    }

    public Date getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(Date creat_time) {
        this.creat_time = creat_time;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getMhxylabel() {
        return mhxylabel;
    }

    public void setMhxylabel(String mhxylabel) {
        this.mhxylabel = mhxylabel;
    }

    private String sSql;
    private BigDecimal price;
    private int type;
    private String comyid;
    private int gameserver;
    private int status;
    private Date arrival_time;
    private Date creat_time;
    private String recommend;
    private String mhxylabel;

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
