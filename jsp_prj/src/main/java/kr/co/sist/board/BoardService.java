package kr.co.sist.board;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private int totalCount;
	private int pageScale;
	private int totalPage;
	private int currentPage;
	private int startNum;
	private int endNum;

	/**
	 * 게시글의 총 레코드
	 * 
	 * @return
	 */
	public int searchTotalCount(RangeDTO rDTO) {
		int cnt = 0;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			cnt = bDAO.selectTotalCount(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		totalCount = cnt;

		return cnt;
	}

	/**
	 * 한 화면에 보여질 게시글의 수
	 * 
	 * @return
	 */
	public int pageScale() {
		pageScale = 10;

		return pageScale;
	}

	/**
	 * 총 페이지 수
	 * 
	 * @return
	 */
	public int totalPage() {
		int totalPage = (int) Math.ceil((double) totalCount / pageScale);
		
		this.totalPage = totalPage;

		return totalPage;
	}
	
	/**
	 * 현재 페이지를 입력받아서 정수로 변환 후 반환
	 * 
	 * @param tempPage
	 * @return
	 */
	public int currentPage(String tempPage) {
		int currentPage = 1;

		if (tempPage != null) { // pagenation을 클릭 했을 때 1, 2, 3, 4등 해당 페이지 번호가 입력.
			currentPage = Integer.parseInt(tempPage);
		}
		
		this.currentPage = currentPage;
		
		return currentPage;
	}
	
	/**
	 * 조회할 글의 시작 번호
	 * 
	 * @return
	 */
	public int startNum() {
		int startNum = currentPage * pageScale - pageScale + 1;
		
		this.startNum = startNum;
		
		return startNum;
	}
	
	/**
	 * 조회할 글의 끝 번호
	 * 
	 * @return
	 */
	public int endNum() {
		int endNum = startNum + pageScale - 1;
		
		this.endNum = endNum;
		
		return endNum;
	}

	/**
	 * 시작번호와 끝번호, 검색 키워드, 검색 필드를 받아서 해당 시작번호와 끝번호 사이의 글을 검색하는 일
	 * 
	 * @param rDTO 시작 번호, 끝 번호, 검색 키워드, 검색 필드
	 * @return
	 */
	public List<BoardDTO> searchBoard(RangeDTO rDTO) {
		List<BoardDTO> listBoard = null;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			listBoard = bDAO.selectBoard(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listBoard;
	}

	public BoardDTO searchBoardDetail(int num) {
		BoardDTO bDTO = null;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			// 글을 읽고
			bDTO = bDAO.selectBoardDetail(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return bDTO;
	}

	public void modifyCnt(int num) {
		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			bDAO.updateCnt(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public boolean addBoard(BoardDTO bDTO) {
		boolean flag = false;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			bDAO.insertBoard(bDTO);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean modifyBoard(BoardDTO bDTO) {
		boolean flag = false;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			flag = bDAO.updateBoard(bDTO) == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public boolean removeBoard(BoardDTO bDTO) {
		boolean flag = false;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			flag = bDAO.deleteBoard(bDTO) == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

}
