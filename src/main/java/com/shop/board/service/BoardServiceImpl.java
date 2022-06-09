package com.shop.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.shop.board.dao.BoardDAO;
import com.shop.board.vo.BoardVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	public List<BoardVO> listBoard(BoardVO boardVO) throws Exception {
		List<BoardVO> boardList = boardDAO.selectAllBoardList(boardVO);
		return boardList;
	}

	@Override
	public void Board_insert(BoardVO boardVO) throws Exception {
		boardDAO.Board_insert(boardVO);
	}

	@Override
	public BoardVO selectBoardView(BoardVO boardVO) throws Exception {
		return boardDAO.selectBoardView(boardVO);
	}

	@Override
	public void Board_delete(BoardVO boardVO) throws Exception {
		boardDAO.Board_delete(boardVO);
	}

	@Override
	public void Board_update(BoardVO boardVO) throws Exception {
		boardDAO.Board_update(boardVO);
	}
	
	@Override
	public int countBoard() throws Exception {
		return boardDAO.countBoard();
	}

}
