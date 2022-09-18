package com.look.service;

import java.util.List;

import com.look.model.Criteria;
import com.look.model.TripDTO;

public interface TripService {

	public List<TripDTO> getList();
	
	public List<TripDTO> locationList(Criteria cri);
	
	public int localTotal();
	
	public List<TripDTO> localListPaging(Criteria cri);

	public TripDTO Detailpage(int imgno);
	
	public int updateCount(int imgno);
}
