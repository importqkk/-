package com.kh.semi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.dto.ProductDto;

@Repository
public class ProductDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<ProductDto> mapper = new RowMapper<ProductDto>() {

		@Override
		public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			ProductDto productDto = new ProductDto();
			productDto.setProductNo(rs.getInt("product_no"));
			productDto.setProductName(rs.getString("product_name"));
			productDto.setProductBrand(rs.getString("product_brand"));
			productDto.setProductPrice(rs.getInt("product_price"));
			productDto.setProductStock(rs.getInt("product_stock"));
			productDto.setProductContent(rs.getString("product_content"));
			productDto.setProductDeliveryPrice(rs.getInt("product_delivery_price"));
			productDto.setProductSellCount(rs.getInt("product_sell_count"));
			productDto.setProductJoin(rs.getDate("product_join"));
			return productDto;
		}
	};
	
	public ProductDto selectOne(int productNo) { // 상품 하나 선택 
		String sql = "select * from product where product_no=?";
		Object[] param = {productNo};
		List<ProductDto> list = jdbcTemplate.query(sql,mapper,param);
		return list.isEmpty() ? null:list.get(0);
	}
	
	public List<ProductDto> selectAll(){ // 상품 전체 리스트
		String sql = "select * from product";
		List<ProductDto> list = jdbcTemplate.query(sql,mapper);
		return list.isEmpty() ? null:list;
	}
	
	
	
	public List<ProductDto> selectTag1(){ // 1번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 1";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag2(){// 2번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 2";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag3(){// 3번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 3";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag4(){// 4번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 4";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag5(){// 5번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 5";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag6(){// 6번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 6";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag7(){// 7번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 7";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	public List<ProductDto> selectTag8(){// 8번 태그 상품 리스트
		String sql = "SELECT p.* "
				+ "FROM product p "
				+ "INNER JOIN product_tag pt ON p.product_no = pt.product_no "
				+ "INNER JOIN tag t ON pt.tag_no = t.tag_no "
				+ "WHERE t.tag_no = 8";
		List<ProductDto> list = jdbcTemplate.query(sql, mapper);
		return list.isEmpty() ? null:list;
	}
	
	
	
}
