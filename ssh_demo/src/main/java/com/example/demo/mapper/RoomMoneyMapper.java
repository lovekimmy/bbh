package com.example.demo.mapper;

import com.example.demo.entity.RoomMoney;

import java.util.List;

public interface RoomMoneyMapper {

int addRoomMoney(RoomMoney roomMoney);

List<RoomMoney> selectById(int roomId);
}
