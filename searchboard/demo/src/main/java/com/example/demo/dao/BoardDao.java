package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Board;

@Mapper
public interface BoardDao {

   int getCount(Board board);
   List<Board> getList(Board board);
}
