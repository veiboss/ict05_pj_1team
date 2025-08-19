<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>CKEditor 5 Sample</title>
  <link rel="stylesheet" href="/resources/ckeditor/style.css">
  <link rel="stylesheet" href="/resources/ckeditor/ckeditor5.css">
  <script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>
  <style>
    .ck-editor__editable:not(.ck-editor__nested-editable) {
      height:450px;
    }
  </style>
</head>
<body>
<div style="width:640px;">
<form name="frm" id="frm" method="post" action="/ict05/sample/ckeditorAction">
  <input type="text" name="title" value="" style="width:100%"/><br><br>
  <textarea name="editor" id="editor"></textarea>
  <input type="submit" value="Submit"/>
</form>
</div>
<script>
  ClassicEditor.create(document.querySelector("#editor"), {
    language:"ko"
  });
</script>
<!-- A friendly reminder to run on a server, remove this during the integration. -->
</body>
</html>
