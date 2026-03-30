package com.nt.service;

import java.util.List;

import com.nt.model.Room;

public interface IRoomService {

    public String saveRoom(Room room);
    public List<Room> getAllRoomData();
    public Room getRoomByNo(Integer roomId);
    public String updateRoom(Room room);
    public void deleteRoom(int roomId);

}
