package com.js.board.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.js.board.dto.MemberDTO;

@Repository // 현재 클래스를 dao bean으로 등록
public class MemberMapperImpl implements MemberMapper {
	@Inject
	SqlSession sqlSession; // SqlSession 의존관계 주입

	@Override
	public String loginCheck(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.js.board.mapper.MemberMapper.loginCheck", memberDTO);
	}

}
