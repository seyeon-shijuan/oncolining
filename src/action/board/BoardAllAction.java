package action.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.BoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	// 여기만 별도 선언

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "hello, world");
		return new ActionForward();
	}

	/*
	 * ★★글쓰기★★★ 1.파라미터 값을 model.Board 객체 저장. useBean 사용 불가: request 정보의 파라미터와 빈클래스의
	 * 프로퍼티 비교 request 객체를 가져올 수 없음. 파일써서 2. 게시물번호 num 현재 등록된 num의 최대값을 조회. 최대값+1
	 * 등록된 게시물 번호. db에서 maxnum을 구해서 +1 값으로 num 설정하기 3. board 내용을 db에 등록하기. 등록성공: 메세지
	 * 출력, list.do 페이지 이동 등록실패: 메세지 출력, writeForm.do 페이지 이동
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {

		String msg = "게시물 등록 실패";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		// String path = application.getRealPath("/") + "model1/board/file/";

		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs(); // 존재하지 않으면 폴더 만들기
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));

			int num = dao.maxnum(); // board table에서 num 컬럼의 최대값 리턴
			board.setNum(++num);
			board.setGrp(num);
			if (dao.insert(board)) {
				msg = "게시물 등록 성공";
				url = "list.do";
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		System.out.println(url);
		return new ActionForward(false, "../alert.jsp");
	}

	/*
	 * ★★리스트 업하기★★ 1.한페이지당 10건의 게시물을 출력하기. pageNum 파라미터 값을 저장 => 없는 경우는 1로 설정하기. 2.
	 * 최근 등록된 게시물이 가장 위에 배치함. 3. db에서 해당 페이지에 출력될 내용을 조회하여 list객체로 저장 list 객체를
	 * request의 객체의 속성으로 등록하여 list.jsp로 페이지 이동
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1; // page 번호 초기화
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}
		/* 여기 추가 */
		String column = request.getParameter("column");
		String find = request.getParameter("find");
		if (column == null || column.trim().equals("")) {
			column = null;
			find = null;
		}
		if (find == null || column.trim().equals("")) {
			column = null;
			find = null;
		}
		if (find == null || find.trim().equals("")) { // find 값이 없는 경우
			column = null;
			find = null;
		}
		/* 여기까지 추가 */

		int limit = 10;// 한 페이지에 출력할 게시물 건수
		// boardcount : 등록된 전체 게시물의 건수, 검색된 게시물의 건수
		int boardcount = dao.boardCount(column, find);
		// list : 화면에 출력할 게시글 내용, 목록 저장
		List<Board> list = dao.list(pageNum, limit, column, find);

		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 시작페이지 번호
		int endpage = startpage + 9;// 종료페이지번호
		if (endpage > maxpage)
			endpage = maxpage;
		// 마지막페이지가 최대 글번호 보다 크지 않도록

		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("list", list);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}

	public ActionForward info(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board b = dao.selectOne(num); // 해당 게시물 조회하는 함수
		dao.readcntAdd(num); // 해당 게시물의 조회수를 1 증가시키는 함수
		request.setAttribute("b", b);
		return new ActionForward();
	}

	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));// 파라미터읽기
		Board board = dao.selectOne(num); // 원글의 정보 불러오기
		request.setAttribute("board", board);
		return new ActionForward();
	}

	public ActionForward reply(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("euc-kr");
		Board b = new Board();
		b.setNum(Integer.parseInt(request.getParameter("num")));
		b.setGrp(Integer.parseInt(request.getParameter("grp")));
		b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
		b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
		b.setName(request.getParameter("name"));
		b.setPass(request.getParameter("pass"));
		b.setSubject(request.getParameter("subject"));
		b.setContent(request.getParameter("content"));
		// 자바빈이 안되서 Board 객체를 만들고 모든 parameters를 불러온다.

		// 현재 등록된 답글은 원글 바로 아래에 조회되도록 database를 수정해야 한다.
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		int num = dao.maxnum(); // num의 최대값 저장 why??
		String msg = "답변등록시 오류발생";
		String url = "replyForm.do?num=" + b.getNum(); // b는 model.Board에서 온거다.
		b.setNum(++num);
		b.setGrplevel(grplevel + 1); // 원글보다 1크게
		b.setGrpstep(grpstep + 1); // 원글보다 1 크게
		// grp는 원글과 새 답글이 같다.
		if (dao.insert(b)) {
			msg = "답변등록 완료";
			url = "list.do";

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("euc-kr");
		Board b = new Board();
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		b.setNum(Integer.parseInt(multi.getParameter("num")));
		b.setName(multi.getParameter("name"));
		b.setPass(multi.getParameter("pass"));
		b.setSubject(multi.getParameter("subject"));
		b.setContent(multi.getParameter("content"));
		b.setFile1(multi.getFilesystemName("file1"));
		if (b.getFile1() == null || b.getFile1().equals("")) {
			b.setFile1(multi.getParameter("file2"));
		}

		// 2. 비밀번호 검증
		// dbBoard : 수정전 정보 저장. 비밀번호 검증시 사용
		Board dbBoard = dao.selectOne(b.getNum());
		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm.do?num=" + b.getNum();
		if (b.getPass().equals(dbBoard.getPass())) {
			if (dao.update(b)) {
				msg = "게시물 수정 완료";
				url = "info.do?num=" + b.getNum();
			} else {
				msg = "게시물 수정 실패";
			}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		String msg = "게시글의 비밀번호가 틀렸습니다";
		String url = "deleteForm.do?num=" + num;
		Board board = dao.selectOne(num);
		if (board == null) {
			msg = "없는 게시글입니다. ";
			url = "list.do";
		} else {
			if (pass.equals(board.getPass())) {
				if (dao.delete(num)) {
					msg = "게시글 삭제 성공";
					url = "list.do";
				} else {
					msg = "게시글 삭제 실패";
					url = "info.do?num=" + num;
				}
			}
		} // else
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}

	public ActionForward imgupload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getServletContext().getRealPath("/") + "model2/board/imgfile/";
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
		String fileName = multi.getFilesystemName("upload");
		request.setAttribute("fileName", fileName);
		request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
		return new ActionForward(false, "ckeditor.jsp");
	}

	// 채팅 화면
	public ActionForward chatform(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (logincheck(request)) {
			return new ActionForward();
		} else {
			return new ActionForward(false, "../alert.jsp");
		}
	}

	private boolean logincheck(HttpServletRequest request) {
		String login = (String) request.getSession().getAttribute("login");
		if (login == null) {
			request.setAttribute("msg", "로그인 후 거래하세요.");
			request.setAttribute("url", "../member/loginForm.me");
			return false;
		}
		return true;
	}
	
	
}
