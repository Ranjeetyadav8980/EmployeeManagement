package com.nt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.Room;
import com.nt.service.IRoomService;



@Controller
public class RoomController {

	@Autowired
	private IRoomService iRoomservice;
	@GetMapping("/r")
	public String showForm(@ModelAttribute("room") Room room) {
	    return "roomsave";
	}

	@PostMapping("/save")
	public String saveRoom(@ModelAttribute("room") Room room,
	                       RedirectAttributes ra) {

	    iRoomservice.saveRoom(room);
	    ra.addFlashAttribute("msg", "Room Saved Successfully!");
	    return "redirect:/display";
	}
	
	@GetMapping("/display")
	public String getAllData(Model model) {
		
			List<Room> list=iRoomservice.getAllRoomData();
		model.addAttribute("empl", list);
		return "report";
	}
	
	// =================== LOAD UPDATE PAGE ===================
    @GetMapping("/room_update")
    public String updateRoom(@RequestParam("roomId") Integer roomId,
                             Model model) {

        Room room = iRoomservice.getRoomByNo(roomId);
        model.addAttribute("room", room);

        return "update";   // update.jsp
    }

    // =================== SAVE UPDATED DATA ===================
    @PostMapping("/emp_edit")
    public String updaeRoomdata(@ModelAttribute("room") Room room,
                                RedirectAttributes rt) {

        String msg = iRoomservice.updateRoom(room);
        rt.addFlashAttribute("smg", msg);

        return "redirect:/display";
    }
    @RequestMapping("/room_delete")
    public String deleteRoom(@RequestParam("roomId") int id) {
    	iRoomservice.deleteRoom(id);
        return "redirect:/display";
    }
}
