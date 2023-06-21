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
  String idd = request.getParameter("usr");
  String rol = session.getAttribute("rol").toString();
  
  int max_int = 0;
  
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector estado = new Vector();
  Vector tmp = new Vector();
  
  res = bd.Horario_Usuario(idd);
  
  estado = bd.Tipos_Horario();

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
          <form><input class="boton_personalizado2" type="button" value="< Regresar" name="volver atrás2" onclick="history.back()" /></form>
            <div class="login-block">
    
<center>
             <font face="sans-serif" size="2" color="#000099">
               <br>
               <%if(rol.equals("8")){%>
              <table width="70%" border="0"> 
              
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" height="33" valign="center"> 
                 
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="center">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="11"><b><font face="sans-serif" size="3" color="#FFFFFF" >Horarios Disponibles: </font></b></td>
                    </tr>
                    <tr> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Id. Horario </b></font></td>
                      <td width="15%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Horario</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Hora Inicio Lunes-Viernes</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Hora Fin Lunes-Viernes</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Hora Inicio Sabado</b></font></td>
                      <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Hora Fin Sabado</b></font></td>
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        tmp = (Vector)estado.elementAt(m);
                        String max = tmp.elementAt(0).toString();
                        max_int = Integer.parseInt(max);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                      <td width="5%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(0)%></b></font></div>
                      </td>
                     <td width="15%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(1)%></b></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(2)%></b></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(3)%></b></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(4)%></b></font></div>
                      </td>
                      <td width="10%" height="48" > 
                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=tmp.elementAt(5)%></b></font></div>
                      </td>
                    </tr>
                    <%}%>
                    <tr bgcolor="#99CCFF"> 
                      <td width="5%" >&nbsp;</td>
                      <td width="15%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%">&nbsp;</td>
                      <td width="10%" >&nbsp;</td>
                    </tr>
                  </table>
                      <p>&nbsp;
                </p>
                 </td>
              </tr>
              
            </table>
               
               <br>
               <strong>Realice los ajustes correspondientes.</strong>
               <br><br>
               <form action="ActualizaUsuario" method="Post">
                   <input type="hidden" value="<%=idd%>" name="usua">
                <table width="20%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr>
                        <td bgcolor="#99CCFF" align="left">Nombre: </td><td align="center" bgcolor="#CCCCCC"><%=res.elementAt(0)%></td>
                    </tr>
                    <tr>
                        <td bgcolor="#99CCFF" align="left">Ubicación: </td><td bgcolor="#CCCCCC"><select name="bloqueu" class="select" required>
                            <option value="<%=res.elementAt(1)%>">Bloque <%=res.elementAt(1)%></option>
                            <option value="A">Bloque A</option>
                            <option value="B">Bloque B</option>
                            <option value="C">Bloque C</option>
                            <option value="D">Bloque D</option>
                            <option value="F">Bloque F</option>
                            <option value="G">Bloque G</option>
                            <option value="I">Bloque I</option>
                            <option value="Coliseo">Coliseo</option>
                            <option value="Laboratorios">Laboratorios</option>
                            </select></td>
                    </tr>
                    <tr>  <%int value; if(res.elementAt(2).equals("Activo")){value = 1;} else { value = 0;}%>
                          <td bgcolor="#99CCFF" align="left">Estado: </td><td bgcolor="#CCCCCC"><select name="estadou" class="select">
                            <option value="<%=value%>"><%=res.elementAt(2)%></option>
                            <option value="0">Inactivo</option>
                            <option value="1">Activo</option>
                            </select></td>
                    </tr>
                    <tr>  <%String Auto; if(res.elementAt(10).equals("i")){Auto="Si";}else{Auto="No";}%>
                          <td bgcolor="#99CCFF" align="left">Asignación Automatica: </td><td bgcolor="#CCCCCC"><select name="AsignAuto" class="select">
                            <option value="<%=res.elementAt(10)%>"><%=Auto%></option>
                            <option value="i">Si</option>
                            <option value="a">No</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td bgcolor="#99CCFF" align="left">Id Horario: </td><td bgcolor="#CCCCCC"><input name="idhorau" type="number" min="1" max="<%=max_int%>" value="<%=res.elementAt(9)%>" ></td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="boton">Actualizar</button></td>
                    </tr>
                </table>
                    
                </form>       
                    <%}else{%>
                    
                    <strong>Usted no tiene acceso a esta sección :D</strong>
                       <br> 
                    
                    <%}%>
                </font>   
             
                
                    <br>
                    	
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