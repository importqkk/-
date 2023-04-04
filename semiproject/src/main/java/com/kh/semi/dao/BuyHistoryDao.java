package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.BuyHistoryDto;

@Repository
public class BuyHistoryDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<BuyHistoryDto> mapper = new RowMapper<BuyHistoryDto>() {

		@Override
		public BuyHistoryDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return BuyHistoryDto.builder()
							.memberId(rs.getString("member_id"))
							.productNo(rs.getInt("product_no"))
					.build();
		}
		
		
	};
	
	//수정함
	public BuyHistoryDto selectBuy(String memberId, int productNo) {
		String sql = "select * from buy_history where member_id = ? and product_no = ?";
		Object[] param = {memberId, productNo};
		List<BuyHistoryDto> list = jdbcTemplate.query(sql, mapper, param);
		return list.isEmpty() ? null : list.get(0);
	}
}
