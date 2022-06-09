package com.shop.board.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.shop.board.service.BoardService;
import com.shop.board.vo.BoardVO;
import com.shop.board.vo.PagingVO;
import com.shop.member.vo.MemberVO;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/board.do")
	public String Board_List(@ModelAttribute("BoardVO") BoardVO boardVO,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam(value="nowPage", required=false)String nowPage) throws Exception {
		

		int total = boardService.countBoard();
		
		if (nowPage == null) {
			nowPage = "1";
		}
		
		PagingVO pagingVO = new PagingVO(total, Integer.parseInt(nowPage), 10);
		
		boardVO.setStart_row(pagingVO.getStart()-1);
		boardVO.setEnd_row(pagingVO.getEnd());
		
		List<BoardVO> boardList = boardService.listBoard(boardVO);
		
		model.addAttribute("paging", pagingVO);
		model.addAttribute("total", total);
		model.addAttribute("boardList", boardList);
		
		HttpSession session = request.getSession();
		model.addAttribute("session", session);
		
		return "/board/listBoard";
		
	}

	@RequestMapping(value="/addBoard.do")
	public String addBoard(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		 
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		if(memberVO == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�α��� ���Ŀ� ��� �����մϴ�'); location.href='/member/login.do';</script>");
			out.flush();

		}
		
		model.addAttribute("userIdx", memberVO.getUser_idx());
		
		return "/board/addBoard";
	}
		
	@RequestMapping(value="/Board_insert.do")
	public ModelAndView Board_insert(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

		//��μ���
		String uploadPath = "D:/board_project/board/src/main/webapp/resources/upload/";
		String downloadPath = "../resources/upload/";
		
		// ���丮 ����
		int size = 50*1024*1024;
		File file = new File(uploadPath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		//�����
		int seq = 1;
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String filename = null;
		String storefilename = null;
		
		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				filename = multipartFile.getOriginalFilename();
				
				String orign_ext = filename.substring(
						filename.lastIndexOf(".")).toLowerCase();
	        	
	        		 
	                Calendar calendar = Calendar.getInstance();
	                java.util.Date date = calendar.getTime();
	                String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));

	                storefilename = today + seq  + orign_ext;
	                seq++;
	                
	                file = new File(uploadPath + storefilename); 
	                multipartFile.transferTo(file);
	                
	                boardVO.setBoard_real_file(filename);
	                boardVO.setBoard_file_path(downloadPath+storefilename);
			}
		}
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		ModelAndView mav = new ModelAndView();
		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
		mav.setView(jsonView);
		
		boardVO.setUser_idx(memberVO.getUser_idx());
		boardService.Board_insert(boardVO);
		
		return mav;
	}
	
	/* �� ������ */
	@RequestMapping(value="/boardView.do", method = RequestMethod.POST)
	public String Board_View(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		String board_idx = request.getParameter("board_idx");
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_idx(board_idx);
		BoardVO boardView = boardService.selectBoardView(boardVO);
	
		model.addAttribute("boardView", boardView);
		return "/board/boardView";
	}
	
	/* ���� ������ */
	@RequestMapping(value="/boardUpdate.do", method = RequestMethod.POST)
	public String BoardUpdate(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		String board_idx = request.getParameter("board_idx");
		BoardVO boardVO = new BoardVO();
		boardVO.setBoard_idx(board_idx);
		BoardVO boardView = boardService.selectBoardView(boardVO);
		
		
		model.addAttribute("boardView", boardView);
		return "/board/updateBoard";
	}
	
	/* ���� ��� */
	@RequestMapping(value="/Board_update.do")
	public ModelAndView board_Update(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		ModelAndView mav = new ModelAndView();
		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
		mav.setView(jsonView);
		
		
		boardVO.setUser_idx(memberVO.getUser_idx());
		boardService.Board_update(boardVO);
		

		return mav;
	}
	
	/* ���� ��� */
	@RequestMapping(value="/Board_delete.do")
	public ModelAndView board_Delete(@ModelAttribute BoardVO boardVO, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = new MemberVO();
		memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		ModelAndView mav = new ModelAndView();
		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
		mav.setView(jsonView);
		
		boardVO.setUser_idx(memberVO.getUser_idx());
		boardService.Board_delete(boardVO);

		return mav;
	}
	
	
	
	// 1. controller -> service -> impl -> dao ������ �����
	
	// 2. �������� ���� �Խ����� �����.
//	@RequestMapping(value="/url", method = RequestMethod.GET)
//	public String ������(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		// @ModelAttribute()  == model.addAttribute() == mav.addObject()  java -> jsp�� �����͸� ������
		// @RequestParam()   == request.getPrameter(); jsp -> java�� �����͸� �����ö�
		
		// 3. select board �Խ����� query�� �ҷ��� �����´�.
		// List<BoardVO> boardList = new List<BoardVO>;
		// boardList = boardService.selectList(boardVO); ���� ������ �ް�
		// model.addAttribute("boardList", boardList); jsp �� �����Ѵ�.
		
//		return "jsp���";
	
	// 4. �������� ��� �Խ����� �����.
	/*@RequestMapping(value="/url", method = RequestMethod.GET)
	public String ���(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		return "jsp���";
	}*/
	
	// 5. ��� ����� �����.
	// CR <- create read �ϼ�
	
	// 6. �������� ���� �Խ����� �����.
	/*@RequestMapping(value="/url", method = RequestMethod.GET)
	public String ���(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		// 7. �� ��ȸ ����� �����. selectOne
		
		
		return "jsp���";
	}*/
	// 7. ��������� �����.
	
	// 8. �� ȭ���� �����.
	
	// 9. ���� ����� �����. (�� ȭ�鿡�� ����°� ��õ�� ���� ��.jsp���� ���� ��ư �߰��ϰ� Ŭ���ϸ�
	// ����� �����ؼ� ���� �ٷεǰ�)
	

}