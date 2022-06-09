package com.shop.board.vo;

public class BoardVO {
	
	private String board_idx;
	private String board_title;
	private String board_content;
	private String board_type;
	private String user_idx;
	private String write_date;
	private String user_id;
	private String board_file_path;
	private String board_real_file;
	private String search_string;
	private String search_field;
	
	
	private int start_row;
	private int end_row;
	
	
	

	
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
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
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_file_path() {
		return board_file_path;
	}
	public void setBoard_file_path(String board_file_path) {
		this.board_file_path = board_file_path;
	}
	public String getBoard_real_file() {
		return board_real_file;
	}
	public void setBoard_real_file(String board_real_file) {
		this.board_real_file = board_real_file;
	}
	public String getSearch_string() {
		return search_string;
	}
	public void setSearch_string(String search_string) {
		this.search_string = search_string;
	}
	public String getSearch_field() {
		return search_field;
	}
	public void setSearch_field(String search_field) {
		this.search_field = search_field;
	}
	public int getStart_row() {
		return start_row;
	}
	public void setStart_row(int start_row) {
		this.start_row = start_row;
	}
	public int getEnd_row() {
		return end_row;
	}
	public void setEnd_row(int end_row) {
		this.end_row = end_row;
	}
	
	
	
}
