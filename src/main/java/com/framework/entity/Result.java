package com.framework.entity;

import com.framework.util.PageData;

/**
 * Created by thankful on 2016/9/1.
 */
public class Result {

    private int code;

    private String msg;

    private PageData pd;

    public Result() {
    }

    public Result(int code, String msg, PageData pd) {
        this.code = code;
        this.msg = msg;
        this.pd = pd;
    }

    /**
     * Getter for property 'code'.
     *
     * @return Value for property 'code'.
     */
    public int getCode() {
        return code;
    }

    /**
     * Setter for property 'code'.
     *
     * @param code Value to set for property 'code'.
     */
    public void setCode(int code) {
        this.code = code;
    }

    /**
     * Getter for property 'msg'.
     *
     * @return Value for property 'msg'.
     */
    public String getMsg() {
        return msg;
    }

    /**
     * Setter for property 'msg'.
     *
     * @param msg Value to set for property 'msg'.
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }

    /**
     * Getter for property 'pd'.
     *
     * @return Value for property 'pd'.
     */
    public PageData getPd() {
        return pd;
    }

    /**
     * Setter for property 'pd'.
     *
     * @param pd Value to set for property 'pd'.
     */
    public void setPd(PageData pd) {
        this.pd = pd;
    }
}
