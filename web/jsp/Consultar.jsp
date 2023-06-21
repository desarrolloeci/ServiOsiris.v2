<%@page import="BDatos.BDServicios"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
   <% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig  
  String nro = "1", reasig = "";
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector sol = new Vector();
  String usu = session.getAttribute("idusr").toString();
  String rol = session.getAttribute("rol").toString();
  String nombre = session.getAttribute("nomusr").toString();
  String id = (String) request.getParameter("id");
  %>
<script language="JavaScript" type="text/JavaScript">
   
    function cargar()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='Consultar';  
            document.form1.submit();
        }
    }
</script>
<%  
  if(id!=null){
    //  bd.IniciarProceso(id);
  }
  
int c = 0;
String solic = "";
String est = "1";
        
 Vector estado = new Vector();

    estado = bd.EstSolicitud_Cons(rol,est,usu) ;

%>
<html lang="es">
    <head>
        <title>Mesa de Ayuda OSIRIS</title>
		<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="css/garage.css" rel="stylesheet" />
		 <link rel="stylesheet" href="css/style1.css" />
                 <link href="css/tablas.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="css/sbimenu.css" />
		<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
		<link href='https://fonts.googleapis.com/css?family=News+Cycle&v1' rel='stylesheet' type='text/css' />
        <link rel="icon" type="image/jpg" href="img/Favicon.png">
        <link rel="stylesheet" type="text/css" href="css/ppal.css" />
 <script src="js/livevalidation.js"></script>
 <script src="js/pirobox-min.js"></script>
	<script src="js/modernizr-1.5.min.js"></script>
     <script src="js/jquery-1.4.4.min.js"></script>
    <script src="js/jquery-ui-1.8.6.min.js"></script>
    <script src="js/twitter.min.js"></script>
     <script src="js/jquery.cycle.all.min.js"></script>
     <script src="js/jquery.preloader.js"></script>
    <script src="js/main.js"></script>
   <style type="text/css">

    </style>
</head>
    <body>
 
    <div class="container">
            
            
            <a href="/ServiOsiris.v2/LogOut" class="button" >Salir</a>
            
          <header>

			</header>
