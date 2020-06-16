package action.member;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.Action;
import action.ActionForward;

/*
1.���Ͼ��ε�.request ��ü ��� �Ұ�
1.5 �̹��� ������ 1/3 ũ���� ����� �̹����� �����Ѵ�. �̸��� sm_�����̸����� ���� �ڡڰ� �߰�
������ ó���ϸ� �ȴ�.
2.opener ȭ�鿡 ��� ����->javascript
3.����ȭ�� close() ->javascript
*/
public class PictureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/member/picture";
		String fname = null;
		try {
			File f= new File(path);
			if(!f.exists() ) {
				f.mkdirs(); //���� ����
			}
			MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
			 //��� ���ε尡 �ϼ��ȴ�
			 //request ��ü ��������������, path ���� ���, �ִ� ���ε�ũ�� 10mb, �ѱ��� ������ euc-kr�� �ѱ����ڵ�
			 fname=multi.getFilesystemName("picture");
			 //��¥ �����̸��� fname�� �ִ´�. -> ���ε�� �̹��� �����̸�

			 //����� �̹��� �����ϱ�
			 //new File(path+fname):���ε�� ���� ����
			 //bi:�޸𸮿� �ε� ����
			 BufferedImage bi = ImageIO.read(new File(path+fname));
			 int width=bi.getWidth()/3;
			 int height=bi.getHeight()/3;
			 BufferedImage thumb = new BufferedImage
					 (width,height,BufferedImage.TYPE_INT_RGB);
			 //thumb=��ȭ��
			 
			 //g= �׸��� ����
			 Graphics2D g = thumb.createGraphics();
			 // �׸� �׸���(ũ�� ���ϱ� 0���� width���� 0���� height����, �� �� ������ null)
			 g.drawImage(bi,0,0,width,height,null);
			 // ���ο� ���Ϸ� �����
			 f= new File(path+"sm_"+fname);
			 //thumg image�� jpg extention���� f ���Ϸ� �����Ѵ�.
			 ImageIO.write(thumb,"jpg",f);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
