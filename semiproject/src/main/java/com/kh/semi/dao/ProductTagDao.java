package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.ProductTagDto;

@Repository
public class ProductTagDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductTagDto> mapper = new RowMapper<ProductTagDto>() {
		@Override
		public ProductTagDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductTagDto.builder()
						.productNo(rs.getInt("product_no"))
						.tagNo(rs.getInt("tag_no"))
					.build();
		}
	};
	
	// 등록
	public void insert(ProductTagDto productTagDto) {
		String sql = "insert into product_tag values(?, ?)";
		Object[] param = {productTagDto.getProductNo(), productTagDto.getTagNo()};
		jdbcTemplate.update(sql, param);
	}
	
	// 수정
	public boolean edit(ProductTagDto productTagDto) {
		String sql = "update product_tag set tag_no=? where product_no=?";
		Object[] param = {productTagDto.getTagNo(), productTagDto.getProductNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// 조회
	public ProductTagDto selectOne(int productNo) {
		String sql = "select * from product_tag where product_no=?";
		Object[] param = {productNo};
		List<ProductTagDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
}
