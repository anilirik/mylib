<%@page import="mai.mongodb.driver.MongoDriver"%>
<%@page import="mai.constantfields.FieldsOfDB"%>
<%@page import="com.mongodb.BasicDBObject"%>
<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    String bookName = "";
if (request.getParameter("bookStateButton")!= null){
    bookName = request.getParameter("bookName");
            //new String(str.getBytes("ISO8859_1"), "UTF8");
    }

if(request.getParameter("update")!= null){
   bookName = request.getParameter("bookName");
   String comment = request.getParameter("comment");
   
   BasicDBObject oldObj = new BasicDBObject();
   oldObj.put(FieldsOfDB.NAME, bookName);
   BasicDBObject newObj = new BasicDBObject();
   newObj.put(FieldsOfDB.IN_LIB, "false");
   newObj.put(FieldsOfDB.COMMENT, comment);
   MongoDriver.updateDocument(oldObj, newObj);
   response.sendRedirect("index.jsp");
}

 

%>
<html>
  <head>
    <title>Отдать книгу</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style type="text/css">
   .limited { 
    width: 500px;
   }
   </style>
  </head>
  <body role="document">
<div class="navbar navbar-default">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">MyLib</a>
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                        <li><a href="index.jsp">Моя библиотека</a></li>
                        <li><a href="addBool.jsp">Добавить книгу в библиотеку</a></li>
                        <li><a href="deleteBook.jsp">Удалить книгу из библиотеки</a></li>
                        <li><a href="takeBook.jsp">Операции с чужими книгами</a></li>
						<!--<li><a href="login.jsp">Выход из системы</a></li>-->
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
      
        <h1 align="center"><%=bookName%></h1>
        <div align="center">
            <form role="form" class="limited" action="bookGiven.jsp" method="post">
            <div class="form-group">
                <label for="date">Отдана</label>
            </div>
            <div class="form-group">
                <input class="form-control" id="holderName" placeholder="Кому" name="comment">
            </div>
            <button type="submit" class="btn btn-success" name="update">Сохранить</button>
            <input type="hidden" name="bookName" value="<%=bookName%>">
        </form>
        </div>
	</body>
</html>