<div class="content">               
<div id="sbi_container" class="sbi_container" style="height: 216px;">
					<div class="sbi_panel" data-bg="img/1.jpg">
						<a href="/ServiOsiris.v2/PortalOsiris" class="sbi_label">Inicio</a>					
					</div>
					<div class="sbi_panel" data-bg="img/2.jpg">
						<a href="/ServiOsiris.v2/Solicitud" class="sbi_label">Solicitud</a>		
					</div>
					<div class="sbi_panel" data-bg="img/3.jpg">
						<a href="/ServiOsiris.v2/Consultar" class="sbi_label">Consultar</a>
					</div>
					<div class="sbi_panel" data-bg="img/4.jpg">
						<a href="/ServiOsiris.v2/Tramitar" class="sbi_label">Tramitar</a>						
					</div>
                                        <div class="sbi_panel" data-bg="img/7.jpg">
						<a href="#" class="sbi_label">Inventario</a>		
                                                <div class="sbi_content">
							<ul>
								<li><a href="/ServiOsiris.v2/AddEquipo">Agregar Equipo</a></li>
								<li><a href="/ServiOsiris.v2/VerAprobar">Aprobar</a></li>
                                                                <li><a href="/ServiOsiris.v2/ActInvent">Reg.Cambio</a></li>
                                                                <li><a href="/ServiOsiris.v2/ConUser">Con.Usuario</a></li>
                                                                <li><a href="/ServiOsiris.v2/ResponsableSalon">Res.Sal�n</a></li>
							</ul>
						</div>
					</div>
					<div class="sbi_panel" data-bg="img/5.jpg">
						<a href="/ServiOsiris.v2/Historial" class="sbi_label">Administrar</a>
					</div>
					<div class="sbi_panel" data-bg="img/6.jpg">
						<a href="#" class="sbi_label">Reportes</a>					
                                                <div class="sbi_content">
                                                <ul>
								<li><a href="/ServiOsiris.v2/Consulta_Usuario">Usuario</a></li>
								<li><a href="/ServiOsiris.v2/Consulta_Solic">Solicitud</a></li>
								<li><a href="/ServiOsiris.v2/Consulta_Asign">Asignaci�n</a></li>
                                                                <li><a href="/ServiOsiris.v2/Horarios">Horarios</a></li>
                                                                <li><a href="/ServiOsiris.v2/RepInventario">Rep.Inventario</a></li>
                                                                <li><a href="/ServiOsiris.v2/Reportes">Rep.Solicitudes</a></li>
							</ul>
                                                    </div>
					</div>
    
                                        <div class="sbi_panel" data-bg="img/1.jpg">
                                            <a href="#" class="sbi_label">Lic.Software</a>					
                                                <div class="sbi_content">
                                            <ul>
                                               <li><a href="/ServiOsiris.v2/AddLicSoftware">Agregar Software</a></li>
                                                <li><a href="/ServiOsiris.v2/EditarLicSoft">Agregar Renovaci�n</a></li>
                                                <li><a href="/ServiOsiris.v2/ReporteLicSof">Rep.Licencias</a></li>
                                                <li><a href="/ServiOsiris.v2/ReporteSoftDisp">Cant.Licencias</a></li>
                                                <li><a href="/ServiOsiris.v2/RepAreaSoft">Rep.Area.Soft</a></li>
                                                
                                            </ul>
                                                </div>
					</div>
				</div>
	

    
          <br> <br>
            
          <div class="login-block">
    <font size="5" color="#808080" color="black" align="rigth">Bienvenido(a) <%=nombre%> </font>     
<center>
               <br>
               <br>
               <br>
               <table width="70%" border="0"> 
              <tr> 
                <td bgcolor="#FFFFFF" width="28%" height="33" > 
                  <div align="left"><font face="sans-serif" size="2" color="#000099"><b><font size="3"> A continuaci�n se presentan sus tareas PENDIENTES: &nbsp;&nbsp;</font></b></font></div>
                </td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="center">&nbsp;</td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="center"> 
                  <%if (estado.size() > 0 ) {%>
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="center">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="12"><b><font face="sans-serif" size="3" color="#FFFFFF" >SOLICITUDES: <%=estado.size()%></font></b></td>
                    </tr>
                    <tr align="center"> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099" ><b>Nro. Solicitud </b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario Soliciante</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Solicitud</b></font></td>
                      <td width="20%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable </b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Bloque</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Id. Asignaci&oacute;n</b></font></td>                   
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado Asignaci&oacute;n</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Asignaci&oacute;n</b></font></td>                   
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Asignaci&oacute;n</b></font></td>
                      
                      <td width="5%" bgcolor="#99CCFF" height="15"> 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b>Iniciar Proceso</b></font></div>
                      </td>
                      <td width="5%" bgcolor="#99CCFF" height="15"> 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b>Ver Detalle</b></font></div>
                      </td>
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(0)%></font></div>
                      </td>
                     <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(1)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(2)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(3)%></font></div>
                      </td>
                      <td width="20%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(4)%></font></div>
                      </td>
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(5)%></font></div>
                      </td>
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(8)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(6)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(7)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(9)%></font></div>
                      </td>         
                      <td width="5%" height="48" > 
                          <%if(res.elementAt(4).equals(nombre)){%><div align="center"><font face="sans-serif" size="2" color="#000099"><b>
                                      
                                      <form action="IniciarProc" method="POST" id="my_form<%=m%>">
                                                <input type="hidden" value="<%=res.elementAt(8)%>" name="idsol">
                                                <input type="hidden" value="<%=res.elementAt(0)%>" name="id">
                                                <a href="javascript:{}" onclick="document.getElementById('my_form<%=m%>').submit();"><img src="img/star.jpg" width="20" height="22" border="0"></a>
                                            </form>
                                      
                                  </b></font></div><%}%>
                      </td>
                      <td width="7%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><a href="Detalle?idd=<%=res.elementAt(0)%>"><img src="img/detalle.png" width="20" height="22" border="0"></a></font></div>
                      </td>
                    </tr>
                    <%}%>
                    <tr bgcolor="#99CCFF"> 
                      <td width="5%" >&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="20%">&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="10%" >&nbsp;</td>  
                      <td width="10%" >&nbsp;</td>
                      <td width="10%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                    </tr>
                  </table>
                      <p>&nbsp;
                </p>
                  <%}else if(c!=9){%>
                  <br><center><strong>No tiene tareas Pendientes <%=solic%></strong></center>
                  <%}%>
                </td>
              </tr>
              
            </table>
              

          

    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
  </tr>
