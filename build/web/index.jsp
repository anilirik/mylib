<%@page import="mai.constantfields.ButtonValues"%>
<%@page import="mai.constantfields.DBParameters"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mai.constantfields.SessionValues"%>
<%@page import="mai.constantfields.FieldsOfDB"%>
<%@page import="java.util.Set"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="mai.mongodb.driver.MongoDriver"%>
<%@page import="com.mongodb.DBCollection"%>
<!DOCTYPE html>
<%@page contentType="text/html;charset=UTF-8"%>
<%
    
    request.setCharacterEncoding("UTF-8");
    String chbxName = request.getParameter("takenBooks");

    String inStockBooksStatus = (String)session.getAttribute(SessionValues.IN_STOCK_BOOKS);
    String givenAwayBooks = (String)session.getAttribute(SessionValues.GIVEN_BOOKS);
    String takenBooks = (String)session.getAttribute(SessionValues.TAKEN_BOOKS);

    if (request.getParameter("deleteBookName") != null){
        String rmbookName = request.getParameter("deleteBookName");
        BasicDBObject rmb = new BasicDBObject();
        rmb.put(FieldsOfDB.NAME, rmbookName);
        MongoDriver.removeDocument(rmb);
    }
    
    if (request.getParameter("returnTheBookName")!= null)
    {
         String returnbookName = request.getParameter("returnTheBookName");
         BasicDBObject oldObj = new BasicDBObject();
   oldObj.put(FieldsOfDB.NAME, returnbookName);
   BasicDBObject newObj = new BasicDBObject();
   newObj.put(FieldsOfDB.IN_LIB, "true");
   newObj.put(FieldsOfDB.COMMENT, "");
   MongoDriver.updateDocument(oldObj, newObj);

    }
    
    if (request.getParameter("checkboxSubmitter") != null){
        
        inStockBooksStatus = (String)request.getParameter(SessionValues.IN_STOCK_BOOKS);
        givenAwayBooks = (String)request.getParameter(SessionValues.GIVEN_BOOKS);
        takenBooks = (String)request.getParameter(SessionValues.TAKEN_BOOKS);
        
        if (inStockBooksStatus!= null && inStockBooksStatus.equals("on")){
            inStockBooksStatus = "checked";
        }
        if (givenAwayBooks!= null && givenAwayBooks.equals("on")){
            givenAwayBooks = "checked";
        }
        if (takenBooks != null && takenBooks.equals("on")){
            takenBooks = "checked";
        }
        
        session.setAttribute(SessionValues.IN_STOCK_BOOKS, inStockBooksStatus);
        session.setAttribute(SessionValues.GIVEN_BOOKS, givenAwayBooks);
        session.setAttribute(SessionValues.TAKEN_BOOKS, takenBooks);
        
    }
    
    if (inStockBooksStatus == null &&
            givenAwayBooks == null && 
             takenBooks == null && 
            session.getAttribute("chboxIsSet")==null){
        session.setAttribute(SessionValues.IN_STOCK_BOOKS, "checked");
        session.setAttribute(SessionValues.GIVEN_BOOKS, "checked");
        session.setAttribute(SessionValues.TAKEN_BOOKS, "checked");
        session.setAttribute("chboxIsSet", "yes");
     }
    inStockBooksStatus = (String)session.getAttribute(SessionValues.IN_STOCK_BOOKS);
    givenAwayBooks = (String)session.getAttribute(SessionValues.GIVEN_BOOKS);
    takenBooks = (String)session.getAttribute(SessionValues.TAKEN_BOOKS);
    
    List<DBCursor> listOfCursors = new ArrayList<DBCursor>();
    listOfCursors = getCursorsList(inStockBooksStatus, givenAwayBooks, takenBooks);
  //  DBCursor cursor;
    
    
