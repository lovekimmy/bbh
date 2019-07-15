package com.example.ssh_system.mapper;

import com.example.ssh_system.entity.RoomMoney;

import java.util.List;

public interface RoomMoneyMapper {

int addRoomMoney(RoomMoney roomMoney);

List<RoomMoney> selectById(int roomId);
}
