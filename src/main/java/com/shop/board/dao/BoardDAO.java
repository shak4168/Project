package com.shop.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shop.board.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> selectAllBoardList(BoardVO boardVO) throws Exception {
		List<BoardVO> boardList = sqlSession.selectList("mapper.board.selectAllBoardList", boardVO);
		
	return boardList;
	}


	public BoardVO selectBoardView(BoardVO boardVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectBoardView", boardVO);
	}
	
	public void updateBoard(BoardVO boardVO) throws DataAccessException {
		sqlSession.selectOne("mapper.board.updateBoard", boardVO);
	}
	

	public void Board_insert(BoardVO boardVO) throws DataAccessException {
		sqlSession.insert("mapper.board.Board_insert", boardVO);
	}


	public void Board_delete(BoardVO boardVO) throws DataAccessException{
		sqlSession.update("mapper.board.Board_delete", boardVO);

	}

	public void Board_update(BoardVO boardVO) throws DataAccessException{
		sqlSession.update("mapper.board.Board_update", boardVO);

	}
	public int countBoard() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.countBoard", "");
	}
	
}