</table>
                    	
</center>
    <footer class="footerContainer" style ="margin-top:20px;">
    <div class="container">        
        <div class="row">
            <style type="text/css">
                    ul {list-style:none} li {display:inline-block}
             </style>
            
            <article class="col-sm-7 col-md-5">
                <p>            
                    
                    <strong>ESCUELA COLOMBIANA DE INGENIER�A JULIO GARAVITO</strong><br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    <i>Contact center</i>: +57(1) 668 3600<br/>
                    L�nea Nacional Gratuita: 018000112668<br/>
                    Informaci�n detallada en: www.escuelaing.edu.co<br/><br/>
                   
                    <small>Personer�a Jur�dica 086 de enero 19 de 1973. Acreditaci�n Institucional de Alta Calidad Res. 002710 del 18 de marzo de 2019. (Vigencia 6 a�os).<br>
                    Vigilada Mineducaci�n.</small><br><br>
                    Bogot�, D.C. - Colombia<br/>
                
            </article>
            
            
        </div> 
    </div>       
</footer>          
</div>
</div>
</div> 
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/jquery.bgImageMenu.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#sbi_container').bgImageMenu({
					defaultBg	: 'img/3.jpg',
					menuSpeed	: 200,
					border		: 1,
					type		: {
						mode		: 'verticalSlideAlt',
						speed		: 450,
						easing		: 'easeOutBack'
					}
				});
			});
		</script>
    	<script>	
		var jQueryScriptOutputted = false;
		
		function initJQuery() {
		    
		    if (typeof(jQuery) == 'undefined') {
		    
		        if (!jQueryScriptOutputted) {
		            jQueryScriptOutputted = true;
		            
		            document.write("<scr" + "ipt src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js\"></scr" + "ipt>");
		        }
		        setTimeout("initJQuery()", 50);
		        
		    } else {
		    	
		    	// jQuery way of loading scripts
		    	$.getScript('js/jquery.backgroundPosition.js', function() {
		    		
		    		// Just for demo
		    		$("h2").text('This Browser is using a jQuery fallback for this effect.');
		         
		            // Set CSS in Firefox (Required to use the backgroundPosition js)
					$('#shutter1').css({backgroundPosition: '0px 0px'});
					$('#shutter2').css({backgroundPosition: '0px 0px'});
					$('#shutter3').css({backgroundPosition: '0px 0px'});
					$('#shutter4').css({backgroundPosition: '0px 0px'});
					// Animate the Shutter  
					$("#garagedoor a").hover(function() {	
					      $(this).parent().stop().animate({backgroundPosition: '(0px -10px)'}, 500);
					    }, function() {
					      $(this).parent().stop().animate({backgroundPosition: '(0px 0px)'}, 500);
					});
					
		    	});
		
		    }
		            
		}
		
		if (!Modernizr.csstransitions) {
			initJQuery();
		}
	</script>
    </body>
</html>