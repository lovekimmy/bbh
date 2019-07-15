package com.example.demo.mapper;

import com.example.demo.entity.Room;

import java.util.List;

public interface RoomMapper {

    List<Room> listRoom();

    Room selectByPrimaryKey(Integer id);

    Integer roomIdById(Integer id);

    int deleteByPrimaryKey(Integer id);

    int insert(Room record);

    int insertSelective(Room record);


    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
}