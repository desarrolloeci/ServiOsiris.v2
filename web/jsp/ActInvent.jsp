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
  String ideq = request.getParameter("ideq");
  
  BDServicios bd    = new BDServicios();
  Vector infequipo  = new Vector();
  Vector hardsof    = new Vector();
  Vector logs       = new Vector();
  Vector novedades  = new Vector();
  
 
  String usr = session.getAttribute("idusr").toString();
  
  Vector salon = bd.salon();
  Vector usuari = bd.usuario();
  infequipo = bd.Detalle_Equipo(ideq);
  hardsof = bd.ConsultaCaracteristicas(ideq);
  logs = bd.ConsultaLogs(ideq);
  novedades = bd.ConsultaNovedades(ideq);
  
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
<%if(infequipo.size()>0){%>
$('#sports').val('<%=infequipo.elementAt(10)%>');
<%}%>
    
$('#sports').change(function(event) {
	var sports = $("select#sports").val();
	$.get('ConsultaMarcaAJ', {
		valor   : sports,
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
        <table width="35%" >
                   <tr>
                       <td width="20%" align="center">Serial:</td>
                       <td width="50%"><input type="text" name="ser" id="ser"></td>
                       <td width="20%"><input type="button" onclick=" location.href='/ServiOsiris.v2/ActInvent?ideq='+document.getElementById('ser').value; " value="Consultar Equipo por Serial" name="boton" /> </td>
                   </tr>
                   <tr><td><br></td></tr>
                   <tr>
                   <form method="POST" action="ConSerialRedir">
                       <td width="20%" align="center">Placa Inventario:</td>
                       <td width="50%"><input type="text" name="placa" id="placa"></td>
                       <td width="20%"><input type="submit" value="Consultar Equipo por Placa" name="boton" /> </td>
                   </form>
                   </tr>   
                   <tr><td><br></td></tr>
                   <tr>
                       <td width="20%" align="center">Orden de Compra:</td>
                       <td width="50%"><input type="text" name="OrdenC" id="orden"></td>
                       <td width="20%"><input type="button" onclick=" location.href='/ServiOsiris.v2/RepOrdenCompra?OrdenC='+document.getElementById('orden').value; " value="Consultar Equipos por Orden" name="boton" /> </td>
                   </tr> 
               </table>
               <br>
                    <center>
                    
                            <p>&nbsp;</p>
                            <fieldset style="margin:auto; width:800px">
                                
                                <%if(infequipo.size()>0){%>

                                <div align="center" style="width: 800px;"><strong>
                                    <form action="ActualizaEquipo" method="post" id="form1" >
                                        <input type="hidden" name="cc" value="<%=infequipo.elementAt(13)%>">
                                    <table class="table" width="100%">
                                    <tr>
                                        <td colspan="2" > <A name="inf"><h1>Informaci&oacute;n General del Equipo</h1></a></td>
                                    </tr>
                                    <tr><td colspan="2">
                                            <center><i>Fecha del último mantenimiento: <%=infequipo.elementAt(17)%></i></center>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                        <table width="100%"> 
                                                    
                                                    <tr>
                                                    <td colspan="2">
                                                    Serial del Equipo:
                                                    <input name="serial" type="text" id="serial" value="<%=infequipo.elementAt(4)%>" readonly/>
                                                    </td>
                                                    </tr><tr>
                                                    <td>
                                                    Placa Inventario:
                                                    <input name="placa" type="number" id="serial" value="<%=infequipo.elementAt(0)%>" required/>
                                                    </td>
                                                    <td>
                                                    Orden de Compra:
                                                    <input name="OrdenComp" type="text" id="serial" value="<%=infequipo.elementAt(19)%>" required/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    Fecha de Compra:
                                                    <input name="fcomp" type="date" id="fcomp" value="<%=infequipo.elementAt(2)%>" required/>
                                                    </td><td>
                                                    Meses de Garantia:
                                                    <input name="mgarant" type="number" id="serial" value="<%=infequipo.elementAt(3)%>" required/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    Punto de Red:
                                                    <input name="puntored" type="text" value="<%=infequipo.elementAt(5)%>" id="serial" required/>
                                                    </td><td>
                                                    Host / Dominio / # Extensión:
                                                    <input name="dominio" type="text" id="serial" value="<%=infequipo.elementAt(6)%>" required/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    Mac Address:
                                                    <input name="mac" type="text" id="serial" value="<%=infequipo.elementAt(7)%>" required/>
                                                    </td>
                                                    <td>
                                                    Mac Address 2:
                                                    <input name="mac2" type="text" id="serial" value="<%=infequipo.elementAt(20)%>"/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                             Tipo:
                                                             <div class="select">
                                                            <select name="tipoeq" class="textocom" id="sports" required>
                                                                        <option value="">Seleccione el Tipo de Equipo</option>
                                                                        <option value="1">All in One</option>
                                                                        <option value="2">Portatil</option>
                                                                        <option value="3">Desktop</option>                     
                                                                        <option value="4">Pantalla</option>                     
                                                                        <option value="5">Teléfono</option>                     
                                                                        <option value="6">Escaner</option>                     
                                                                        <option value="7">Video Beam</option>     
                                                                        <option value="8">Switch</option>
                                                                        <option value="9">Servidor</option>
                                                                        <option value="10">Televisor</option>
                                                                        <option value="13">Cámara</option>
                                                                        </select>  
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Marca:
                                                            <div class="select">
                                                                        <select name="marca" class="textocom" id="player" required>
                                                                          <option value="<%=infequipo.elementAt(8)%>"><%=infequipo.elementAt(8)%></option>                      
                                                                        </select>  
                                                            </div>
                                                        </td>
                                                        <td>
                                                            Modelo:
                                                            <div class="select">
                                                            <select name="modelo" class="textocom" id="equipo" required>
                                                                          <option value="<%=infequipo.elementAt(9)%>"><%=infequipo.elementAt(9)%></option>                      
                                                            </select>  
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <br>
                                                            Ubicación:
                                                            <input name="ubicacion" type="text" id="serial" value="<%=infequipo.elementAt(11)%>" required/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                        Observaciones: <br>
                                                        <input name="observa" type="text" id="serial" value="<%=infequipo.elementAt(12)%>" required/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                        Equipo 50/50 <br>
                                                            <div class="select">
                                                                <select name="eqcinc" class="textocom">
                                                                  <option value="Si">Si</option>
                                                                  <option value="No">No</option>
                                                                  <option value="<%=infequipo.elementAt(18)%>" selected><%=infequipo.elementAt(18)%></option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                    </tr> <tr><td>&nbsp;</td></tr>
                                    <tr><td colspan="2"><button name="B1" type="submit" class="boton" value="Crear Servicio" >Actualizar Informaci&oacute;n B&aacute;sica</button></td></tr>  
                            </table><br>
                                                        
                             </form>
                              </strong>
                                                        
                                    <br>
                                    <A name="logs"> <h1>Responsable Actual del equipo.</h1> </a>
                                    <br>
                                    <br>
                                    <form action="ActualizaResponsable" method="POST">
                                        <input type="hidden" value="<%=infequipo.elementAt(4)%>" name="serial">
                                    
                                        
                                        <%if(!infequipo.elementAt(15).toString().equals("0") || usr.equals("francisco.farfan")){%>    
                                    <table width="100%">
                                        <tr>
                                            <td><b>Responsable:</b> <br>
                                                    <div class="select">
                                                            <select name="ccresponsable" class="textocom" required>
                                                                <option value="1"><font face="Times New Roman, Times, serif" size="2">OSIRIS</font></option>
                                                                <%if (usuari.size() > 0){
                                                                  String val="", tex="Seleccione Reponsable";
                                                                for (int ii = 0; ii < usuari.size(); ii++) {
                                                                                          Vector infusu = (Vector)usuari.elementAt(ii) ;
                                                                                          String usu = infusu.elementAt(0).toString();
                                                                                                  String tmp = infequipo.elementAt(13).toString();
                                                                                          if(infusu.elementAt(0).toString().equals(infequipo.elementAt(13).toString())){
                                                                                              val = infequipo.elementAt(13).toString();
                                                                                              tex = infusu.elementAt(2)+" - "+infusu.elementAt(1);
                                                                                          }  
                                                                                          if(tmp.equals("1")){
                                                                                               val="1"; tex="OSIRIS";
                                                                                          }
                                                                %>
                                                                <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(2)%> - <%=infusu.elementAt(1)%></font></option>
                                                                <%}%>
                                                                        <option value="<%=val%>" selected><font face="Times New Roman, Times, serif" size="2"><%=tex%></font></option>
                                                                <%}%>
                                                              </select>                                                 
                                                    </div>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td><b>   Asociar Salón / Bodega / Área </b><br>
                                                                <div class="select">
                                                                <select name="idsalon" class="textocom" required>
                                                                    <%if (salon.size() > 0){
                                                                      String val="", tex="Sin Asignar";
                                                                    for (int ii = 0; ii < salon.size(); ii++) {
                                                                                              Vector infusu = (Vector)salon.elementAt(ii) ;
                                                                                              if(infusu.elementAt(0).toString().equals(infequipo.elementAt(14).toString())){
                                                                                                  val = infequipo.elementAt(14).toString();
                                                                                                  tex = infusu.elementAt(0).toString();
                                                                                              }    
                                                                    %>
                                                                    <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(0)%></font></option>
                                                                    <%}%>
                                                                            <option value="<%=val%>" selected><font face="Times New Roman, Times, serif" size="2"><%=tex%></font></option>
                                                                    <%}%>
                                                                  </select>                                                 
                                                                </div>
                                                        </td>
                                        </tr>
                                        <tr>
                                            <td><b>Motivo de Cambio</b><br>
                                            <input type="text" name="observacion" required></td>
                                        </tr>
                                        <tr><td>&nbsp;</td></tr>
                                        <tr>
                                            <td colspan="2"><button name="B1" type="submit" class="boton" value="Crear Servicio" >Solicitar cambio de Responsable</button></td>
                                        </tr>
                                    </table>
                                    <%}else{%>
                                    <b>El equipo aún no ha sido aprobado.</b>
                                    <%}%>
                                    </form>
                                    <br>
                                    <br>
                                                        
                              <br> 
                                <br> 
                                   <center>                     
                                       
                                                        <%if(hardsof.size()>0){%>
                                 <A name="car"> <h1>Caracteristicas del Equipo</h1> </a>
                                  <table class="table" width="100%">
                                            <tr>
                                            <td><strong>Linea</strong></td>
                                            <td><strong>Nombre</strong></td>
                                            <td><strong>Tipo</strong></td>
                                            <td align="center"><strong>Eliminar</strong></td>
                                            </tr>
                                            <%
                                                for(int i = 0; i < hardsof.size(); i++){
                                                    Vector aux2 = (Vector)hardsof.elementAt(i);
                                            %>
                                            <tr>
                                                <td><%=aux2.elementAt(1)%></td>
                                                <td><%=aux2.elementAt(2)%></td>
                                                <td><%=aux2.elementAt(3)%></td>
                                                <td align="center">
                                                    <form action="EliminarCaract"method="POST" id="my_form<%=i%>">
                                                        <input type="hidden" value="<%=aux2.elementAt(1)+" - "+aux2.elementAt(2)%>" name="nomcar">
                                                        <input type="hidden" value="<%=infequipo.elementAt(13)%>" name="usrresp">
                                                        <input type="hidden" value="<%=infequipo.elementAt(4)%>" name="serial">
                                                        <input type="hidden" value="<%=aux2.elementAt(3)%>" name="tipo">
                                                        <input type="hidden" value="<%=aux2.elementAt(0)%>" name="secuencial">
                                                        <a href="javascript:{}" onclick="document.getElementById('my_form<%=i%>').submit();"><img src="img/trash.png" width="20" height="22" border="0"></a>
                                                    </form>
                                            </td>
                                            </tr>
                                           <%}%>
                                        </table>
                                        <br>
                                        <%}%>
                                   </center>
                            
                                   <br>
                            
                                  <br>
                                  
                                    <form action="NuevoSoftHard" method="POST">
                                        <input type="hidden" name="cc" value="<%=infequipo.elementAt(13)%>">
                                    <input type="hidden" value="S" name="accion">
                                    <input type="hidden" value="<%=infequipo.elementAt(4)%>" name="serial">
                                        <table width="100%"><tr>
                                        <td>
                                            <div class="select">
                                                            <select name="tipo" class="textocom" id="tsoft" required>
                                                                          <option value="">Seleccione Tipo Software</option>                      
                                                                          <option value="1">Utilitario</option>
                                                                          <!--<option value="2">Educativo</option>-->
                                                                          <option value="3">Especializado</option>
                                                                          <option value="4">Sistema Operativo</option>
                                                            </select>                                                 
                                           </div>
                                        </td>
                                        <td>
                                            <div class="select">
                                                            <select name="valor" class="textocom" id="soft" required>
                                                                          <option value="">Seleccione Software</option>                      
                                                            </select>                                                 
                                           </div>
                                        </td>   
                                        <td>
                                            <button name="" type="submit" class="boton" >Agregar Software</button>
                                        </td>
                                        
                                     </form>
                                               
                               <!--     <h2>Hardware Asociado</h2> -->
                                    <form action="NuevoSoftHard" method="POST">  
                                    <input type="hidden" name="cc" value="<%=infequipo.elementAt(13)%>">
                                    <input type="hidden" value="H" name="accion">
                                    <input type="hidden" value="<%=infequipo.elementAt(4)%>" name="serial">
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="select">
                                                            <select name="tipo" class="textocom" id="thard" required>
                                                                          <option value="">Seleccione Tipo Hardware</option>
                                                                          <option value="1">Memoria</option>
                                                                          <option value="2">Pantalla</option>
                                                                          <option value="3">Procesador</option>
                                                                          <option value="4">Alamacenamiento</option>
                                                                          <option value="5">Camara Web</option>
                                                                          <option value="6">Teclado/Mouse</option>
                                                                          <option value="7">Velocidad Procesador</option>
                                                                          <option value="8">Tarjeta Gráfica</option>
                                                            </select>                                                 
                                           </div>
                                        </td>
                                        <td>
                                            <div class="select">
                                                            <select name="valor" class="textocom" id="hard" required>
                                                                          <option value="">Seleccione Hardware</option>                      
                                                            </select>                                                 
                                           </div>
                                        </td>
                                        <td>
                                            <button name="" type="submit" class="boton" >Agregar Hardware</button>
                                        </td>
                                        </tr>
                                    </table>
                                    </form>
                             
                                    <br>
                                    
                                    <br>
                                    
                                    <A name="logs"> <h1>Novedades del Equipo</h1> </a>
                                    <%if(novedades.size()>0){%>
                                    <table width="100%">
                                        <tr>
                                            <td width="70%"><b>Novedad</b></td>
                                            <td width="15%"><b>Fecha</b></td>
                                            <td width="15%"><b>Usuario</b></td>
                                        </tr>
                                            <%
                                                for(int i = 0; i < novedades.size(); i++){
                                                    Vector aux2 = (Vector)novedades.elementAt(i);
                                            %>
                                        <tr>
                                            <td width="70%"><%=aux2.elementAt(1)%></td>
                                            <td width="15%"><%=aux2.elementAt(4)%></td>
                                            <td width="15%"><%=aux2.elementAt(3)%></td>
                                        </tr>
                                             <%}%>
                                    </table>
                                    <%}%>
                                    <form method="Post" action="RegNovedad">
                                        <input type="hidden" name="serial" value="<%=ideq%>">
                                        <input name="novedad" type="text" id="serial" value="" placeholder="Ingrese texto de novedad" maxlength="3000" required/>
                                        <button type="submit" class="boton" >Registrar Novedad</button>
                                    </form>
                                    
                                    <br>
                                    <br>
                                    <%if(logs.size()>0){%>
                                    <A name="logs"> <h1>Ultimos logs del equipo</h1> </a>
                                    <table class="table" width="100%">
                                            <tr>
                                            <td><strong>Tipo</strong></td>
                                            <td><strong>Descripción</strong></td>
                                            <td><strong>Fecha</strong></td>
                                            <td><strong>Responsable Eq</strong></td>
                                            <td><strong>Usuario OSIRIS</strong></td>
                                            </tr>
                                            <%
                                                for(int i = 0; i < logs.size(); i++){
                                                    Vector aux2 = (Vector)logs.elementAt(i);
                                            %>
                                            <tr>
                                                <td><%=aux2.elementAt(1)%></td>
                                                <td><%=aux2.elementAt(2)%></td>
                                                <td><%=aux2.elementAt(3)%></td>
                                                <td><%=aux2.elementAt(5)%></td>
                                                <td><%=aux2.elementAt(4)%></td>
                                            </tr>
                                           <%}%>
                                        </table>
                                        <br>         
                                        <%}%>
                                        
                                    
                                    <br>
                                    <center>
                                        <form action="RegistraMantenimiento" method="Post" onsubmit="return confirm('¿Confirma el registro?');">
                                            <input type="hidden" name="serialmante" value="<%=infequipo.elementAt(4)%>">
                                            <input type="hidden" name="ccmante" value="<%=infequipo.elementAt(13)%>">
                                            <input type="submit" class="button" value="Registrar Mantenimiento" style="color: white; width: 30%; ">
                                        </form>
                                    </center>
                                    <%}else{%>
                                    <center><b>Serial de Equipo no existe en la base de datos. Verifique e intente nuevamente.</b></center>
                                    <%}%>
                                    
                                    <br><br>
                                    
                                    
                                    
                                   
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