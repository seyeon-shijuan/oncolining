<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- ★ -->
 
    <%--
    1. save the num parameter
    2.look up the postings of the num value from the database
    3.increase the read number of the num value
    4.print out the read posting on the console view
     --%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>토픽 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.quilljs.com/1.0.0/quill.snow.css" rel="stylesheet">
<link rel="stylesheet" href="../../css/smallbutton.css">
<style type="text/css">
	.inner_frame {text-align: center; margin-top: 2%; padding: 0 4% 0 4%; background-color: #FAFAFA;}
	.outer_frame { background-color: none;}

	table {	border-collapse: collapse; border: none;
              width : 100%;}
	th,td {
		border-bottom : 1x solid #bcbcbc;
		text-align: center;
		padding: 8px;
		border: none;
		background-color: #FFFFFF;
		/*border : 1px solid black;*/
	}
	th { background-color: #FFFFFF;     color : none;  }
	td { background-color: #FFFFFF;}
	caption {	color : #111111;  font-size: 20px;
		background-color: none;  }
	input[type=text],input[type=password],textarea {
		width:100%;
	}
	.topic_subject {font-size: x-large; color: #F6CEE3; background-color: #FAFAFA;}
	hr.five{border:none; border:0.5px solid lightgray;}
	.comment_area {text-align: left;}
	.comment_content {background-color: #FAFAFA; padding: 10px;}
	.send_button {background-color: lightgray; color: #424242; border: none; border-radius: 0; padding: 3px 10px 3px 10px; font-size: small; }
	.content {margin: 10px 0 10px 0;}
</style>
</head>
<body>

	<div class="outer_frame">
		<button  class="small_button_on" onclick="location.href='../board/list.do'">&nbsp;&nbsp;임상 포럼&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../chat/chatform.do'">&nbsp;&nbsp;실시간 채팅&nbsp;&nbsp;</button>
		<div class="inner_frame">
		
			<table>
				<caption>토픽 상세보기</caption>
				<tr>
					<td colspan="2" class="topic_subject">${b.board_subject}</td>
				</tr>
				<tr>
					<td style="width: 50%;">
						<p style="text-align: left;"> 토픽 작성: ${b.mem_id} <br> ${b.board_regdate} 조회수 : ${b.board_readcnt}</p>
					</td>
					<td style="width: 50%; text-align: right;">
						<a href="updateForm.do?num=${b.board_no}" style='margin: 0 10px 0 10px;'  >수정</a>
						<a href="deleteForm.do?num=${b.board_no}" style='margin: 0 10px 0 10px;'
						onclick="window.open(this.href,'_blank','width=460, height=150'); return false;">삭제</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<hr class="five">
						<div style="text-align: right;">
							첨부파일 
							<c:if test="${empty b.board_file}">
								&nbsp;
							</c:if>
							<c:if test="${!empty b.board_file}">
							<a href="file/${b.board_file}">${b.board_file}</a>
							</c:if>
						</div>
						<table style="width:100%; height:250px; overflow: auto;">
							<tr>
								<td style="border-width:0px; vertical=align:top;text-align:left">${b.board_content}</td>
							</tr>
						</table>
						<hr class="five">
					</td>
				</tr>
				<tr>
					<td style="width: 50%; text-align: left;">
						토픽 코멘트 남기기
					</td>
					<td style="width: 50%; text-align: right;">
						<a href="replyForm.do?num=${b.board_no}"  style='margin: 0 10px 0 10px;'>하위토픽 쓰기</a>
						<a href="list.do" style='margin: 0 10px 0 10px;'>토픽 목록</a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="to_write_a_comment">
							<form class="comment_form" action="writecomment.do" method="post" enctype="multipart/form-data" name="f" id="comment_form">
								<input type="hidden" name= "board_no" value='${b.board_no}'>
								<input type="hidden" name = "mem_id" value='${sessionScope.login}'>
								<p style="text-align: left;">
									제목 : <input type="text" name="cm_title" style="border: 1px solid lightgray; background-color: #FAFAFA; height: 30px; width: 750px; font-weight: bold; margin-right: 20px;">
									<input type="submit" value="코멘트 저장" id="identifier" class="send_button">
								</p>
								<input type="file" name="cm_file" style="margin-bottom: 10px;">	
							    <div class="comment_field">
									<!-- Quill Editor -->
									<div id="editor" class="textofeditor">
									</div>
									<textarea name="cm_content" style="display:none" id="hiddenArea"></textarea>
									
							      <script src="https://cdn.quilljs.com/1.0.0/quill.js"></script>
							      <script>
									  var editor = new Quill('#editor', {
									    modules: { toolbar: true },
									    theme: 'snow'
									  });
									  $("#comment_form").submit(function() {
										  var quill = $('.textofeditor').text();
										  $('textarea[name=cm_content]').html(quill);
										  $("#editor").val(quill.getContents());
										  
									    });
									</script>
									<!-- /Quill Editor -->
									
							    </div> <!-- /comment_field -->
							  </form> <!-- /comment_form -->
							  
						</div> <!--/to_write_a_comment -->
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="comment_area">
		
							<div class="ui_comments">
							  <h3 class="ui_dividing_header">Comments</h3>
							  <div class="comment">
							  	
							  	<!-- JSTL로 코멘트 불러오기 -->
								<c:forEach items="${c}" var="c">
									<div class="content">
								    <img src="../../img/pink.png" style="width: 40px; margin-right: 0.5%;">
								    <a class="author">${c.mem_id}</a>
								    <span class="date">${c.cm_regdate}</span>
								    <div class="comment_content">
								   		<h5 style="font-weight: bold; font-size: large; font-style:italic;">"${c.cm_title}"</h5>
								  		 ${c.cm_content}
								    </div>
								    <c:if test="${!empty b.board_file}">
										<a href="#">${c.cm_file}</a>
									</c:if>
								    </div> <!-- content -->
								</c:forEach>
   
							  </div>
							</div> <!-- /ui comments -->
							
						</div> <!-- /comment_area -->
					</td>
				</tr>
			</table>
		</div> <!-- inner div -->
	</div><!-- outer div -->
</body>
</html>