package com.js.board.dto;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class BoardDTO extends PagingDTO  {
	private int board_num;
	private String board_title;
	private String board_content;
	private String board_writer;
	private String board_date;
	private String delete_status;
	private int view_count;
	private String title_keyword;
	private String wirter_keyword;
	private int diff_date;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getDelete_status() {
		return delete_status;
	}
	public void setDelete_status(String delete_status) {
		this.delete_status = delete_status;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getTitle_keyword() {
		return title_keyword;
	}
	public void setTitle_keyword(String title_keyword) {
		this.title_keyword = title_keyword;
	}
	public String getwirter_keyword() {
		return wirter_keyword;
	}
	public void setwirter_keyword(String wirter_keyword) {
		this.wirter_keyword = wirter_keyword;
	}
	public int getDiff_date() {
		return diff_date;
	}
	public void setDiff_date(int diff_date) {
		this.diff_date = diff_date;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
}
