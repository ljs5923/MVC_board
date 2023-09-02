package com.js.board.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.js.board.dto.MemberDTO;
import com.js.board.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberMapper memberMapper;

	@Override
	public String loginCheck(MemberDTO memberDTO, HttpSession session) {
		String name = memberMapper.loginCheck(memberDTO);
		System.out.println(name);
		if (name != null) { // 세션 변수 저장
			session.setAttribute("user_id", memberDTO.getUser_id());
			session.setAttribute("name", name);
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}
}
