<%@ include file="secure.jsp" %>
<%@ page import="BDatos.BDServicios" %>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ page contentType="text/html"%>

   <% response.setHeader("Cache-Control","no-cache");
   // pageEncoding="UTF-8"
      //Periodo Sig
 
String ind = session.getAttribute("ind").toString();
   %>
<html>
    <head>
          <!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">-->
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Mesa de Ayuda OSIRIS</title>
        <style type="text/css">
</style>

<style type="text/css">
<!--
#fecha {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #990000;
	font-weight: bold;
}

a:hover{color:#3366CC; }
a{color: blue;}
a:link, a:visited { text-decoration: none }
.texto {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-style: normal; line-height: normal; font-weight: bold; font-variant: normal; text-transform: none;  text-decoration: none}

-->
</style>
<script language="JavaScript" src="jscript/calendario.js"></script>
<script language="JavaScript" src="jscript/overlib_mini.js"></script>

       <link href="css/forms.css" rel="stylesheet" type="text/css">
    </head>
    <body>

<table width="1306" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="15"><img name="portal_r1_c1" src="img/portal_r1_c1.jpg" width="15" height="100" border="0" id="portal_r1_c1" alt="" /></td>
    <td width="214" background="img/portal_r1_c2.jpg"><img src="img/Logo.gif" width="148" height="54"></td>
    <td width="943" valign="middle" background="img/portal_r1_c2.jpg"> 
      <div align="center"> <strong><font color="#990000" size="4" face="Times New Roman, Times, serif">Generar 
        Servicios Osiris</font></strong> </div>
    </td>
    <td width="100" valign="middle" background="img/portal_r1_c2.jpg"> 
      <div align="right"></div>
    </td>
    <td width="34"><img name="portal_r1_c4" src="img/portal_r1_c4.jpg" width="20" height="100" border="0" id="portal_r1_c4" alt="" /></td>
  </tr>
  <tr> 
    <td background="img/portal_r2_c1.jpg" style="background-repeat:repeat-y" width="15">&nbsp;</td>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="200" valign="top" height="10">
            <jsp:include page="menu">
            <jsp:param name="" value="" />
            </jsp:include>
          </td>
          <td width="884" valign="top" height="10">
	  <br>
            
              <table width="96%" border="4" align="center" bordercolor="#FFFFFF">                 
                <tr>
                  <td colspan="2">
                  <%if(ind.equals("1")){%>
                  <div align="center"><font color="#A40000"><b>Error al insertar datos en BD..!!</b></font></div>
                  <%}else{%>
                  <div align="center"><font color="#A40000"><b>Error al enviar correo..!!</b></font></div>
                  <%}%>
                </td>
                </tr>
                  
              </table>
        
              <br>		
      
			<br>
          </td>
        </tr>
      </table>
    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
  </tr>
  <tr> 
    <td width="15"><img name="portal_r3_c1" src="img/portal_r3_c1.jpg" width="15" height="100" border="0" id="portal_r3_c1" alt="" /></td>
    <td colspan="3" background="img/portal_r3_c2.jpg"><img src="img/osiris.gif" width="148" height="54" align="right"></td>
    <td width="34"><img name="portal_r3_c4" src="img/portal_r3_c4.jpg" width="20" height="100" border="0" id="portal_r3_c4" alt="" /></td>
  </tr>
</table>
    <br>
<div id="overDiv" style="position:absolute; visibility:hidden; z-index:100;"></div>
</body>
</html>
