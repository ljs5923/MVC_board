package com.js.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.js.board.dto.BoardDTO;
import com.js.board.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainMapper mainMapper;
	
	@Override
	public List<BoardDTO> viewCountListDesc(BoardDTO boardDTO) {
		return mainMapper.viewCountListDesc(boardDTO);
	}
	
	@Override
	public List<BoardDTO> commentCountListDesc(BoardDTO boardDTO) {
		List<BoardDTO> commentCountList = mainMapper.commentCountListDesc(boardDTO);		
		int commentRankingSize = 5;
		int listSize = commentCountList.size();
		if (listSize < commentRankingSize + 1) {
			for (int i = 0; i < (commentRankingSize - listSize); i++) {
				BoardDTO tempBoard = new BoardDTO();
				tempBoard.setBoard_num(-1);
				tempBoard.setBoard_title("댓글이 등록된 게시물이 없습니다.");
				commentCountList.add(tempBoard);				
			}		
		}
		return commentCountList;
	}
}
