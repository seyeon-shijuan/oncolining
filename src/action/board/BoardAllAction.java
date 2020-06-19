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
	// ���⸸ ���� ����

	public ActionForward hello(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("hello", "hello, world");
		return new ActionForward();
	}

	/*
	 * �ڡڱ۾���ڡڡ� 1.�Ķ���� ���� model.Board ��ü ����. useBean ��� �Ұ�: request ������ �Ķ���Ϳ� ��Ŭ������
	 * ������Ƽ �� request ��ü�� ������ �� ����. ���ϽἭ 2. �Խù���ȣ num ���� ��ϵ� num�� �ִ밪�� ��ȸ. �ִ밪+1
	 * ��ϵ� �Խù� ��ȣ. db���� maxnum�� ���ؼ� +1 ������ num �����ϱ� 3. board ������ db�� ����ϱ�. ��ϼ���: �޼���
	 * ���, list.do ������ �̵� ��Ͻ���: �޼��� ���, writeForm.do ������ �̵�
	 */
	public ActionForward write(HttpServletRequest request, HttpServletResponse response) {

		String msg = "�Խù� ��� ����";
		String url = "writeForm.do";
		String path = request.getServletContext().getRealPath("/") + "model2/board/file/";
		// String path = application.getRealPath("/") + "model1/board/file/";

		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs(); // �������� ������ ���� �����
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			Board board = new Board();
			board.setName(multi.getParameter("name"));
			board.setPass(multi.getParameter("pass"));
			board.setSubject(multi.getParameter("subject"));
			board.setContent(multi.getParameter("content"));
			board.setFile1(multi.getFilesystemName("file1"));

			int num = dao.maxnum(); // board table���� num �÷��� �ִ밪 ����
			board.setNum(++num);
			board.setGrp(num);
			if (dao.insert(board)) {
				msg = "�Խù� ��� ����";
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
	 * �ڡڸ���Ʈ ���ϱ�ڡ� 1.���������� 10���� �Խù��� ����ϱ�. pageNum �Ķ���� ���� ���� => ���� ���� 1�� �����ϱ�. 2.
	 * �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��. 3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� list��ü�� ���� list ��ü��
	 * request�� ��ü�� �Ӽ����� ����Ͽ� list.jsp�� ������ �̵�
	 */
	public ActionForward list(HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1; // page ��ȣ �ʱ�ȭ
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
			// TODO: handle exception
		}
		/* ���� �߰� */
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
		if (find == null || find.trim().equals("")) { // find ���� ���� ���
			column = null;
			find = null;
		}
		/* ������� �߰� */

		int limit = 10;// �� �������� ����� �Խù� �Ǽ�
		// boardcount : ��ϵ� ��ü �Խù��� �Ǽ�, �˻��� �Խù��� �Ǽ�
		int boardcount = dao.boardCount(column, find);
		// list : ȭ�鿡 ����� �Խñ� ����, ��� ����
		List<Board> list = dao.list(pageNum, limit, column, find);

		int maxpage = (int) ((double) boardcount / limit + 0.95);
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1; // ���������� ��ȣ
		int endpage = startpage + 9;// ������������ȣ
		if (endpage > maxpage)
			endpage = maxpage;
		// �������������� �ִ� �۹�ȣ ���� ũ�� �ʵ���

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
		Board b = dao.selectOne(num); // �ش� �Խù� ��ȸ�ϴ� �Լ�
		dao.readcntAdd(num); // �ش� �Խù��� ��ȸ���� 1 ������Ű�� �Լ�
		request.setAttribute("b", b);
		return new ActionForward();
	}

	public ActionForward replyForm(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));// �Ķ�����б�
		Board board = dao.selectOne(num); // ������ ���� �ҷ�����
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
		// �ڹٺ��� �ȵǼ� Board ��ü�� ����� ��� parameters�� �ҷ��´�.

		// ���� ��ϵ� ����� ���� �ٷ� �Ʒ��� ��ȸ�ǵ��� database�� �����ؾ� �Ѵ�.
		dao.grpStepAdd(b.getGrp(), b.getGrpstep());
		int grplevel = b.getGrplevel();
		int grpstep = b.getGrpstep();
		int num = dao.maxnum(); // num�� �ִ밪 ���� why??
		String msg = "�亯��Ͻ� �����߻�";
		String url = "replyForm.do?num=" + b.getNum(); // b�� model.Board���� �°Ŵ�.
		b.setNum(++num);
		b.setGrplevel(grplevel + 1); // ���ۺ��� 1ũ��
		b.setGrpstep(grpstep + 1); // ���ۺ��� 1 ũ��
		// grp�� ���۰� �� ����� ����.
		if (dao.insert(b)) {
			msg = "�亯��� �Ϸ�";
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

		// 2. ��й�ȣ ����
		// dbBoard : ������ ���� ����. ��й�ȣ ������ ���
		Board dbBoard = dao.selectOne(b.getNum());
		String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url = "updateForm.do?num=" + b.getNum();
		if (b.getPass().equals(dbBoard.getPass())) {
			if (dao.update(b)) {
				msg = "�Խù� ���� �Ϸ�";
				url = "info.do?num=" + b.getNum();
			} else {
				msg = "�Խù� ���� ����";
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
		String msg = "�Խñ��� ��й�ȣ�� Ʋ�Ƚ��ϴ�";
		String url = "deleteForm.do?num=" + num;
		Board board = dao.selectOne(num);
		if (board == null) {
			msg = "���� �Խñ��Դϴ�. ";
			url = "list.do";
		} else {
			if (pass.equals(board.getPass())) {
				if (dao.delete(num)) {
					msg = "�Խñ� ���� ����";
					url = "list.do";
				} else {
					msg = "�Խñ� ���� ����";
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

	// ä�� ȭ��
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
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���.");
			request.setAttribute("url", "../member/loginForm.me");
			return false;
		}
		return true;
	}
	
	
}
