package com.js.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.js.board.dto.CommentDTO;
import com.js.board.service.CommentServiceImpl;

@Controller
public class CommentController {
	@Autowired
	
	private CommentServiceImpl commentService;
	
	@ResponseBody
	@RequestMapping(value="/comment/write", method = RequestMethod.POST)
	public int registerComment(CommentDTO commentDTO) throws Exception {
		return commentService.registerComment(commentDTO);
//		return "redirect:/board/detail?board_num=" + commentDTO.getBoard_num();
	}
}
