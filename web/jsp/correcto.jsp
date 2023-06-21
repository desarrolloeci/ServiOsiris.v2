<%@page import="java.util.Vector"%>
<%@page import="BDatos.BDServicios"%>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">

   <% response.setHeader("Cache-Control","no-cache");
   // pageEncoding="UTF-8"
      //Periodo Sig
  String dia = "", mes = "", annio = "", fecha = "";
  String nro = "0";
  String nombre = session.getAttribute("nomusr").toString();
  
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector sol = new Vector();

  //String doc = request.getParameter("usu");
  String doc = session.getAttribute("doc").toString();
  res = bd.nsol(doc);
  if (res.size() > 0)
     nro = (String)res.elementAt(0);
  sol = bd.Solicitud(nombre);


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
            <div id="logo"><H1>Escuela Colombiana de Ingenier&iacute;a</H1> <br> <h2><strong>Mesa de Ayuda <br> Oficina de Sistemas y Recursos Informáticos</strong></h2></div>
            
            <a href="/ServiOsiris.v2/LogOut" class="button" >Salir</a>
            
          <header>

			</header>
<div class="content">               
<div id="sbi_container" class="sbi_container">
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
				</div>
	

    
          <br> <br>
            <form><input class="boton_personalizado2" type="button" value="< Regresar" name="volver atrás2" onclick="location.href='/ServiOsiris.v2/Solicitud'" /></form>
            <div class="login-block">
    
<center>
                
               <br>
               <br>
               <br>
                    
              <table width="90%" border="4">
                  <%if (sol.size() > 0){
                      //String us = (String)sol.elementAt(5);
                     // for (int ii = 0; ii < sol.size(); ii++) {
                        // Vector infusu = (Vector)sol.elementAt(0) ;%>
                <tr> 
                  <td bgcolor="#6699CC" colspan="2"><font color="#FFFFFF"><b><font face="sans-serif" size="4">Solicitud Nro: <%=sol.elementAt(0)%> creada con éxito. </font></b></font></td>
                </tr>                
                <tr> 
                  
                <td bgcolor="#E1E1E1" width="19%" height="33"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Usuario:</font></b></font></td>
                  
                <td bgcolor="#E1E1E1" height="35"><font face="sans-serif" size="2"><%=sol.elementAt(1)%></font></td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" width="19%" height="35"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Ubicaci&oacute;n:</font></b></font></td>
                  
                <td bgcolor="#E1E1E1" height="35"> <font face="sans-serif" size="2">Bloque - <%=sol.elementAt(2)%> </font> </td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Extensi&oacute;n:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(3)%> </font> </td>
                
                </tr>
                <tr>
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Asignado a:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(5)%> </font> </td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">En la fecha:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(6)%> </font> </td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" height="140" valign="top"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Asunto 
                  / Descripción :</font></b></font></td>
                    
                <td height="140" bgcolor="#E1E1E1" valign="top"> <font face="sans-serif" size="2"><%=sol.elementAt(4)%></font> </td>
                </tr>
                
                 
                <%//}
                  }else{%>
                <tr>
                  <td colspan="2">
                  <div align="center"><font color="#A40000"><b>Error al generar  la solicitid!!</b></font></div>
                </td>
                </tr>
                    <%}%>
              </table>
                    	
</center>
                <!--FOOTER-->
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
					defaultBg	: 'img/Default.jpg',
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