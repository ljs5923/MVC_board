package com.js.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.js.board.dto.BoardDTO;
import com.js.board.dto.CommentDTO;
import com.js.board.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<CommentDTO> getCommentList(BoardDTO boardDTO) {
		return commentMapper.getCommentList(boardDTO);
	}
	
	@Override
	public int registerComment(CommentDTO commentDTO) {
		return commentMapper.registerComment(commentDTO);
	}
}
