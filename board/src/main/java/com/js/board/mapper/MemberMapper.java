package com.js.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.js.board.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	public String loginCheck(MemberDTO memberDTO);
}
