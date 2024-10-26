package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.model.Board;

@Service
public class BoardServiceImpl {
	@Autowired
	private BoardDao bd;
	
	public List<Board> list(Board board) {
		return bd.list(board);
	}
	
	public int getTotal(Board board) {
		return bd.getTotal(board);
	}
	
	public int insert(Board board) {
		return bd.insert(board);
	}
	
	public Board select(int num) {
		return bd.select(num);
	}
	
	public void selectUpdate(int num) {
		bd.selectUpdate(num);
	}
	
	public int update(Board board) {
		return bd.update(board);
	}
	
	public int delete(int num) {
		return bd.delete(num);
	}
	
	public int getMaxNum() {
		return bd.getMaxNum();
	}
	
	public void updateRe(Board board) {
		bd.updateRe(board);
	}
}