package com.yun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yun.domain.BoardVO;
import com.yun.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> viewAll() {
		return mapper.viewAll();
	}

}

