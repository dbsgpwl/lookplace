package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.TripMapper;
import com.look.model.Criteria;
import com.look.model.TripDTO;
import com.look.model.TripHeartDTO;
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
	public int localTotal(Criteria cri) {
		return mapper.localTotal(cri);
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

	@Override
	public int deleteReply(int reno) {
		return mapper.deleteReply(reno);
	}
	
	
	@Override
	public void updateReply(TripReplyDTO dto) {
		mapper.updateReply(dto);
	}

	@Override
	public void insertHeart(TripHeartDTO dto) {
		mapper.insertHeart(dto);
	}

	@Override
	public List<Integer> nickCheck(String nickname) {
		return mapper.nickCheck(nickname);
	}


	@Override
	public List<TripHeartDTO> getHeartList() {
		return mapper.getHeartList();
	}

	@Override
	public void unheart(TripHeartDTO dto) {
		 mapper.unheart(dto);
	}

	@Override
	public void PlusHeart(TripHeartDTO dto) {
		mapper.PlusHeart(dto);
	}

	@Override
	public void minusHeart(TripHeartDTO dto) {
		mapper.minusHeart(dto);
	}

	@Override
	public List<TripDTO> HitGetList(Criteria cri) {
		return mapper.HitGetList(cri);
	}

	@Override
	public List<TripDTO> autumnList() {
		return mapper.autumnList();
	}

	@Override
	public String hashtag(TripDTO dto) {
		return mapper.hashtag(dto);
	}







	



}
