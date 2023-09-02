package com.js.board.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class MemberDTO {
	private int user_num;
	private String user_id;
	private String user_pw;
	private String user_addr;
	private String user_tell;
	private String user_join_date;
	private String user_email;
	
	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_tell() {
		return user_tell;
	}

	public void setUser_tell(String user_tell) {
		this.user_tell = user_tell;
	}

	public String getUser_join_date() {
		return user_join_date;
	}

	public void setUser_join_date(String user_join_date) {
		this.user_join_date = user_join_date;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
