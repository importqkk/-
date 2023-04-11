package com.kh.semi.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.kh.semi.dto.SellListDto;
import com.kh.semi.vo.ProductListPaginationVo;
import com.kh.semi.vo.SellListPaginationVo;

@Repository
public class SellListDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<SellListDto> mapper = new RowMapper<SellListDto>() {
		@Override
		public SellListDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return SellListDto.builder()
						.orderNo(rs.getInt("order_no"))
						.orderDate(rs.getDate("order_date"))
						.orderStat(rs.getString("order_stat"))
						.memberId(rs.getString("member_id"))
						.productNo(rs.getInt("product_no"))
						.productCount(rs.getInt("product_count"))
						.productPrice(rs.getInt("product_price"))
						.productName(rs.getString("product_name"))
						.productBrand(rs.getString("product_brand"))
					.build();
		}
	};
	
	// 판매 목록
	public List<SellListDto> list(SellListPaginationVo vo) {
		if(vo.isSearch()) {
			String sql = "select * from ("
							+ "select TMP.*, rownum RN from ("
								+ "select * from sell_list where instr(#1, ?) > 0 "
								+ "order by order_date desc"
							+ ")TMP"
						+ ") where RN between ? and ?";
			sql = sql.replace("#1", vo.getColumn());
			Object[] param = {vo.getKeyword(), vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, mapper, param);
		}
		else {
			String sql = "select * from ("
							+ "select TMP.*, rownum RN from ("
								+ "select * from sell_list "
								+ "order by order_date desc"
							+ ")TMP"
						+ ") where RN between ? and ?";
			Object[] param = {vo.getBegin(), vo.getEnd()};
			return jdbcTemplate.query(sql, mapper, param);
		}
	}
	
	// 전체 판매 기록 개수
	public int selectCount(SellListPaginationVo vo) {
		// 검색
		if(vo.isSearch()) {
			String sql = "select count(*) from sell_list where instr(#1, ?) > 0";
			sql = sql.replace("#1", vo.getColumn());
			Object[] param = {vo.getKeyword()};
			return jdbcTemplate.queryForObject(sql, int.class, param);
		}
		// 목록
		else {
			String sql = "select count(*) from sell_list";
			return jdbcTemplate.queryForObject(sql, int.class);
		}
	}
	
}
