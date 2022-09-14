package com.look.mapper;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.TripDTO;

public interface TripMapper {
	
	public List<TripDTO> getList();


	public List<TripDTO> locationList(Criteria cri);	
	
}
