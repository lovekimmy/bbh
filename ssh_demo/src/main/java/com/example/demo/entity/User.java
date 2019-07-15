package com.example.demo.entity;

public class User {

    private Integer id;
    private Integer roomid;
    private Integer roleid;
    private Integer classid;
    private String name;
    private String realname;
    private String password;
    private Integer telephone;
    private String idcard;
    private Integer payId;

    private UserClass userclass;
    private Room room;
    private RoomMoney roomMoney;


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", roomid=" + roomid +
                ", roleid=" + roleid +
                ", classid=" + classid +
                ", name='" + name + '\'' +
                ", realname='" + realname + '\'' +
                ", password='" + password + '\'' +
                ", telephone=" + telephone +
                ", idcard='" + idcard + '\'' +
                ", payId=" + payId +
                ", userclass=" + userclass +
                ", room=" + room +
                ", roomMoney=" + roomMoney +
                '}';
    }

    public RoomMoney getRoomMoney() {
        return roomMoney;
    }

    public void setRoomMoney(RoomMoney roomMoney) {
        this.roomMoney = roomMoney;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoomid() {
        return roomid;
    }

    public void setRoomid(Integer roomid) {
        this.roomid = roomid;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getClassid() {
        return classid;
    }

    public void setClassid(Integer classid) {
        this.classid = classid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getTelephone() {
        return telephone;
    }

    public void setTelephone(Integer telephone) {
        this.telephone = telephone;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public Integer getPayId() {
        return payId;
    }

    public void setPayId(Integer payId) {
        this.payId = payId;
    }

    public UserClass getUserclass() {
        return userclass;
    }

    public void setUserclass(UserClass userclass) {
        this.userclass = userclass;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}