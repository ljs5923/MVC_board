package com.js.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.js.board.dto.BoardDTO;

@Repository
@Mapper
public interface BoardMapper {
	public List<BoardDTO> getList(BoardDTO boardDTO);
	public int postList(BoardDTO boardDTO);
	public BoardDTO getDetail(BoardDTO boardDTO);
	public void deleteDetail(int board_num);
	public int userEdit(BoardDTO boardDTO);
	public int getTotalRowCount(BoardDTO boardDTO);
	public int viewCount(BoardDTO boardDTO);
}
