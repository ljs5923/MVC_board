package com.js.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.js.board.dto.BoardDTO;

@Repository
@Mapper
public interface MainMapper {
	public List<BoardDTO> viewCountListDesc(BoardDTO boardDTO);
	public List<BoardDTO> commentCountListDesc(BoardDTO boardDTO);
}
