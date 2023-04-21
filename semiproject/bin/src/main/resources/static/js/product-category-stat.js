// 카테고리별 상품 통계

$(function() {
	// 카테고리별 개수
	$.ajax({
		url:contextPath + "/rest/admin/categoryCount",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#categoryCount');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: ['피부', '다이어트', '여성', '활력', '남성', '눈', '치아', '관절/뼈'],
					datasets: [{
						label: '상품 개수',
						data: response.cnts,
						borderWidth: 1,
						backgroundColor: ['rgba(173, 166, 255, 0.5)'],
                        borderColor: ['rgba(173, 166, 255, 1)'],
					}]
				},
				options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
	// 카테고리별 판매량
	$.ajax({
		url:contextPath + "/rest/admin/categorySellCount",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#categorySellCount');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: ['피부', '다이어트', '여성', '활력', '남성', '눈', '치아', '관절/뼈'],
					datasets: [{
						label: '평균 판매량',
						data: response.avges,
						borderWidth: 1,
						backgroundColor: ['rgba(173, 166, 255, 0.5)'],
                        borderColor: ['rgba(173, 166, 255, 1)'],
                        yAxisID: 'y1',
					},
					{
						label: '최다 판매량',
						type: 'line',
						fill: 'false',
						pointRadius: 1,
						data: response.maxs,
						borderWidth: 2,
						backgroundColor: ['rgba(255, 72, 72, 0.5)'],
                        borderColor: ['rgba(255, 72, 72, 0.5)'],
                        yAxisID: 'y2',
					}]
				},
				options: {
                    scales: {
                        y1: {
                            beginAtZero: true,
                            type: 'linear',
                            display: true,
                            position: 'left',
                        },
						y2 : {
							beginAtZero: true,
							type: 'linear',
			                display: true,
			                position: 'right',
						}
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
	// 카테고리별 가격
	$.ajax({
		url:contextPath + "/rest/admin/categoryPrice",
		method:"get",
		success:function(response) {
			var ctx = document.querySelector('#categoryPrice');
			new Chart(ctx, {
				type: 'bar',
				data: {
					/*labels: response.label,*/
					labels: ['피부', '다이어트', '여성', '활력', '남성', '눈', '치아', '관절/뼈'],
					datasets: [{
						label: '평균 가격',
						data: response.avges,
						borderWidth: 1,
						backgroundColor: ['rgba(173, 166, 255, 0.5)'],
                        borderColor: ['rgba(173, 166, 255, 1)'],
                        yAxisID: 'y1',
					},
					{
						label: '최고가',
						type: 'line',
						fill: 'false',
						pointRadius: 1,
						data: response.maxs,
						borderWidth: 2,
						backgroundColor: ['rgba(255, 72, 72, 0.5)'],
                        borderColor: ['rgba(255, 72, 72, 0.5)'],
                        yAxisID: 'y2',
					},
					{
						label: '최저가',
						type: 'line',
						fill: 'false',
						pointRadius: 1,
						data: response.mins,
						borderWidth: 2,
						backgroundColor: ['rgba(0, 128, 0, 1)'],
                        borderColor: ['rgba(0, 128, 0, 1)'],
                        yAxisID: 'y2',
					}]
				},
				options: {
                    scales: {
                        y1: {
                            beginAtZero: true,
                            type: 'linear',
                            display: true,
                            position: 'left',
                        },
						y2 : {
							beginAtZero: true,
							type: 'linear',
			                display: true,
			                position: 'right',
						}
                    }
                },
                error:function() {
                	alert("오류가 발생했습니다.\n잠시 후 다시 시도해주세요.")
                }
			})
		}
	})
})