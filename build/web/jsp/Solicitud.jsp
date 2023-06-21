<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="BDatos.BDServicios"%>
<%@page import="java.util.Vector"%>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
   <% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig
  String prg = "268", hii = "", dia = "", mes = "", annio = "", fecha = "";
  String fecuso = new String("");
  int i = 0, cupm = 0, cp = 0, l = 0;
  //ConfEci cfgEci = new ConfEci();
  String perinsc = "" ;
  
  String idweb = session.getAttribute("idgr").toString();
  String nombre = session.getAttribute("nomusr").toString(); 
  String rol = session.getAttribute("rol").toString();
   
  BDServicios bd = new BDServicios();
  
  Vector tec =new Vector();
  Vector disp = new Vector();
 // res = tentrev.EntrevProg(prg, perinsc);
  tec = bd.Tecnico();
  Vector usuari = bd.usuario();
  Vector usuarios = bd.usuario_osiris();
  
  Calendar c = new GregorianCalendar();
	   dia = Integer.toString(c.get(Calendar.DATE));
	   mes = Integer.toString(c.get(Calendar.MONTH) + 1);
	   annio = Integer.toString(c.get(Calendar.YEAR));
           fecha = dia +"/"+mes+"/"+annio;
   %>
<html lang="es">
    <head>
        <title>Mesa de Ayuda OSIRIS</title>
		<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="css/garage.css" rel="stylesheet" />
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
<!--


.login-block {
    
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
    min-height: 890px;  
    min-width: 500px;
    margin-top: -20px;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 10px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 15px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
    color: black;
}


.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #333;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #333;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ddd;
    color: #333;
}

.editor-field select
{
    margin-left: 250px;
}

.select {
  border: 1px solid #ccc;
  border-radius: 5px;
  min-width: 140px;
  overflow: hidden;
  background: #fff url("arrowdown.gif") no-repeat 90% center;
  position: relative;
  font-size: 14px;
  font-family: Montserrat;
  height: 42px;
}
  .select select {
    padding: 5px 8px;
    width: 130%;
    border: none;
    box-shadow: none;
    background-color: transparent;
    background-image: none;
    appearance: none;
  }

/* Style by class. Effects the text of the contained options. */
.blueText {
  color: #848484;
}

/* Style by id. Effects position of the select drop down. */
#styledSelect {
  left:  100px;
  width: 500px
}
-->
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
            
            <div class="login-block">
    
                
    <font size="5" color="#808080" color="black" align="rigth">Bienvenido(a) <%=nombre%> </font>       
    
    <%if(rol.equals("8")||rol.equals("7")){%>
    
    <form action="CreaRegis" method="post" id="form1" >
    <p>&nbsp;</p>
    <fieldset style="margin:auto; width:500px">
        
        
    <div align="left"><strong><font color="#666666" size="2" face="Times New Roman, Times, serif"><br>
    <font face="Times New Roman, Times, serif" size="2">
        Usuario:<br>
        <div class="select">
        <select name="cliente" class="textocom" required>
                      <option value=""><font face="Times New Roman, Times, serif" size="2"> 
                      Seleccione el Usuario</font></option>
                      <%if (usuari.size() > 0){
                      for (int ii = 0; ii < usuari.size(); ii++) {
                                                Vector infusu = (Vector)usuari.elementAt(ii) ;%>
                      <option value="<%=infusu.elementAt(2)%>/<%=infusu.elementAt(1)%>/<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(2)%> - <%=infusu.elementAt(1)%></font></option>
                      <%}
                      }%>
                      <option value="AVILA HUERTAS LUZ JANETH/Fondeci/0%>"><font face="Times New Roman, Times, serif" size="2">AVILA HUERTAS LUZ JANETH - Fondeci</font></option>
                    </select>  
        </div>
        <br><br>
        
        Ubicaci&oacute;n:
        <br>
        <div class="select">
        <select name="ubic" class="input" required>
                        <option value="">Seleccione el Bloque</option>
                        <option value="A">Bloque A</option>
                        <option value="B">Bloque B</option>
                        <option value="C">Bloque C</option>
                        <option value="D">Bloque D</option>
                        <option value="F">Bloque F</option>
                        <option value="G">Bloque G</option>
                        <option value="I">Bloque I</option>
                        <option value="H">Bloque H</option>
                        <option value="Coliseo">Coliseo</option>
                        <option value="Laboratorios">Laboratorios</option>
        </select>
        </div>
        <br>
        </font>
        <br>
        Extensi&oacute;n:
        <input name="ext" type="number" id="ext" placeholder="0000" required/>
        <br>
        Tipo Solicitud:
        <br>
        <div class="select">
            <select name="tiposol" class="input" required>
                        <option value="">Seleccione el Tipo de Solicitud</option>
                        <option value="1">Soporte General - Teléfonia</option>
                        <option value="2">Formateo / Actualización / Garantias</option>
                        <option value="3">Soporte a Sistemas de Información (Ing)</option>
                        <option value="4">Investigación</option>
            </select>
        </div>
        <br>
        <br>
        Descripción de Solicitud:
        <input name="asunto" type="textarea" id="desol" size="20" placeholder="Descripción de Solicitud" maxlength="1999" required/>
        <br>
        <p>Seleccione para asignar a Usuario Especifico.<input name="usues" type="checkbox" id="usues" size="20" value="con" onclick="javascript:yesnoCheck();" /></p>
                               <div id="ifYes" style="display:none" class="select">                             
                                                            <select id="User_Os" name="UsuarioOS" class="input">
                                                                        <option value="0"><font face="Times New Roman, Times, serif" size="2"> 
                                                                        Seleccione Usuario Osiris</font></option>
                                                                        <%if (usuarios.size() > 0){
                                                                        for (int ii = 0; ii < usuarios.size(); ii++) {
                                                                                                  Vector inf = (Vector)usuarios.elementAt(ii) ;%>
                                                                        <option value="<%=inf.elementAt(1)%>"><font face="Times New Roman, Times, serif" size="2"><%=inf.elementAt(0)%></font></option>
                                                                        <%}
                                                                        }%> 
                                                           </select>
                               </div>
        <br>
        <br>
        <button name="B1" type="submit" class="boton" value="Crear Servicio" >Realizar Solicitud</button>
            </font></strong></div>
      </fieldset>
    </form>  
       
       <%} else{%>                                                    
       <br><br><br><br><br><br>
       <center><strong>Usted no Tiene Acceso a esta Sección :(</strong></center>
       <br>
       <%}%>                                                    
                                                           
    </font>            
    <br>
                                <!--FOOTER-->
<footer class="footerContainer" style="margin-top:260px">
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
					defaultBg	: 'img/2.jpg',
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
                
            <script language="JavaScript" type="text/JavaScript">
 
            function validar() {

              if(document.form1.cliente.value == 0){
                    alert("Por favor seleccione el usuario que realiza la solicitud.");
                    return false;
                }
              if(document.form1.ubic.value == 0){
                    alert("Por favor seleccione la ubicación.");
                    return false;
                }
             if(document.form1.ext.value == ""){
                    alert("Por favor digite la extensión.");
                    return false;
                }
             if(document.form1.asunto.value == ""){
                    alert("Por favor digite el asunto de la solicitud.");
                    return false;
                }
            }
            
           function yesnoCheck() {
                if (document.getElementById('usues').checked) {
                    document.getElementById('ifYes').style.display = 'block';
                }
                else{ 
                    document.getElementById('User_Os').value = '0';
                    document.getElementById('ifYes').style.display = 'none';}
            }
        </script>     
                
    </body>
</html>