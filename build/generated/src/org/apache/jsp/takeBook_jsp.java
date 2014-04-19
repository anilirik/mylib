package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class takeBook_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    \r\n");
      out.write("    ");

    request.setCharacterEncoding("UTF-8");
    /*
    insertDocument  
        
        DBCollection table = db.getCollection("user");
	BasicDBObject document = new BasicDBObject();
	document.put("name", "mkyong");
	document.put("age", 30);
	document.put("createdDate", new Date());
     */
    if (request.getParameter("takeBook")!= null){
        String comment, name,author,year,genre;
        comment = request.getParameter("comment");
        name = request.getParameter("name");
        author = request.getParameter("author");
        year = request.getParameter("year");
        genre = request.getParameter("genre");
        int i = 3;
        
    }
    
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    <head>\r\n");
      out.write("    <title>Взять книгу</title>\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <!-- Bootstrap -->\r\n");
      out.write("    <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" media=\"screen\">\r\n");
      out.write("\t\t<style type=\"text/css\">\r\n");
      out.write("\t\t\t.limited { \r\n");
      out.write("\t\t\t\twidth: 400px;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("        </style>\r\n");
      out.write("    </head>\r\n");
      out.write("\t<body role=\"document\">\r\n");
      out.write("        <div class=\"navbar navbar-default\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\r\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                        <span class=\"icon-bar\"></span>\r\n");
      out.write("                    </button>\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"index.jsp\">MyLib</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"navbar-collapse collapse\">\r\n");
      out.write("                    <ul class=\"nav navbar-nav\">\r\n");
      out.write("                        <li><a href=\"index.jsp\">Моя библиотека</a></li>\r\n");
      out.write("                        <li><a href=\"addBook.jsp\">Добавить книгу в библиотеку</a></li>\r\n");
      out.write("                        <li><a href=\"deleteBook.jsp\">Удалить книгу из библиотеки</a></li>\r\n");
      out.write("                        <li class=\"active\"><a href=\"takeBook.jsp\">Операции с чужими книгами</a></li>\r\n");
      out.write("\t\t\t\t\t\t<!--<li><a href=\"login.jsp\">Выход из системы</a></li>-->\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div><!--/.nav-collapse -->\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div align=\"center\">\r\n");
      out.write("            <table border=\"0\">\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td width=\"500\">\r\n");
      out.write("                        <form role=\"form\" class=\"limited\" action=\"takeBook.jsp\" method=\"post\">\r\n");
      out.write("\t                        <h2>Я беру книгу</h2>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <label for=\"comment\">У</label>\r\n");
      out.write("                                <input class=\"form-control\" id=\"comment\" name=\"comment\" placeholder=\"Имя хозяина\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <label for=\"name\">Название</label>\r\n");
      out.write("                                <input class=\"form-control\" id=\"name\" name=\"name\" placeholder=\"Название книги\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <label for=\"authorName\">Автор</label>\r\n");
      out.write("                                <input class=\"form-control\" id=\"authorName\" name=\"author\"placeholder=\"Имя автора\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <label for=\"year\">Год издания</label>\r\n");
      out.write("                                <input class=\"form-control\" id=\"year\" name=\"year\" placeholder=\"Например, 1961\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"form-group\">\r\n");
      out.write("                                <label for=\"genre\">Жанр</label>\r\n");
      out.write("                                <input class=\"form-control\" id=\"genre\" name=\"genre\" placeholder=\"Например, роман\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-info\" >Взять</button>\r\n");
      out.write("                            <input type=\"hidden\" name=\"takeBook\" value=\"takeThis\">\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("        </div>\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
