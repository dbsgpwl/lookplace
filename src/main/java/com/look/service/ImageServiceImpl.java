package com.look.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.look.mapper.CommunityMapper;
import com.look.mapper.ImageMapper;
import com.look.model.Criteria;
import com.look.model.ImageDTO;
import com.look.model.CommunityDTO;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageMapper mapper;

	// 이미지 전체 목록 조회
	@Override
	public List<ImageDTO> viewAll() {
		return mapper.viewAll();
	}

	// 이미지 전체 목록 조회(페이징)
	@Override
	public List<ImageDTO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}

	// 게시물 총갯수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}

	// 상세 보기
	@Override
	public ImageDTO viewDetail(int bno) {
		return mapper.viewDetail(bno);
	}

	// 조회수 추가
	@Override
	public boolean plusCnt(int bno) {
		return mapper.plusCnt(bno);
	}

	// 이미지 등록
	@Override
	public int insertBoard(ImageDTO vo) {
		return mapper.insertBoard(vo);
	}

	// 삭제하기

	@Override
	public boolean deleteImage(int bno) {
		return mapper.deleteImage(bno);
	}

}
