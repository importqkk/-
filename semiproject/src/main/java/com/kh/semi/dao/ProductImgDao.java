package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductImgDto;

@Repository
public class ProductImgDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductImgDto> mapper = new RowMapper<ProductImgDto>() {
		@Override
		public ProductImgDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductImgDto.builder()
						.productNo(rs.getInt("product_no"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	// 이미지 등록
	public void insert(ProductImgDto productImgDto) {
		String sql = "insert into product_img values(?, ?)";
		Object[] param = {productImgDto.getProductNo(), productImgDto.getImgNo()};
		jdbcTemplate.update(sql, param);
	}
	
	// 이미지 조회
	public ProductImgDto selectOne(int productNo) {
		String sql = "select * from product_img where productNo = ?";
		Object[] param = {productNo};
		List<ProductImgDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
	
}
