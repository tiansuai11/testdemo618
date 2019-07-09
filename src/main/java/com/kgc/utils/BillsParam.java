package com.kgc.utils;

import java.util.Date;

public class BillsParam {
    private Integer tid;
    private Date min_day;
    private Date max_day;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Date getMin_day() {
        return min_day;
    }

    public void setMin_day(Date min_day) {
        this.min_day = min_day;
    }

    public Date getMax_day() {
        return max_day;
    }

    public void setMax_day(Date max_day) {
        this.max_day = max_day;
    }
}
