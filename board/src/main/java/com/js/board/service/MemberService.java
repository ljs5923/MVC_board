package com.js.board.service;

import javax.servlet.http.HttpSession;

import com.js.board.dto.MemberDTO;

public interface MemberService {
	public String loginCheck(MemberDTO memberDTO, HttpSession session);
	public void logout(HttpSession session);
}
