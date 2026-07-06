package kr.co.sist.util;

public class BoardUtil {
	private static BoardUtil bUtil;

	private BoardUtil() {
	}

	/**
	 * pagination을 제작하는 일.
	 * 
	 * @param currentPage 현재 페이지
	 * @param totalPage   총 페이지 수
	 * @param url         이동할 URL
	 * @param fieldNum    검색 필드
	 * @param keyword     검색 키워드
	 * @return
	 */
	public static String pagination(int currentPage, int totalPage, String url, String fieldNum, String keyword) {

		// 1. 한 화면에 보여줄 pagination의 수.
		int pageNumber = 3;
		
		// 2. 한 화면에 보여줄 시작 페이지의 번호 ([1][2][3] => [1], [4][5][6] => [4])
		int startPage = (currentPage - 1) / pageNumber * pageNumber + 1;
		
		// 3. 화면에 보여줄 마지막 번호 )1 -> 3, 4 -> 6
		int endPage = ((startPage - 1) + pageNumber) / pageNumber * pageNumber;
		
		// 4. 총 페이지 수가 연산된 마지막 페이지 수보다 작다면, 총페이지수가 마지막 페이지 수로 설정되어야한다.
		if (totalPage <= endPage) {
			endPage = totalPage;
		}
		
		StringBuilder pagination = new StringBuilder();
		pagination.append("<ul class='pagination justify-content-center'>");
		
		// 5. 이전 페이지로 가기 위한 [<<] 기호
		
		StringBuilder prevMark = new StringBuilder();
		
		prevMark.append("<li class='page-item'><span class='page-link'>Previous</span></li>");

		int movePage = 0;

		if (currentPage > pageNumber) { // 4 > 3
			movePage = startPage - 1;
			
			prevMark.delete(0, prevMark.length());
			
			prevMark.append("<li class='page-item'><a class='page-link' href='") //
					.append(url).append("?currentPage=").append(movePage);

			if (keyword != null && !keyword.isEmpty()) {
				prevMark.append("&fieldNum=").append(fieldNum).append("&keyword=").append(keyword);
			}

			prevMark.append("'>Previous</a></li>");
		}
		
		pagination.append(prevMark.toString());

		// 6. 시작 페이지 번호부터 끝 페이지 번호까지 화면에 출력하기
		movePage = startPage;
		
		StringBuilder pageLink = new StringBuilder();

		while (movePage <= endPage) {
			
			if (movePage == currentPage) { // 현재 페이지는 링크를 설정하지 않는다.
				pageLink.append("<li class='currentPage page-item page-link active'>").append(movePage).append("</li>");
			} else {
				pageLink.append("<li class='page-item'><a class='notCurrentPage page-link' href='") //
						.append(url).append("?currentPage=").append(movePage);

				if (keyword != null && !keyword.isEmpty()) {
					pageLink.append("&fieldNum=").append(fieldNum).append("&keyword=").append(keyword);
				}

				pageLink.append("'>").append(movePage).append("</a></li>");
			}

			movePage++;
		}

		if (pageLink.toString().isEmpty()) {
			pageLink.append("<li class='currentPage page-item page-link'>1</li>");
		}

		pagination.append(pageLink.toString());

		// 7. 뒤에 페이지가 더 있는 경우
		StringBuilder nextMark = new StringBuilder("<li class='page-item'><span class='page-link'>Next</span></li>");

		if (totalPage > endPage) {
			movePage = endPage + 1;
			
			nextMark.delete(0, nextMark.length());
			
			nextMark.append("<li class='page-item'><a class='nextMark page-link' href='") //
					.append(url).append("?currentPage=").append(movePage);

			if (keyword != null && !keyword.isEmpty()) {
				nextMark.append("&fieldNum=").append(fieldNum).append("&keyword=").append(keyword);
			}

			nextMark.append("'>Next").append("</a></li>");
		}

		pagination.append(nextMark).append("</ul>");

		return pagination.toString();
	}

}
