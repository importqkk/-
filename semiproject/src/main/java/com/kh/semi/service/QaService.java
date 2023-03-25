package com.kh.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.semi.dao.QaDao;
import com.kh.semi.dto.QaDto;

@Service
public class QaService {

	@Autowired
	private QaDao qaDao;
	
	//게시글 등록 서비스
	public int write(QaDto qaDto, List<Integer> attachmentNo) {
		int qaNo = qaDao.sequence();
		qaDto.setQaNo(qaNo);
		
		if(qaDto.isNew()) {
			qaDto.setQaGroup(qaNo);
		}
		else {
			QaDto parentDto = qaDao.selectOne(qaDto.getQaParent());
			qaDto.setQaGroup(parentDto.getQaGroup());
			qaDto.setQaDepth(parentDto.getQaDepth()+1);
		}
		
		//게시글 등록
		qaDao.insert(qaDto);
		
		//첨부파일번호 글번호 연결
		if(attachmentNo != null) {
			for(int no : attachmentNo) {
				qaDao.connect(qaNo, no);
			}
		}
		return qaNo;
	}
}
