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
		
		return "";
	}
}
