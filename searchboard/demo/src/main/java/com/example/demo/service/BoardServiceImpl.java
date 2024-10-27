package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.BoardDao;
import com.example.demo.model.Board;


@Service
public class BoardServiceImpl {

   @Autowired
   private BoardDao dao;

   public int getCount(Board board) {
      return dao.getCount(board);
   }

   public List<Board> getList(Board board) {
      return dao.getList(board);
   }

  


}
