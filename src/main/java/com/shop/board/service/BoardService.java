package com.shop.board.service;

import java.util.List;

import com.shop.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> listBoard(BoardVO boardVO) throws Exception ;

	public void Board_insert(BoardVO boardVO) throws Exception ;
	public BoardVO selectBoardView(BoardVO boardVO) throws Exception ;

	public void Board_delete(BoardVO boardVO) throws Exception ;

	public void Board_update(BoardVO boardVO) throws Exception ;
	
	// �Խù� �� ����
	int countBoard() throws Exception ;

	// list select -> result VO
	// update, insert, delete -> result null = void
	
}
