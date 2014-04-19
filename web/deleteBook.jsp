<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="mai.constantfields.FieldsOfDB"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="mai.mongodb.driver.MongoDriver"%>
<%@page import="com.mongodb.DBCursor"%>
<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
    
    <%
     request.setCharacterEncoding("UTF-8");
    
    DBCursor cursorByAllMyBook = MongoDriver.getAllMyBooks();
   
       if (request.getParameter("deleteBook") != null){
        String rmbookName = request.getParameter("bookName");
        BasicDBObject rmb = new BasicDBObject();
        rmb.put(FieldsOfDB.NAME, rmbookName);
        MongoDriver.removeDocument(rmb);
    }
    
    %>
    <head>
    <title>Удаление книг</title>
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
                        <li><a href="addBook.jsp">Добавить книгу в библиотеку</a></li>
                        <li class="active"><a href="deleteBook.jsp">Удалить книгу из библиотеки</a></li>
                        <li><a href="takeBook.jsp">Взять книгу</a></li>
						<!--<li><a href="login.jsp">Выход из системы</a></li>-->
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
      
        <h1 align="center">Удаление книг</h1>
        <table class="table table-hover">
            
        <thead>
            <tr>
                <th>#</th>
                <th>Название</th>
                <th>Автор</th>
				<th>Год издания</th>
                <th>Жанр</th>
                <th>Удалить</th>
            </tr>
        </thead>
        <tbody>
           <%
           DBObject objLine ;
          for(int i = 1; cursorByAllMyBook.hasNext(); i++){
                objLine =  cursorByAllMyBook.next();
                if (objLine == null){break;}
               out.print("<tr  class=\"warning\">");
              // out.print("<form action="index.jsp" method="post">");
               
                   // перевести на страницу возврата книги
                   out.print("<form action=\"deleteBook.jsp\" method=\"post\">");
                    out.print("<input type=\"hidden\" name=\"bookName\" value=\""+ objLine.get(FieldsOfDB.NAME)  +"\">");
               out.print("<td>" + i + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.NAME) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.AUTHOR) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.YEAR) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.GENRE) + "</td>");
               out.print("<td><input type=\"submit\"  class=\"btn btn-danger\" name=\"deleteBook\" value=\"Удалить\">"+ "</td>");
               out.print("</form>");
               out.print("</tr>");
               //<input type="submit" name="checkboxSubmitter" value="Применить">
           }
           
           %>
           </tbody>
        </table>
	</body>
</html>