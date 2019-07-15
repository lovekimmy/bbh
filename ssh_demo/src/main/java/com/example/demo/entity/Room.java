package com.example.demo.entity;


public class Room {
    private Integer id;
    private Integer room;

    private Integer number;

    private Integer size;

    private String face;

    private Double square;


    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", room=" + room +
                ", number=" + number +
                ", size=" + size +
                ", face='" + face + '\'' +
                ", square=" + square +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getFace() {
        return face;
    }

    public void setFace(String face) {
        this.face = face;
    }

    public Double getSquare() {
        return square;
    }

    public void setSquare(Double square) {
        this.square = square;
    }
}