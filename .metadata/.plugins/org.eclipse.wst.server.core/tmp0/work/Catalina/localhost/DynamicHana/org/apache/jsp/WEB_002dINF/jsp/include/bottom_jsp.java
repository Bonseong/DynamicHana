/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
 * Generated at: 2021-09-19 02:16:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class bottom_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      out.write("<footer>\r\n");
      out.write("<div class=\"footer_top\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<div class=\"col-xl-3 col-md-6 col-lg-3\">\r\n");
      out.write("				<div class=\"footer_widget wow fadeInUp\" data-wow-duration=\"1s\"\r\n");
      out.write("					data-wow-delay=\".3s\">\r\n");
      out.write("					<div class=\"footer_logo\">\r\n");
      out.write("						<a href=\"#\"> <img\r\n");
      out.write("							src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ pageContext.request.contextPath }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/img/logo.png\"\r\n");
      out.write("							alt=\"\">\r\n");
      out.write("						</a>\r\n");
      out.write("					</div>\r\n");
      out.write("					<p>\r\n");
      out.write("						finloan@support.com <br> +10 873 672 6782 <br> 600/D,\r\n");
      out.write("						Green road, NewYork\r\n");
      out.write("					</p>\r\n");
      out.write("					<div class=\"socail_links\">\r\n");
      out.write("						<ul>\r\n");
      out.write("							<li><a href=\"#\"> <i class=\"ti-facebook\"></i>\r\n");
      out.write("							</a></li>\r\n");
      out.write("							<li><a href=\"#\"> <i class=\"fa fa-google-plus\"></i>\r\n");
      out.write("							</a></li>\r\n");
      out.write("							<li><a href=\"#\"> <i class=\"fa fa-twitter\"></i>\r\n");
      out.write("							</a></li>\r\n");
      out.write("							<li><a href=\"#\"> <i class=\"fa fa-instagram\"></i>\r\n");
      out.write("							</a></li>\r\n");
      out.write("						</ul>\r\n");
      out.write("					</div>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"col-xl-2 col-md-6 col-lg-2\">\r\n");
      out.write("				<div class=\"footer_widget wow fadeInUp\" data-wow-duration=\"1.1s\"\r\n");
      out.write("					data-wow-delay=\".4s\">\r\n");
      out.write("					<h3 class=\"footer_title\">Company</h3>\r\n");
      out.write("					<ul>\r\n");
      out.write("						<li><a href=\"#\">About </a></li>\r\n");
      out.write("						<li><a href=\"#\"> Pricing</a></li>\r\n");
      out.write("						<li><a href=\"#\">Carrier Tips</a></li>\r\n");
      out.write("						<li><a href=\"#\">FAQ</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"col-xl-3 col-md-6 col-lg-3\">\r\n");
      out.write("				<div class=\"footer_widget wow fadeInUp\" data-wow-duration=\"1.2s\"\r\n");
      out.write("					data-wow-delay=\".5s\">\r\n");
      out.write("					<h3 class=\"footer_title\">Category</h3>\r\n");
      out.write("					<ul>\r\n");
      out.write("						<li><a href=\"#\">Design & Art</a></li>\r\n");
      out.write("						<li><a href=\"#\">Engineering</a></li>\r\n");
      out.write("						<li><a href=\"#\">Sales & Marketing</a></li>\r\n");
      out.write("						<li><a href=\"#\">Finance</a></li>\r\n");
      out.write("					</ul>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("			<div class=\"col-xl-4 col-md-6 col-lg-4\">\r\n");
      out.write("				<div class=\"footer_widget wow fadeInUp\" data-wow-duration=\"1.3s\"\r\n");
      out.write("					data-wow-delay=\".6s\">\r\n");
      out.write("					<h3 class=\"footer_title\">Subscribe</h3>\r\n");
      out.write("					<form action=\"#\" class=\"newsletter_form\">\r\n");
      out.write("						<input type=\"text\" placeholder=\"Enter your mail\">\r\n");
      out.write("						<button type=\"submit\">Subscribe</button>\r\n");
      out.write("					</form>\r\n");
      out.write("					<p class=\"newsletter_text\">Esteem spirit temper too say adieus\r\n");
      out.write("						who direct esteem esteems luckily.</p>\r\n");
      out.write("				</div>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"copy-right_text wow fadeInUp\" data-wow-duration=\"1.4s\"\r\n");
      out.write("	data-wow-delay=\".3s\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<div class=\"footer_border\"></div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<div class=\"col-xl-12\">\r\n");
      out.write("				<p class=\"copy_right text-center\">\r\n");
      out.write("					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\r\n");
      out.write("					Copyright &copy;\r\n");
      out.write("					<script>document.write(new Date().getFullYear());</script>\r\n");
      out.write("					All rights reserved | This template is made with <i\r\n");
      out.write("						class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\r\n");
      out.write("						href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\r\n");
      out.write("					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\r\n");
      out.write("				</p>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("</footer>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
