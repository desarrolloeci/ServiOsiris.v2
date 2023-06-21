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
  String ccr = request.getParameter("ccr");
  
  BDServicios bd = new BDServicios();

  Vector Equipos = bd.EquiposUsuario(ccr);
  Vector usuari = bd.usuario();
  Vector usuarInac = bd.usuarioInactivo();
  
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
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script>

$(document).ready(function() {
    
$('#sports').change(function(event) {
	var sports = $("select#sports").val();
	$.get('ConsultaMarcaAJ', {
		valor    : sports,
                tipcon  : "0"
	}, function(jsonResponse) {

        var select3 = $('#equipo');
	select3.find('option').remove();
        $('<option>').val("").text("Seleccione Marca").appendTo(select3);
        
	var select = $('#player');
	select.find('option').remove();
          $('<option>').val("").text("Seleccione Marca").appendTo(select);
 	  $.each(jsonResponse, function(index, value) {
	  $('<option>').val(value).text(value).appendTo(select);
      });
	});
	});

$('#player').change(function(event) {
        var sports = $("select#sports").val();
	var sports1 = $("select#player").val();
	$.get('ConsultaMarcaAJ', {
		valor   : sports,
                tipcon  : sports1
	}, function(jsonResponse) {

	var select = $('#equipo');
	select.find('option').remove();
         $('<option>').val("").text("Seleccione Modelo").appendTo(select);
 	  $.each(jsonResponse, function(index, value) {
	  $('<option>').val(value).text(value).appendTo(select);
      });
	});
	});
        
        
$('#tsoft').change(function(event) {
	var sports = $("select#tsoft").val();
	$.get('ConsultaCaractAJ', {
		valor   : sports,
                tipcon  : 1
	}, function(jsonResponse) {

	var select = $('#soft');
	select.find('option').remove();
          $('<option>').val("").text("Seleccione Software").appendTo(select);
 	  $.each(jsonResponse, function(index, value) {
	  $('<option>').val(value).text(value).appendTo(select);
      });
	});
	});
        

$('#thard').change(function(event) {
	var sports = $("select#thard").val();
	$.get('ConsultaCaractAJ', {
		valor   : sports,
                tipcon  : 0
	}, function(jsonResponse) {

	var select = $('#hard');
	select.find('option').remove();
          $('<option>').val("").text("Seleccione Hardware").appendTo(select);
 	  $.each(jsonResponse, function(index, value) {
	  $('<option>').val(value).text(value).appendTo(select);
      });
	});
	});
        
});

</script>
    
    
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
          <form><input class="boton_personalizado2" type="button" value="< Regresar" name="volver atrás2" onclick="history.back()" /></form>
            <div class="login-block" style="margin-top: -25px">
            <font size="5" color="#808080" color="black" align="rigth">Bienvenido(a) <%=nombre%> </font> 
