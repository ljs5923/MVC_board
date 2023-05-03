package com.js.board.service;

import java.util.List;

import com.js.board.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> list(BoardDTO boardDTO) throws Exception;
	public int postList(BoardDTO boardDTO) throws Exception;
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception;
	public void deleteDetail(int board_num) throws Exception;
	public int userEdit(BoardDTO boardDTO) throws Exception;
	public int getTotalRowCount(BoardDTO boardDTO) throws Exception;
	public int viewCount(BoardDTO boardDTO) throws Exception;	
}
