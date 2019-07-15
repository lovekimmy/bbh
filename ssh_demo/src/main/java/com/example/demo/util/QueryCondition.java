package com.example.demo.util;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class QueryCondition {
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDay;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDay;
    private Integer roomid;
    private Integer classid;
    private Integer payId;


    @Override
    public String toString() {
        return "QueryCondition{" +
                "startDay=" + startDay +
                ", endDay=" + endDay +
                ", roomid=" + roomid +
                ", classid=" + classid +
                ", payId=" + payId +
                '}';
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public Integer getPayId() {
        return payId;
    }

    public void setPayId(Integer payId) {
        this.payId = payId;
    }
}