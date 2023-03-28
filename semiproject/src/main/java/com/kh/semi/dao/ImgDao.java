package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ImgDto;

@Repository
public class ImgDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ImgDto> mapper = new RowMapper<ImgDto>() {
		@Override
		public ImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
//			[1] 일반(기존) 방식
//			AttachmentDto attachmentDto = new AttachmentDto();
//			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
//			attachmentDto.setAttachmentName(rs.getString("attachment_name"));
//			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
//			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));
//			return attachmentDto;
			
//			[2] Builder Pattern(Lombok 제공) 
			return ImgDto.builder()
									.imgNo(rs.getInt("img_no"))
									.imgName(rs.getString("img_name"))
									.imgType(rs.getString("img_type"))
									.imgSize(rs.getLong("img_size"))
								.build();
		}
	};
	
//	파일 정보 등록
//	- 시퀀스를 insert에서 만들것인지 아니면 미리 생성할 것인지 판단
//	- 번호를 insert를 제외한 코드에서 사용하려면 분할, 아니면 통합
	
	public int sequence() {
		String sql = "select img_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	public void insert(ImgDto imgDto) {
		String sql = "insert into img("
							+ "img_no, img_name, "
							+ "img_type, img_size "
						+ ") values(?, ?, ?, ?)";
		Object[] param = {
			imgDto.getImgNo(), imgDto.getImgName(),
			imgDto.getImgType(), imgDto.getImgSize()
		};
		jdbcTemplate.update(sql, param);
	}
	
//	상세 조회 구현
	public ImgDto selectOne(int imgNo) {
		String sql = "select * from img where img_no = ?";
		Object[] param = {imgNo};
		List<ImgDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}


}
