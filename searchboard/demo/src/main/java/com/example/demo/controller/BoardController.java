package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.PagingPgm;
import com.example.demo.model.Board;
import com.example.demo.service.BoardServiceImpl;


@Controller
public class BoardController {
	
   @Autowired
   private BoardServiceImpl boardServiceImpl;

	@RequestMapping("list.do")
	public String list(String pageNum, Board board, Model model) {
		
		/* 변수명에 page가 붙으면 하단 페이징,
		 * 변수명에 row가 붙으면 상단 데이터 부분(단, rowPerPage는 row의 데이터 부분을 따른다)
		 */

		/* 
		pageNum이란? [1] [2] [3] ... [10] 중 현재 선택된 페이지 값
		 */

		System.out.println(board);
		/* board로 넘어온 값이 없으면 null로 뜨지 에러가 나지 않는다 */

		/* totalCount를 가져오든지 list를 가져오든지 전부 board 자체를 넘기는데 board에 search와 keyword가 있기 때문에 mapper의 쿼리에서 like로 걸러주고 결과를 리턴한다. 그냥 DTO로 모든 값을 넘기고 쿼리문에서 모든 걸 처리 */

		int currentPage = 1;
		if(pageNum != null && !pageNum.equals("") ) {
			currentPage = Integer.parseInt(pageNum);
		}

		final int rowPerPage = 10; //화면에 출력할 데이터 갯수
		
		//데이터 출력 row 값들
		int total = boardServiceImpl.getCount(board);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		
		
		//하단 페이지 부분 - 클래스로 만듦
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		
		/*
		화면 출력 번호 - 보여지는 임의의 수
		: 최신 글이 가장 처음으로 위치, desc로 정렬 상태
		전체 글 23개
		startRow : 1 => 23
		startRow : 11 => 13
		startRow : 21 => 3
		*/
		int no = total - startRow + 1;

		//list가져오기
		List<Board> list = boardServiceImpl.getList(board);

		System.out.println("list:"+list);

		model.addAttribute("list",list);
		model.addAttribute("pp",pp);
		model.addAttribute("no",no);
		model.addAttribute("search",board.getSearch());
		model.addAttribute("keyword",board.getKeyword());


		return "list2";
	}
}
