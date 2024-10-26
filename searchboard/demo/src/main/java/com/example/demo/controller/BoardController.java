package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Board;
import com.example.demo.service.BoardServiceImpl;


@Controller
public class BoardController {
	
   @Autowired
   private BoardServiceImpl service;

	@RequestMapping("list.do")
	public String list(String pageNum, Board board, Model model) {
		
		System.out.println(board);

		/* totalCount를 가져오든지 list를 가져오든지 전부 board 자체를 넘기는데 board에 search와 keyword가 있기 때문에 mapper의 쿼리에서 like로 걸러주고 결과를 리턴한다. 그냥 DTO로 모든 값을 넘기고 쿼리문에서 모든 걸 처리 */

		final int rowPage = 10; //화면에 출력할 데이터 갯수
		
		int currentPage = 1;
		if(pageNum != null && !pageNum.equals("") ) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		//int total = boardServiceImpl.getCount();
		
		return "";
	}
}
