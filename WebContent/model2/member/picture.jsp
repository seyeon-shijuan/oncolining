<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <script type="text/javascript">
 img = opener.document.getElementById("pic");
 //joinform의 img= opener.document getElementById("pic"'); the 24th line in joinform
 img.src = "picture/${fname}";
 //opener 창에 이미지가 보여짐.
 opener.document.f.picture.value="${fname}";
 //hidden 값이다. joinform.jsp에서 picture에 fname을 작성
 self.close();
 //자기가 직접 창을 닫는다.(팝업창)
 </script>
</body>
</html>