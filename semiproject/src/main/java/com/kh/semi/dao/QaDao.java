package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.QaDto;
import com.kh.semi.vo.QaPaginationVO;


@Repository
public class QaDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<QaDto>mapper = new RowMapper<QaDto>() {

		@Override
		public QaDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			QaDto qaDto = new QaDto();
			qaDto.setQaNo(rs.getInt("qa_no"));
			qaDto.setQaTitle(rs.getString("qa_title"));
			qaDto.setMemberId(rs.getString("member_id"));
			qaDto.setQaContent(rs.getString("qa_content"));
			qaDto.setQaAnswer(rs.getString("qa_answer"));
			qaDto.setQaHead(rs.getString("qa_head"));
			qaDto.setQaSecret(rs.getInt("qa_secret"));
			qaDto.setQaGroup(rs.getInt("qa_group"));
			qaDto.setQaDate(rs.getDate("qa_date"));
			qaDto.setQaRead(rs.getInt("qa_read"));
			
			qaDto.setQaParent(rs.getObject("qa_parent") == null ? 
					null : rs.getInt("qa_parent"));
			qaDto.setQaDepth(rs.getInt("qa_depth"));
			return qaDto;
		}
	};
	
	// QA게시판에 공지사항만 조회
//		public List<QaDto> selectNoticeList(int begin, int end){
//			String sql = "select * from ("
//							+ "select rownum rn, TMP.* from ("
//							+ "select * from qa where qa_head='공지' "
//							+ "order by qa_no desc"
//						+ ")TMP"
//					+ ") where rn between ? and ?";
//			Object[] param = {begin, end};
//			return jdbcTemplate.query(sql, mapper, param);
//		}
	
	public List<QaDto>selectList(){
		String sql = "select * from qa "
				+ "connect by prior qa_no=qa_parent "
				+ "start with qa_parent is null "
				+ "order siblings by qa_group desc, qa_no asc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	public List<QaDto> selectList(String column, String keyword) {
		String sql = "select * from qa "
						+ "where instr(#1, ?) > 0 "
						+ "connect by prior qa_no=qa_parent "
						+ "start with qa_parent is null "
						+ "order siblings by qa_group desc, qa_no asc";
		sql = sql.replace("#1", column);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	public QaDto selectOne(int qaNo) {
		String sql = "select * from qa where qa_no = ?";
		Object[] param = {qaNo};
		List<QaDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
//	번호를 생성하면서 등록하는 방법
//	1. 시퀀스 번호를 듀얼 테이블을 사용하여 조회
//	2. 생성된 번호까지 설정한 DTO를 등록
	public int sequence() {
		String sql = "select qa_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	//이 기능은 새글 답글 관계없이 동일하게 구현
	public void insert(QaDto qaDto) {
		String sql = "insert into qa("
				+ "qa_no, qa_title, member_id, qa_content, qa_answer,"
				+ "qa_head, qa_secret, qa_group, qa_parent, qa_depth,"
				+ "qa_date, qa_read)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, 0)";
		Object[] param = {
			qaDto.getQaNo(), qaDto.getQaTitle(),
			qaDto.getMemberId(), qaDto.getQaContent(),
			qaDto.getQaAnswer(),qaDto.getQaHead(),
			qaDto.getQaSecret(), qaDto.getQaGroup(),
			qaDto.getQaParent(), qaDto.getQaDepth(),
			qaDto.getQaDate(),
			qaDto.getQaRead()
		};
		jdbcTemplate.update(sql, param);
	}
	
	public boolean delete(int qaNo) {
		String sql = "delete qa where qa_no = ?";
		Object[] param = {qaNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//게시글 수정
	public boolean update(QaDto qaDto) {
		String sql = "update qa "
						+ "set qa_head=?, qa_title=?, qa_content=? "
						+ "where qa_no = ?";
		Object[] param = {
			qaDto.getQaHead(), qaDto.getQaTitle(),
			qaDto.getQaContent(), qaDto.getQaNo()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//조회수
	public boolean updateReadCount(int qaNo) {
		String sql = "update qa ser qa_read = qa_read+1"
				+ "where qa_no = ?";
		Object[] param = {qaNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	
//	페이징 적용된 조회 및 카운트
	public int selectCount(QaPaginationVO vo) {
		if(vo.isSearch()) {//검색
			String sql = "select count(*) from qa where instr(#1, ?) > 0";
			sql = sql.replace("#1", vo.getColumn());
			Object[] param = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
		else {//목록
			String sql = "select count(*) from qa";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	
//	public List<QaDto> selectList(QaPaginationVO vo) {
//		if(vo.isSearch()) {//검색
//			String sql = "select * from ("
//							+ "select rownum rn, TMP.* from ("
//								+ "select * from qa "
//								+ "where instr(#1, ?) > 0 "
//								+ "connect by prior qa_no=qa_parent "
//								+ "start with qa_parent is null "
//								+ "order siblings by qa_group desc, qa_no asc"
//							+ ")TMP"
//						+ ") where rn between ? and ?";
//			sql = sql.replace("#1", vo.getColumn());
//			Object[] param = {vo.getKeyword(), vo.getBegin(), vo.getEnd()};
//			return jdbcTemplate.query(sql, mapper, param);
//		}
//		else {//목록
//			String sql = "select * from ("
//								+ "select rownum rn, TMP.* from ("
//									+ "select * from qa "
//									+ "connect by prior qa_no=qa_parent "
//									+ "start with qa_parent is null "
//									+ "order siblings by qa_group desc, qa_no asc"
//								+ ")TMP"
//							+ ") where rn between ? and ?";
//			Object[] param = {vo.getBegin(), vo.getEnd()};
//			return jdbcTemplate.query(sql, mapper, param);
//		}
//	}
	
	//댓글 개수 갱신
	public void updateReplycount(int qaNo) {
		String sql = "update qa "
						+ "set qa_reply = ("
							+ "select count(*) from reply where reply_origin = ?"
						+ ") "
					+ "where qa_no = ?";
		Object[] param = {qaNo, qaNo};
		jdbcTemplate.update(sql, param);
	}

//	 //첨부파일
//	public void connect(int qaNo, int attachmentNo) {
//		String sql = "insert into qa_attachment values(?, ?)";
//		Object[] param = {qaNo, attachmentNo};
//		jdbcTemplate.update(sql, param);
//	}
	
	
}
