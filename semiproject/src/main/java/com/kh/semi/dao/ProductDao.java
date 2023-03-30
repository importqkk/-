package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ProductInfoDto;

@Repository
public class ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductInfoDto> mapper = new RowMapper<ProductInfoDto>() {
		@Override
		public ProductInfoDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductInfoDto.builder()
						.productNo(rs.getInt("product_no"))
						.productBrand(rs.getString("product_brand"))
						.productName(rs.getString("product_name"))
						.productPrice(rs.getInt("product_price"))
						.productSellCount(rs.getInt("product_sell_count"))
						.productJoin(rs.getDate("product_join"))
						.reivewAVG(rs.getFloat("avg"))
						.reivewCNT(rs.getInt("cnt"))
						.imgNo(rs.getInt("img_no"))
					.build();
		}
	};
	
	
	// 상품 번호로 상품 정보 불러오기
		public ProductInfoDto selectOne(int productNo) {
			String sql = "select * from product_info where product_no=?";
			Object[] param = {productNo};
			List<ProductInfoDto> list = jdbcTemplate.query(sql,mapper,param);
			return list.isEmpty() ? null:list.get(0);
	}
	
	// 상품 전체 리스트 
	public List<ProductInfoDto> selectAll(){ // 전체
		String sql = "select * from product_info";
		List<ProductInfoDto> list = jdbcTemplate.query(sql,mapper);
		return list.isEmpty() ? null:list;
	} 
	public List<ProductInfoDto> bestAll(){// 인기순(판매순)
		String sql = "select * from product_info order by product_sell_count desc, product_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	public List<ProductInfoDto> newAll(){ // 최신순
		String sql = "select * from product_info order by product_Join desc";
		return jdbcTemplate.query(sql, mapper);
	}
	public List<ProductInfoDto> cheapAll(){// 낮은 가격순 
		String sql = "select * from product_info order by product_price asc, product_no desc";
		return jdbcTemplate.query(sql, mapper); 
	}
	public List<ProductInfoDto> expensiveAll(){// 높은 가격순  
		String sql = "select * from product_info order by product_price desc, product_no desc";
		return jdbcTemplate.query(sql, mapper); 
	}
	
	
	
	// 태그1111111111111111111111111111111111111111111111111
	public List<ProductInfoDto> bestTag1(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag1(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=1 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag1(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag1(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=1 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
	
	// 태그111111111111111111111111111111111111111111111111111
	
	
	
	// 태그222222222222222222222222222222222222222222222222222
	public List<ProductInfoDto> bestTag2(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag2(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=2 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag2(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag2(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=2 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
	// 태그222222222222222222222222222222222222222222222222222
	
	
	// 태그333333333333333333333333333333333333333333333333333
	public List<ProductInfoDto> bestTag3(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag3(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=3 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag3(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag3(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=3 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그333333333333333333333333333333333333333333333333333
	
	
	
	// 태그444444444444444444444444444444444444444444444444444
	public List<ProductInfoDto> bestTag4(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag4(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=4 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag4(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag4(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=4 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그44444444444444444444444444444444444444444444444444444444444
		
	
		
	// 태그555555555555555555555555555555555555555555555555555555555
	public List<ProductInfoDto> bestTag5(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag5(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=5 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag5(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag5(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=5 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 태그555555555555555555555555555555555555555555555555555
		
	

	
	// 66666666666666666666666666666666666666666666666666
	public List<ProductInfoDto> bestTag6(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag6(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=6 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag6(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag6(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=6 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 66666666666666666666666666666666666666666666666

	
	
	// 7777777777777777777777777777777777777777777777777
	public List<ProductInfoDto> bestTag7(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag7(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=7 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag7(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag7(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=7 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	// 777777777777777777777777777777777777777777777
	
	
	
	// 888888888888888888888888888888888888888888888
	public List<ProductInfoDto> bestTag8(){ // 1번 인기순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_sell_count desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> newTag8(){ // 1번 최신순
		String sql = "SELECT * from product_info where tag_no=1 order by product_join desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> cheapTag8(){ // 1번 낮은 가격순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_price asc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductInfoDto> expensiveTag8(){ // 2번 높은 가격순 
		String sql = "SELECT * from product_info where tag_no=8 order by product_price desc, product_no desc";
		List<ProductInfoDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
		//8888888888888888888888888888888888888888888
}
