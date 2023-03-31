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
			return ImgDto.builder()
								.imgNo(rs.getInt("img_no"))
								.imgName(rs.getString("img_Name"))
								.imgType(rs.getString("img_type"))
								.imgSize(rs.getLong("img_size"))
							.build();
		}	
	};
	
	// 파일 정보 등록
	public int sequence() {
		String sql = "select img_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
	
	public void insert(ImgDto imgDto) {
		String sql = "insert into img("
						+ "img_no, img_name,"
						+ "img_type, img_size) "
						+ "values(?,?,?,?)";
		Object[] param = {
				imgDto.getImgNo(),
				imgDto.getImgName(),
				imgDto.getImgType(),
				imgDto.getImgSize()
		};
		jdbcTemplate.update(sql,param);
	}
	
	public ImgDto selectOne(int imgNo) {
		String sql = "select * from img where img_no = ?";
		Object[] param = {imgNo};
		List<ImgDto> list = jdbcTemplate.query(sql, mapper,param);
		return list.isEmpty() ? null : list.get(0);
	}
	
	public List<ImgDto> selectList(){
		String sql = "select * from img";
		List<ImgDto> list = jdbcTemplate.query(sql, mapper);
		return list;
	}
	
	// 파일 삭제
	public boolean delete(int imgNo) {
		String sql = "delete img where img_no=?";
		Object[] param = {imgNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
}