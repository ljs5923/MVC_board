package com.js.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.js.board.dto.BoardDTO;
import com.js.board.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, BoardDTO boardDTO) throws Exception {
		List<BoardDTO> rankingList = mainService.viewCountListDesc(boardDTO);
		List<BoardDTO> commentRankingList = mainService.commentCountListDesc(boardDTO);
		model.addAttribute("rankingList", rankingList);
		model.addAttribute("commentRankingList", commentRankingList);
		return "/main/home";
	}	
}
