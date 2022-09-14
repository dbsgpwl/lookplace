package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.TripMapper;
import com.look.model.Criteria;
import com.look.model.TripDTO;


@Service
public class TripServiceImpl implements TripService{
	@Autowired
	private TripMapper mapper;

	@Override
	public List<TripDTO> getList() {
		return mapper.getList();
	}

	@Override
	public List<TripDTO> locationList(Criteria cri) {
		return mapper.locationList(cri);
	}

}
