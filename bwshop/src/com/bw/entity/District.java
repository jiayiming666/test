package com.bw.entity;

public class District {
	
    private Integer id;

    private String name;

    private Byte level;

    private Integer upid;

    private Short list;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Byte getLevel() {
        return level;
    }

    public void setLevel(Byte level) {
        this.level = level;
    }

    public Integer getUpid() {
        return upid;
    }

    public void setUpid(Integer upid) {
        this.upid = upid;
    }

    public Short getList() {
        return list;
    }

    public void setList(Short list) {
        this.list = list;
    }
}