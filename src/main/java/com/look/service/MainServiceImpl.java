package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.MainMapper;
import com.look.model.TripDTO;
@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainMapper mapper;
	
	@Override
	public List<TripDTO> getList() {
		return mapper.getList();
	}

}	
