package com.example.demo.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class RoomMoney {
private Integer roomId;
private Double waterNum;
private Double electricNum;

@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date readingDay;

private Double price;


    @Override
    public String toString() {
        return "RoomMoney{" +
                "roomId=" + roomId +
                ", waterNum=" + waterNum +
                ", electricNum=" + electricNum +
                ", readingDay=" + readingDay +
                ", price=" + price +
                '}';
    }



    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Double getWaterNum() {
        return waterNum;
    }

    public void setWaterNum(Double waterNum) {
        this.waterNum = waterNum;
    }

    public Double getElectricNum() {
        return electricNum;
    }

    public void setElectricNum(Double electricNum) {
        this.electricNum = electricNum;
    }

    public Date getReadingDay() {
        return readingDay;
    }

    public void setReadingDay(Date readingDay) {
        this.readingDay = readingDay;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
