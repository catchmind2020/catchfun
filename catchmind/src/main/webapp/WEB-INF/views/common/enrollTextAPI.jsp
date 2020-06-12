<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <title>에디터</title>




</head>
<body>
    
	<div id="summernote"></div>
    <script>
        $(document).ready(function() {
        	$('#summernote').summernote();
        });
        
		$(document).ready(function() {
			$('#summernote').summernote({
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  lang: "ko-KR",					// 한글 설정
			});
		});
    </script>
</body>
</html>
