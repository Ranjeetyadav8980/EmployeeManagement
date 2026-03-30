package com.nt.reposetry;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Room;

public interface IRoomReposerty extends JpaRepository<Room, Integer> {

}
