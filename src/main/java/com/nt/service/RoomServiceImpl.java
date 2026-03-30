package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Room;
import com.nt.reposetry.IRoomReposerty;

@Service
public class RoomServiceImpl implements IRoomService {

	@Autowired
	private IRoomReposerty iRoomrep;
	
	
	@Override
	public String saveRoom(Room room) {
		
		iRoomrep.save(room);
		return  " save Room successfully    :   "+ room.getRoomId();
	}


	@Override
	public List<Room> getAllRoomData() {
		
		return iRoomrep.findAll();
	}


	@Override
	public Room getRoomByNo(Integer roomId) {
		
	Room rom=	 iRoomrep.findById(roomId).orElseThrow(() -> new IllegalArgumentException("room id is the not found"));
	return rom;
	}


	@Override
	public String updateRoom(Room room) {
		iRoomrep.save(room);
		return "dava update successufully";
	}


	@Override
	public void deleteRoom(int roomId) {
		iRoomrep.deleteById(roomId);
		
	}


	
}
