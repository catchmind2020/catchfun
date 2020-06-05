package com.catchmind.catchfun.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.catchmind.catchfun.main.model.service.MainService;
import com.catchmind.catchfun.main.model.vo.Main;

@Controller
public class MainController {
	
	@Autowired
	private MainService maService;
	
	
	@RequestMapping("main.mu")
	public String projectMain(Model model) {
		
		ArrayList<Main> list = maService.mainSpotlightList();
		
	
		model.addAttribute("list", list);
		return "main";
	}


}
