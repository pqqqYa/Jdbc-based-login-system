package com.cn.shixun.pojo;

public class Result {
    private int code;
    private String info;
    private Object date;

    public Result(int code, String info, Object date) {
        this.code = code;
        this.date = date;
        this.info = info;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getDate() {
        return date;
    }

    public void setDate(Object date) {
        this.date = date;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "Result {code=" + code + ", info=" + info + ", date=" + date + "}";
    }
}
