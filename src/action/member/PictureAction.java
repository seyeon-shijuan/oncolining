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
1.파일업로드.request 객체 사용 불가
1.5 이미지 파일의 1/3 크기의 썸네일 이미지를 생성한다. 이름은 sm_파일이름으로 설정 ★★가 추가
까지만 처리하면 된다.
2.opener 화면에 결과 전달->javascript
3.현재화면 close() ->javascript
*/
public class PictureAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getServletContext().getRealPath("/")+"model2/member/picture";
		String fname = null;
		try {
			File f= new File(path);
			if(!f.exists() ) {
				f.mkdirs(); //폴더 생성
			}
			MultipartRequest multi = new MultipartRequest(request,path,10*1024*1024,"euc-kr");
			 //얘로 업로드가 완성된다
			 //request 전체 정보가지고있음, path 파일 경로, 최대 업로드크기 10mb, 한글이 있으면 euc-kr로 한글인코딩
			 fname=multi.getFilesystemName("picture");
			 //진짜 파일이름을 fname에 넣는다. -> 업로드된 이미지 파일이름

			 //썸네일 이미지 생성하기
			 //new File(path+fname):업로드된 원본 파일
			 //bi:메모리에 로드 정보
			 BufferedImage bi = ImageIO.read(new File(path+fname));
			 int width=bi.getWidth()/3;
			 int height=bi.getHeight()/3;
			 BufferedImage thumb = new BufferedImage
					 (width,height,BufferedImage.TYPE_INT_RGB);
			 //thumb=도화지
			 
			 //g= 그리기 도구
			 Graphics2D g = thumb.createGraphics();
			 // 그림 그리기(크기 정하기 0에서 width까지 0에서 height까지, 그 외 설정은 null)
			 g.drawImage(bi,0,0,width,height,null);
			 // 새로운 파일로 만들기
			 f= new File(path+"sm_"+fname);
			 //thumg image를 jpg extention으로 f 파일로 저장한다.
			 ImageIO.write(thumb,"jpg",f);
		} catch (IOException e) {
			e.printStackTrace();
		}
		request.setAttribute("fname", fname);
		return new ActionForward();
	}

}
