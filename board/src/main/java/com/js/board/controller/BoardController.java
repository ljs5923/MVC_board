package com.js.board.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.js.board.dto.BoardDTO;
import com.js.board.dto.CommentDTO;
import com.js.board.service.BoardService;
import com.js.board.service.CommentService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/board/list", method = RequestMethod.POST)
	public String getList(Model model, BoardDTO boardDTO) throws Exception {
		int totalRowCount = boardService.getTotalRowCount(boardDTO);
		if (totalRowCount > 0) {
			boardDTO.setTotalRowCount(totalRowCount); //114
			boardDTO.pageSetting();
			List<BoardDTO> list = boardService.list(boardDTO);
			model.addAttribute("list", list);
		} else {
			model.addAttribute("list", new ArrayList<BoardDTO>()); // 이렇게 하면 0개짜리 리스트
		}		
		model.addAttribute("paging",boardDTO);
		return "/board/list";
	}
	
	@RequestMapping(value = "/board/form", method = RequestMethod.POST)
	public String writeView(Model model) throws Exception {
		model.addAttribute("write");
		return "/board/write";
	}	
	
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)
	public @ResponseBody int postList(BoardDTO insertData) throws Exception {		
		return boardService.postList(insertData);
	}
	
	@RequestMapping(value="/board/detail", method = RequestMethod.POST)
	public String getDetail(Model model, BoardDTO boardDTO) throws Exception {
		boardService.viewCount(boardDTO);
		BoardDTO detailInfo = boardService.getDetail(boardDTO);
		List<CommentDTO> commentList = commentService.getCommentList(boardDTO);
		model.addAttribute("detailInfo", detailInfo);
		model.addAttribute("commentList", commentList);
		System.out.println(commentList);
		return "/board/detail";
	}
	
	@RequestMapping(value="/board/delete", method = RequestMethod.POST)
	public String detailDelete(Model model, int board_num) throws Exception {
		boardService.deleteDetail(board_num);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/editPage", method = RequestMethod.POST)
	public String userEdit(Model model, BoardDTO boardDTO) throws Exception {
		BoardDTO detailInfo = boardService.getDetail(boardDTO);
		model.addAttribute("detailInfo", detailInfo);
		return "/board/edit";
	}
	
	@RequestMapping(value = "/board/edit", method = RequestMethod.POST)
	public @ResponseBody int editList(Model model, BoardDTO boardDTO) throws Exception {		
		return boardService.userEdit(boardDTO);
	}
}
