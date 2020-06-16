<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	alert("${msg}");
	opener.location.href="${url}";
	self.close();
</script>