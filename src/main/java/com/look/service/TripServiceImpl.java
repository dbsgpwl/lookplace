package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.TripMapper;
import com.look.model.Criteria;
import com.look.model.TripDTO;
import com.look.model.TripReplyDTO;


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

	@Override
	public int localTotal() {
		return mapper.localTotal();
	}

	@Override
	public List<TripDTO> localListPaging(Criteria cri) {
		return mapper.localListPaging(cri);
	}

	@Override
	public TripDTO Detailpage(int imgno) {
		return mapper.Detailpage(imgno);
	}

	@Override
	public int updateCount(int imgno) {
		return mapper.updateCount(imgno);
	}

	@Override
	public List<TripReplyDTO> replyList(int imgno) {
		return mapper.replyList(imgno);
	}

	@Override
	public void insertList(TripReplyDTO dto) {
		mapper.insertList(dto);
	}

}
