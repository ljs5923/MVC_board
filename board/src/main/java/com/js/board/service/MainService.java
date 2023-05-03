package com.js.board.service;

import java.util.List;

import com.js.board.dto.BoardDTO;

public interface MainService {
	public List<BoardDTO> viewCountListDesc(BoardDTO boardDTO) throws Exception;
	public List<BoardDTO> commentCountListDesc(BoardDTO boardDTO) throws Exception;
}
