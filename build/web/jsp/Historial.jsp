<%@page import="BDatos.BDServicios"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
   <% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig  
  String nro = "0", reasig = "";
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector sol = new Vector();
  String usu = session.getAttribute("idusr").toString();
  String rol = session.getAttribute("rol").toString();
  String nombre = session.getAttribute("nomusr").toString();
   %>
<script language="JavaScript" type="text/JavaScript">
   
    function cargar()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='Historial';  
            document.form1.submit();
        }
    }
</script>
<%
int c = 0;
String solic = "";
String est = est = (String) request.getParameter("carga");
        
 
 Vector estado = new Vector();
 if (est!=null)  {
    estado = bd.PendAdmin(rol,est,usu) ;
    }
%>
<html lang="es">
    <head>
        <title>Mesa de Ayuda OSIRIS</title>
		<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="css/garage.css" rel="stylesheet" />
        <link href="css/tablas.css" rel="stylesheet" />
		 <link rel="stylesheet" href="css/style1.css" />
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
<div id="sbi_container" class="sbi_container" style="height: 230px">
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
                                                                <li><a href="/ServiOsiris.v2/ResponsableSalon">Res.Salón</a></li>
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
								<li><a href="/ServiOsiris.v2/Consulta_Asign">Asignación</a></li>
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
                                                <li><a href="/ServiOsiris.v2/EditarLicSoft">Agregar Renovación</a></li>
                                                <li><a href="/ServiOsiris.v2/ReporteLicSof">Rep.Licencias</a></li>
                                                <li><a href="/ServiOsiris.v2/ReporteSoftDisp">Cant.Licencias</a></li>
                                                <li><a href="/ServiOsiris.v2/RepAreaSoft">Rep.Area.Soft</a></li>
                                                
                                            </ul>
                                                </div>
					</div>
				</div>	

    
          <br> <br>
            
          <div class="login-block" style="margin-top:-25px;" >
    <font size="5" color="#808080" color="black" align="rigth">Bienvenido(a) <%=nombre%> </font>     
<center>

    
    
    <br>
    
    
    <%if(rol.equals("8")){%>

    
    <b><font size="4">A continuación se presenta la lista de Pendientes para el Usuario Administrador:</font></b>
    
             
        
<center>
               
               <br>
               <table width="70%" border="0"> 
              <tr> 
                <td bgcolor="#FFFFFF" height="35" width="72%" valign="middle"> 
                 <div>
                   
                       <form name="form1" method="post">
                                        <table width="100%" border="4">
                                            <tr>
                                                <td bgcolor="#FFFFFF" width="28%" height="33" > 
                                                    <div align="right"><font face="sans-serif" size="2" color="#000099"><b><font size="2">Seleccione:</font></b></font></div>
                                                </td>
                                                <td>
                                                            <select name="carga" onChange="cargar();">
                                                                            <option value="9">Seleccionar por tipo</option>
                                                                            <option value="0">Todos los Pendientes</option>
                                                                            <option value="6">Solucionados (Pendiente Admin)</option>
                                                                            <option value="5">Solicitud de Reasignar (Pendiente Admin)</option>
                                                                            <option value="3">Cancelados (Pendiente Admin)</option>
                                                                            <option value="4">Suspendidos </option>
                                                                            <option value="10">Pendientes - En Proceso</option>
                                                            </select>                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </form>             
                       
                 </div>
                </td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="top">&nbsp;</td>
              </tr>
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="top"> 
                  <%if (estado.size() > 0 ) {%>
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="11"><b><font face="sans-serif" size="3" color="#FFFFFF" >SOLICITUDES POR ESTADO: <%=estado.size()%></font></b></td>
                    </tr>
                    <tr align="center"> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Nro. Solicitud </b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario Soliciante</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado</b></font></td>
                      <td width="30%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable </b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Bloque</b></font></td>
                      <td width="9%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado Asignacion</b></font></td>
                      <td width="9%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Solicitud</b></font></td>
                      <td width="9%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Asignacion</b></font></td>                   
                      <td width="9%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Inicio Proceso</b></font></td> 
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Fin Asignación</b></font></td> 
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
                      <td width="30%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(4)%></font></div>
                      </td>
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(5)%></font></div>
                      </td>
                      <td width="9%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(6)%></font></div>
                      </td>
                      <td width="9%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(3)%></font></div>
                      </td>
                      <td width="9%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(7)%></font></div>
                      </td>
                      <td width="9%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(8)%></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(9)%></font></div>
                      </td>
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><a href="Administrar?idd=<%=res.elementAt(0)%>&tiposolc=0"><img src="img/herramientas.png" width="20" height="22" border="0"></a></font></div>
                      </td>
                    </tr>
                    <%}%>
                    <tr bgcolor="#99CCFF"> 
                      <td width="5%" >&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="30%">&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="9%" >&nbsp;</td>
                      <td width="9%" >&nbsp;</td>
                      <td width="9%" >&nbsp;</td>
                      <td width="9%" >&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                    </tr>
                  </table>
                      <p>&nbsp;
                </p>
                  <%}else if(c!=9){%>
                  <br><center>No tiene solicitudes <%=solic%></center>
                  <%}%>
                </td>
              </tr>
              
            </table>
       </center>
    
    <%}else{%>
    
                <center><strong>Usted no Tiene Acceso a esta Sección :(</strong></center>
    
    <%}%>
    
    
    <br><br><br>
                                   
                    	
</center>
    <footer class="footerContainer">
    <div class="container">        
        <div class="row">
            <style type="text/css">
                    ul {list-style:none} li {display:inline-block}
             </style>
            
            <article class="col-sm-7 col-md-5">
                <p>            
                    
                    <strong>ESCUELA COLOMBIANA DE INGENIERÍA JULIO GARAVITO</strong><br/>
                    AK.45 No.205-59 (Autopista Norte)<br/>
                    <i>Contact center</i>: +57(1) 668 3600<br/>
                    Línea Nacional Gratuita: 018000112668<br/>
                    Información detallada en: www.escuelaing.edu.co<br/><br/>
                   
                    <small>Personería Jurídica 086 de enero 19 de 1973. Acreditación Institucional de Alta Calidad Res. 002710 del 18 de marzo de 2019. (Vigencia 6 años).<br>
                    Vigilada Mineducación.</small><br><br>
                    Bogotá, D.C. - Colombia<br/>
                
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
					defaultBg	: 'img/5.jpg',
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