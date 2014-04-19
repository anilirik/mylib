<%@page import="mai.mongodb.driver.MongoDriver"%>
<%@page import="mai.constantfields.FieldsOfDB"%>
<%@page import="com.mongodb.BasicDBObject"%>
<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
    
    <%
    request.setCharacterEncoding("UTF-8");
    
    if (request.getParameter("takeBook")!= null){
        String comment, name,author,year,genre;
        comment = request.getParameter("comment");
        name = request.getParameter("name");
        author = request.getParameter("author");
        year = request.getParameter("year");
        genre = request.getParameter("genre");
        
        BasicDBObject doc = new BasicDBObject();
        doc.put(FieldsOfDB.NAME,name);
        doc.put(FieldsOfDB.AUTHOR,author);
        doc.put(FieldsOfDB.YEAR,year);
        doc.put(FieldsOfDB.GENRE,genre);
        doc.put(FieldsOfDB.MY,"false");
        doc.put(FieldsOfDB.IN_LIB,"true");
        doc.put(FieldsOfDB.COMMENT,comment);
        MongoDriver.insertDocument(doc);
        response.sendRedirect("index.jsp");
    }
    %>
    
    
    <head>
    <title>Взять книгу</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
		<style type="text/css">
			.limited { 
				width: 400px;
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
                        <li><a href="deleteBook.jsp">Удалить книгу из библиотеки</a></li>
                        <li class="active"><a href="takeBook.jsp">Операции с чужими книгами</a></li>
						<!--<li><a href="login.jsp">Выход из системы</a></li>-->
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
        <div align="center">
            <table border="0">
                <tr>
                    <td width="500">
                        <form role="form" class="limited" action="takeBook.jsp" method="post">
	                        <h2>Я беру книгу</h2>
                            <div class="form-group">
                                <label for="comment">У</label>
                                <input class="form-control" id="comment" name="comment" placeholder="Имя хозяина">
                            </div>
                            <div class="form-group">
                                <label for="name">Название</label>
                                <input class="form-control" id="name" name="name" placeholder="Название книги">
                            </div>
                            <div class="form-group">
                                <label for="authorName">Автор</label>
                                <input class="form-control" id="authorName" name="author"placeholder="Имя автора">
                            </div>
                            <div class="form-group">
                                <label for="year">Год издания</label>
                                <input class="form-control" id="year" name="year" placeholder="Например, 1961">
                            </div>
                            <div class="form-group">
                                <label for="genre">Жанр</label>
                                <input class="form-control" id="genre" name="genre" placeholder="Например, роман">
                            </div>
                            <button type="submit" class="btn btn-info" >Взять</button>
                            <input type="hidden" name="takeBook" value="takeThis">
                        </form>
                    </td>
                </tr>
            </table>
        </div>
	</body>
</html>