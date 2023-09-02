package com.js.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.board.dto.MemberDTO;
import com.js.board.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginPageMove() throws Exception {
		return "/login/login";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginCheck(Model model, MemberDTO memberDTO, HttpSession session) throws Exception {
		String id = memberDTO.getUser_id();
		String pw = memberDTO.getUser_pw();
		String name = memberService.loginCheck(memberDTO, session);
		String errorMSG = "error";
		
		if (name != null) {
			return "redirect:/home";
		} else {			
			model.addAttribute("errorMSG", errorMSG);
			return "/login/login";
		}
	}
}
