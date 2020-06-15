package com.framework.entity;

import java.util.List;

/**
 * ajax 分页对象
 */
public class AjaxPaging<T> {
    /**
     * 第几页，每次加一
     */
    private int sEcho;

    /**
     * 从第几行开始
     */
    private long iDisplayStart;

    /**
     * 每页查询几条
     */
    private int iDisplayLength;

    /**
     * 所有的记录数量
     */
    private long count;


//    private long iTotalRecords;

//    private long iTotalDisplayRecords;

    private int draw;

    private long recordsTotal;

    private long recordsFiltered;

    private List<T> dataList;

    /**
     * 用于承载表单数据
     */
    private T pd;

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
        setDraw(sEcho);
    }

    public long getiDisplayStart() {
        return iDisplayStart;
    }

    public void setiDisplayStart(long iDisplayStart) {
        this.iDisplayStart = iDisplayStart;
    }

    public int getiDisplayLength() {
        return iDisplayLength;
    }

    public void setiDisplayLength(int iDisplayLength) {
        this.iDisplayLength = iDisplayLength;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
        setRecordsTotal(count);
        setRecordsFiltered(count);
    }

    public T getPd() {
        return pd;
    }

    public void setPd(T pd) {
        this.pd = pd;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public long getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(long recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }
}
