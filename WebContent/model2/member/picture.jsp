<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <script type="text/javascript">
 img = opener.document.getElementById("pic");
 //joinform�� img= opener.document getElementById("pic"'); the 24th line in joinform
 img.src = "picture/${fname}";
 //opener â�� �̹����� ������.
 opener.document.f.picture.value="${fname}";
 //hidden ���̴�. joinform.jsp���� picture�� fname�� �ۼ�
 self.close();
 //�ڱⰡ ���� â�� �ݴ´�.(�˾�â)
 </script>
</body>
</html>