%>
<html>
  <head>
    <title>Моя библиотека</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
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
              <li class="active"><a href="index.jsp">Моя библиотека</a></li>
              <li><a href="addBook.jsp">Добавить книгу в библиотеку</a></li>
              <li><a href="deleteBook.jsp">Удалить книгу из библиотеки</a></li>
                        <li><a href="takeBook.jsp">Взять книгу</a></li>
						<!--<li><a href="login.jsp">Выход из системы</a></li>-->
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
      
        <h1 align="center">Мои книги</h1>
        <form action="index.jsp" method="post">
        <div class="container">
            <p>
            Для просмотра или редактирования кликните по строке таблицы
            </p>
            <div class="checkbox">
                <label>
                    <input type="checkbox"  name="takenBooks" <%=takenBooks%>> Показывать те, что взял почитать
                </label>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="givenAwayBooks" <%=givenAwayBooks%>> Показывать те, что дал кому-то почитать
                </label>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="inStockBooks" <%=inStockBooksStatus%>> Показывать те, что находятся в моей библиотеке
                </label>
            </div>
            <div>
                <input type="submit" class="btn btn-primary" name="checkboxSubmitter" value="Применить">
            </div>
		</div>
            </form>
        <table class="table table-hover">
            
        <thead>
            <tr>
                <th>#</th>
                <th>Название</th>
                <th>Автор</th>
				<th>Год издания</th>
                <th>Жанр</th>
                <th>Статус</th>
            </tr>
        </thead>
        <tbody>
           <%
           DBObject objLine ;
           int index = 1;
          for(int j = 0; j < listOfCursors.size(); j++){    
           for(;listOfCursors.get(j).hasNext();){
                objLine =  listOfCursors.get(j).next();
                if (objLine == null){break;}
               //out.print("<tr  class=\"success\">");
              // out.print("<form action="index.jsp" method="post">");
               if (objLine.get(FieldsOfDB.MY).equals("true") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("false") ){
                   // перевести на страницу возврата книги
                   out.print("<tr  class=\"danger\">");
                   out.print("<form action=\"index.jsp\" method=\"post\">");
                    out.print("<input type=\"hidden\" name=\"returnTheBookName\" value=\""+ objLine.get(FieldsOfDB.NAME)  +"\">");
               }
               if (objLine.get(FieldsOfDB.MY).equals("true") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("true")){
                   out.print("<tr  class=\"success\">");
                    out.print("<form action=\"bookGiven.jsp\" method=\"post\">");
               }
               if (objLine.get(FieldsOfDB.MY).equals("false") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("true")){
                   out.print("<tr  class=\"warning\">");
                    out.print("<form action=\"index.jsp\" method=\"post\">");
                    out.print("<input type=\"hidden\" name=\"deleteBookName\" value=\""+ objLine.get(FieldsOfDB.NAME)  +"\">");
               }
               out.print("<td>" + index + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.NAME) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.AUTHOR) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.YEAR) + "</td>");
               out.print("<td>" + objLine.get(FieldsOfDB.GENRE) + "</td>");
               out.print("<input type=\"hidden\" name=\"bookName\" value=\""+ String.valueOf(objLine.get(FieldsOfDB.NAME))  +"\">");
               // <input type="hidden" name="Language" value="English">
              // i++;
               if (objLine.get(FieldsOfDB.MY).equals("true") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("false") ){
               out.print("<td><input type=\"submit\" class=\"btn btn-danger\" name=\"bookStateButton\" value=\""+ButtonValues.TAKE_BUTTON+"\">"+ "  " + objLine.get(FieldsOfDB.COMMENT) + "</td>");
               } if (objLine.get(FieldsOfDB.MY).equals("false") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("true") ){
               out.print("<td><input type=\"submit\" class=\"btn btn-warning\" name=\"bookStateButton\" value=\""+ButtonValues.RETURN_BUTTON+"\">"+  "  " +objLine.get(FieldsOfDB.COMMENT) + "</td>");
               }
               if (objLine.get(FieldsOfDB.MY).equals("true") && 
                       objLine.get(FieldsOfDB.IN_LIB).equals("true") ){
               out.print("<td><input type=\"submit\" class=\"btn btn-success\" name=\"bookStateButton\" value=\""+ButtonValues.GIVE_BUTTON+"\"></td>");
               }
               out.print("</form>");
               out.print("</tr>");
               //<input type="submit" name="checkboxSubmitter" value="Применить">
               index++;
           }
           }
           %>
           </tbody>
        </table>
	</body>
</html>
<%!

public List<DBCursor> getCursorsList(String inStockBooksStatus, String givenAwayBooks, String takenBooks){
     List<DBCursor> cursors = new ArrayList<DBCursor>();
    // если все чбоксы зажаты, то берём все книги из базы
    if ((inStockBooksStatus != null && inStockBooksStatus.equals("checked")) &&
            (givenAwayBooks != null && givenAwayBooks.equals("checked")) &&
            (takenBooks != null && takenBooks.equals("checked"))){
          cursors.add(MongoDriver.getAllBooks());
          return cursors;
    }
    // в библиотеке
    if ((inStockBooksStatus != null && inStockBooksStatus.equals("checked"))){
        cursors.add(MongoDriver.getBooksInMyLib());
    }
    // дал
    if ((givenAwayBooks != null && givenAwayBooks.equals("checked"))){
        cursors.add(MongoDriver.getBooksThoseThatGave());
    }
    // взял
    if ((takenBooks != null && takenBooks.equals("checked"))){
        cursors.add(MongoDriver.getBooksThoseThatTook());
    }
    //takenBooks
      //givenAwayBooks    
    //inStockBooksStatus
    return cursors;
}
%>