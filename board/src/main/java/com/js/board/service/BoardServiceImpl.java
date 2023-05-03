package com.js.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.js.board.dto.BoardDTO;
import com.js.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardDTO> list(BoardDTO boardDTO) {
		return boardMapper.getList(boardDTO);
	}
	
	@Override
	public int postList(BoardDTO boardDTO) {
		int temp = boardMapper.postList(boardDTO);
		System.out.println("### " + temp);
		return temp;
	}
	
	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) {
		return boardMapper.getDetail(boardDTO);
	}
	
	@Override
	public void deleteDetail(int board_num) {
		boardMapper.deleteDetail(board_num);
	}
	
	@Override
	public int userEdit(BoardDTO boardDTO) {
		return boardMapper.userEdit(boardDTO);
	}
	
	@Override
	public int getTotalRowCount(BoardDTO boardDTO) {
		return boardMapper.getTotalRowCount(boardDTO);
	}
	
	@Override
	public int viewCount(BoardDTO boardDTO) {
		return boardMapper.viewCount(boardDTO);
	}
}
