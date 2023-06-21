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
  String idd = request.getParameter("idd");
  String tiposolc = "0";
  String rol = session.getAttribute("rol").toString();
  String usu = session.getAttribute("idusr").toString();
  BDServicios bd = new BDServicios();
  Vector res = new Vector();
  Vector sol = new Vector();
  Vector asigna = new Vector();
  Vector usuari = bd.usuario_osiris();
  
  String tmp = "";
  //String doc = request.getParameter("usu");
 
  res = bd.nsol("");
  if (res.size() > 0)
     nro = (String)res.elementAt(0);
  sol = bd.Detalle_sol(idd);
  
  asigna = bd.Detalle_Asigna(idd);
  
  tiposolc = request.getParameter("tiposolc");
  
  if(tiposolc.equals("5ab")){
  bd.CambiarTipoSolicitud(idd);
  response.sendRedirect("/ServiOsiris.v2/Administrar?idd=43&tiposolc=2");
  }
  %>
<script language="JavaScript" type="text/JavaScript">
   
    function cargar3()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='Administrar';  
            document.form1.submit();
        }
    }
</script>
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
        <br>
        <br> 
          <form><input class="" type="button" value="< Regresar" name="volver atrás2" onclick="history.back()" /></form>
            
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
                  <td bgcolor="#6699CC" colspan="2"><font color="#FFFFFF"><b><font face="sans-serif" size="4">Detalle Solicitud Nro: <%=sol.elementAt(0)%>. </font></b></font></td>
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
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Estado de Solicitud:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(5)%> </font> </td>
                </tr>
                <tr>
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Tipo de Solicitud:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(8)%></font></td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Fecha Solicitud:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(6)%> </font> </td>
                </tr>
                <tr> 
                  
                <td bgcolor="#E1E1E1" height="34"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Fecha Finalización:</font></b></font></td>
                  
                <td height="34" bgcolor="#E1E1E1"><font face="sans-serif" size="2"><%=sol.elementAt(9)%> </font> </td>
                </tr>
                               <tr>
                    <td bgcolor="#E1E1E1" height="140" valign="top"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Detalle Asignaciones :</font></b></font></td>
                    
                    <td bgcolor="#E1E1E1">
                                                    <table width="100%" border="1" bordercolor="#FFFFFF" align="center" >
                                                    <tr> 
                                                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Id. Asignaci&oacute;n </b></font></td>
                                                      <td width="8%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Inicio Proceso</b></font></td>
                                                      <td width="8%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Asignaci&oacute;n</b></font></td>
                                                      <td width="8%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Finalizaci&oacute;n</b></font></td>
                                                      <td width="35%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Observaci&oacute;n </b></font></td>
                                                      <td width="8%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado</b></font></td>
                                                      <td width="8%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo</b></font></td>                   
                                                      <td width="20%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable</b></font></td>
                                                      
                                                     </tr>
                                                    <% for ( int m = 0 ; m < asigna.size() ; m++ ){
                                                        res = (Vector)asigna.elementAt(m);
                                                    %>
                                                    <tr bgcolor="#CCCCCC"> 
                                                      <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(0)%></b></font></div>
                                                      </td>
                                                     <td width="8%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(1)%></b></font></div>
                                                      </td>
                                                      <td width="8%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(2)%></b></font></div>
                                                      </td>
                                                      <td width="8%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(3)%></b></font></div>
                                                      </td>
                                                      <td width="35%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(4)%></b></font></div>
                                                      </td>
                                                      <td width="8%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(8)%></b></font></div>
                                                      </td>
                                                      <td width="8%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(6)%></b></font></div>
                                                      </td>
                                                      <td width="20%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(7)%></b></font></div>
                                                      </td>
                                                    </tr>
                                                    <% tmp = res.elementAt(5).toString();
                                                    }%>
                                                    <tr bgcolor="#99CCFF"> 
                                                      <td width="5%" >&nbsp;</td>
                                                      <td width="8%">&nbsp;</td>
                                                      <td width="8%">&nbsp;</td>
                                                      <td width="8%">&nbsp;</td>
                                                      <td width="35%">&nbsp;</td>
                                                      <td width="8%" >&nbsp;</td>
                                                      <td width="8%" >&nbsp;</td>
                                                      <td width="20%" >&nbsp;</td>  
                                                      
                                                     </tr>
                                                  </table>
                        
                    </td>
                    
                </tr>
                <tr> 
                  
                    <td bgcolor="#E1E1E1" height="80" valign="top"><font face="sans-serif" size="2" color="#000099"><b><font size="3">Asunto / Descripci&oacute;n :</font></b></font></td>
                    
                <td height="80" bgcolor="#E1E1E1" valign="top"> <font face="sans-serif" size="2"><%=sol.elementAt(4)%></font> </td>
                </tr>
                
                
              </table>
                
                
                <% if(rol.equals("8")){   %> 
                <br><br>
                <b>

                    <form action="Administrar_Sol" method="post" id="form2"> <input type="hidden" value ="<%=res.elementAt(7)%>" name ="responsable">
                        <font face="sans-serif" size="2" color="#000099">
                                    <table width="90%" border="4">
                                        <tr>
                                            <td bgcolor="#E1E1E1" width="20%" height="35" valign="top">Cambiar Estado de Solicitud a:</td>
                                            <td bgcolor="#E1E1E1" height="35" valign="top">
                                               <div class="select">
                                                   <select name="tipo_ac" id="EstadoSol" onchange="javascript:validar_Reasignación();">
                                                                            <option value="S">Finalizado (Solucionado)</option>
                                                                            <option value="C">Cancelado</option>
                                                                            <option value="R">Reasignar a Usuario</option>
                                                    </select>
                                                </div>
                                            </td>
                                             <input type="hidden" id="idd" name="Nro_Sol" value="<%=idd%>" size="0" readonly/>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#E1E1E1" height="35" valign="top">Observaciones Administrador</td>
                                            <td bgcolor="#E1E1E1" height="35" valign="top"><textarea name="obs_admin" style="width:100%;" rows="5" maxlength="1999"><%=sol.elementAt(7)%></textarea></td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#E1E1E1" height="35" valign="top">Reasignar al Usuario:</td>
                                            <td bgcolor="#E1E1E1" height="35" valign="top" id="Usuarios" style="display: none">
                                                 <div class="select" >   
                                                            <select name="User">
                                                                               <option value="0" ><font face="Times New Roman, Times, serif" size="3"> 
                                                                                -- Seleccione Usuario --</font></option>
                                                                               <%if (usuari.size() > 0){
                                                                               for (int ii = 0; ii < usuari.size(); ii++) {
                                                                                       Vector infusu = (Vector)usuari.elementAt(ii) ;%>
                                                                               <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(0)%></font></option>
                                                                                  <%}
                                                                                  }%>
                                                            </select> 
                                                 </div>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#E1E1E1" height="35" valign="top">Calificación del Servicio</td>
                                            <td bgcolor="#E1E1E1" height="35" valign="top" id="calificacion">
                                                <div class="select" style="width:100%;">
                                                <select name="Calidad">
                                                <option value="5">5 - Excelente</option>
                                                <option value="4">4 - Bueno    </option>
                                                <option value="3">3 - Regular  </option>
                                                <option value="2">2 - Malo     </option>
                                                <option value="1">1 - Muy Malo </option>
                                                </select>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr bgcolor="#E1E1E1"> 
                                            <td width="5%" > <a style="color: blue;" href="/ServiOsiris.v2/Administrar?idd=<%=idd%>&tiposolc=5ab" >Cambiar Tipo Solicitud</a></td>
                                                      <td width="60%"><button name="Bot2" type="submit" class="boton" value="Enviar">Enviar</button></td>
                                                    
                                        </tr>
                                    </table>
                                             </font>
                                </form></b>                              
                <br><br>          
                                <%}%>
                <%//}
                  }else{%>
                <tr>
                  <td colspan="2">
                  
                </td>
                </tr>
                    <%}%>
              
              
              
                    
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
                
                function validar_Reasignación(){
                
                if (document.getElementById('EstadoSol').value == "R"){
                    document.getElementById('Usuarios').style.display = 'block';
                    document.getElementById('calificacion').style.display = 'none';
                }
                if (document.getElementById('EstadoSol').value == "S"){
                    document.getElementById('Usuarios').style.display = 'none';
                    document.getElementById('calificacion').style.display = 'block';
                }
                if (document.getElementById('EstadoSol').value == "C"){
                    document.getElementById('Usuarios').style.display = 'none';
                    document.getElementById('calificacion').style.display = 'none';
                }
                
                }
                 
	</script>
    </body>
</html>