<center>
               
    <br>
               <table ><tr>
                       <td width="20%">Usuarios Activos:</td>
                       <td width="60%"><div class="select">
                                                            <select name="ccresponsable" class="textocom" id="ccresp" required>
                                                                <option value="" selected><font face="Times New Roman, Times, serif" size="2">Seleccione Usuario de consulta</font></option>
                                                                <%if (usuari.size() > 0){
                                                                for (int ii = 0; ii < usuari.size(); ii++) {
                                                                                          Vector infusu = (Vector)usuari.elementAt(ii) ;
                                                                                          String usu = infusu.elementAt(0).toString();
                                                                                              
                                                                %>
                                                                <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(2)%> - <%=infusu.elementAt(1)%></font></option>
                                                                <%}%>
                                                                <%}%>
                                                              </select>                                                 
                                                    </div></td>
                       <td width="20%"><input type="button" onclick=" location.href='/ServiOsiris.v2/ConUser?ccr='+document.getElementById('ccresp').value; " value="Consultar Equipos de Usuario" name="boton" /> </td>
                   </tr>
                   <tr><td><br></td></tr>
                   <tr>
                       <td width="20%">Usuarios Retirados:</td>
                       <td width="60%"><div class="select">
                                                            <select name="ccresponsable" class="textocom" id="ccresp1" required>
                                                                <option value="" selected><font face="Times New Roman, Times, serif" size="2">Seleccione Usuario de consulta</font></option>
                                                                <%if (usuarInac.size() > 0){
                                                                for (int ii = 0; ii < usuarInac.size(); ii++) {
                                                                                          Vector infusuI = (Vector)usuarInac.elementAt(ii) ;
                                                                                          String usu = infusuI.elementAt(0).toString();
                                                                                              
                                                                %>
                                                                <option value="<%=infusuI.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusuI.elementAt(2)%> - <%=infusuI.elementAt(1)%></font></option>
                                                                <%}%>
                                                                <%}%>
                                                              </select>                                                 
                                                    </div></td>
                       <td width="20%"><input type="button" onclick=" location.href='/ServiOsiris.v2/ConUser?ccr='+document.getElementById('ccresp1').value; " value="Consultar Equipos de Usuario" name="boton" /> </td>
                   </tr>
               </table>
               <br>
                    <center>
                    
                            <p>&nbsp;</p>
                            <fieldset style="margin:auto; width:1000px">
                                
                                <%if(Equipos.size()>0){%>
                                    
                                            <table width="100%" border="0"> 
                                            <tr> 
                                             <td bgcolor="#FFFFFF" width="28%" height="33" > 
                                               <div align="left"><font face="sans-serif" size="2" color="#000099"><b><font size="3"> A continuación se presentan los equipos asociados: &nbsp;&nbsp;</font></b></font></div>
                                             </td>
                                            </tr>
                                           <tr> 
                                             <td bgcolor="#FFFFFF" colspan="2" height="33" valign="top">&nbsp;</td>
                                           </tr>
                                           <tr> 
                                             <td bgcolor="#FFFFFF" colspan="2" height="33" valign="top"> 
                                               <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                                                 <tr  align="center"> 
                                                   <td width="15%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Serial Equipo</b></font></td>
                                                   <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Placa de inventario</b></font></td>
                                                   <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Ubicación</b></font></td>
                                                   <td width="15%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Marca</b></font></td>
                                                   <td width="15%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Modelo</b></font></td>
                                                   <td width="15%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo</b></font></td>
                                                   <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Salón</b></font></td>
                                                   <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Aprobado</b></font></td>
                                                   <td width="10%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Ver Detalle</b></font></td>                   
                                                 </tr>
                                                 <% for ( int m = 0 ; m < Equipos.size() ; m++ ){
                                                     Vector res = (Vector)Equipos.elementAt(m);
                                                 %>
                                                 <tr bgcolor="#CCCCCC"> 
                                                   <td width="15%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(0)%></font></div>
                                                   </td>
                                                  <td width="10%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(1)%></font></div>
                                                   </td>
                                                   <td width="10%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(2)%></font></div>
                                                   </td>
                                                   <td width="15%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(3)%></font></div>
                                                   </td>
                                                   <td width="15%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(4)%></font></div>
                                                   </td>
                                                   <td width="15%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(5)%></font></div>
                                                   </td>
                                                   <td width="10%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(6)%></font></div>
                                                   </td>
                                                   <td width="10%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><%=res.elementAt(7)%></font></div>
                                                   </td>
                                                   <td width="10%" height="48" > 
                                                     <div align="center"><font face="sans-serif" size="2" color="#000099"><a href="/ServiOsiris.v2/ActInvent?ideq=<%=res.elementAt(0)%>"><img src="img/infoeq.png" width="20" height="22" border="0"></a></font></div>
                                                   </td>
                                                 </tr>
                                                 <%}%>
                                                 <tr bgcolor="#99CCFF"> 
                                                   <td width="15%" >&nbsp;</td>
                                                   <td width="10%">&nbsp;</td>
                                                   <td width="10%">&nbsp;</td>
                                                   <td width="10%">&nbsp;</td>
                                                   <td width="15%" >&nbsp;</td>
                                                   <td width="15%" >&nbsp;</td>
                                                   <td width="15%" >&nbsp;</td>
                                                   <td width="10%" >&nbsp;</td>  
                                                   <td width="10%" >&nbsp;</td>  
                                                 </tr>
                                               </table>
                                                   <p>&nbsp;
                                             </p>
        
                                             </td>
                                           </tr>

                                         </table>
                                
                                
                                <%}else{%>
                                   
                                <center><b>El usuario no tiene equipos Asociados</b></center>
                                
                                <%}%>
                              </fieldset>
                    
                    </center>
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
					defaultBg	: 'img/7.jpg',
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