package com.js.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.js.board.dto.BoardDTO;
import com.js.board.dto.CommentDTO;

@Repository
@Mapper
public interface CommentMapper {
	public List<CommentDTO> getCommentList(BoardDTO boardDTO);
	public int registerComment(CommentDTO commentDTO);
}
