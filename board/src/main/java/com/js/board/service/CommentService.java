package com.js.board.service;

import java.util.List;

import com.js.board.dto.BoardDTO;
import com.js.board.dto.CommentDTO;

public interface CommentService {
	public List<CommentDTO> getCommentList(BoardDTO boardDTO) throws Exception;
	public int registerComment(CommentDTO commentDTO) throws Exception;
}