<%-- 
    Document   : EditarLicSoft
    Created on : 18-sep-2017, 10:31:41
    Author     : nicolas.almanzar
--%>


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
  String idLic = "", NomidLic = "", VeridLic = "";
  int i = 0, cupm = 0, cp = 0, l = 0;
  //ConfEci cfgEci = new ConfEci();
    Vector resu = new Vector();
  String idweb = session.getAttribute("idgr").toString();
  String nombre = session.getAttribute("nomusr").toString(); 
  String rol = session.getAttribute("rol").toString();
  Vector res = new Vector();
  Vector resul = new Vector();
  String NomSoft = request.getParameter("nombreSoft");
  String VerSoft = request.getParameter("valorver");
 String usr = session.getAttribute("idusr").toString();
  
  BDServicios bd = new BDServicios();
  Vector infLice  = new Vector();
  Vector infArea = new Vector();
  Vector infSoft  = new Vector();
  Vector estado = new Vector();
  Vector nombreSoft = bd.nombre_Licsoftware();
  infLice = bd.Detalle_Licencia(NomSoft,VerSoft);
  if (infLice.size()>0){
   idLic =  infLice.elementAt(0).toString();
   NomidLic =  infLice.elementAt(1).toString();
   VeridLic =  infLice.elementAt(2).toString();
   infArea = bd.Detalle_Area(idLic);
   Vector VecArea = bd.consArea();
  }
  estado = bd.Detalle_Renovacion(NomSoft,VerSoft);
  Vector VecArea = bd.consArea();
         
 // Vector verSoft = bd.version_software();
 // infSoft = bd.Detalle_Equipo(idLic);
  //infLice = bd.Detalle_Licencia(idLic);
 // infLice = bd.Detalle_Licencia(NomSoft, VerSoft);
  
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
    <script src="js/jquery-1.11.1.js" type="text/javascript"></script>
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
    
<%if(infSoft.size()>0){%>
$('#sports').val('<%=infSoft.elementAt(10)%>');
<%}%>

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


$('#vsoft').change(function(event) {
	var sports = $("select#vsoft").val();
	$.get('ConsultaVersionSoft', {
		nomsoft   : sports,
                tipcon  : 1
	}, function(jsonResponse) {

	var select = $('#vesoft');
	select.find('option').remove();
          $('<option>').val("").text("Seleccione Versión").appendTo(select);
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
        
});

</script>
    
   <style type="text/css">
<!--

.login-block {
    
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
    min-height: 700px;  
    min-width: 500px;
    margin-top: -34px;
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
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ff7b81;
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
<div id="sbi_container" class="sbi_container" style="height:225px;">
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
   
    
<%if(usr.equals("juan.cortes-ma") || usr.equals("jersson.salazar") || usr.equals("nicolas.almanzar") || usr.equals("paulina.alvarado") || usr.equals("carolina.sierra") || usr.equals("jimmy.ruiz")){%>   
        <center>
            <table width="20%" border="0" > 
                <tr>
                <td>
                <font face="sans-serif" color="#000099"><b><font size="2">Nombre Software: </font></b></font>   
                <div class="select">
                <font face="sans-serif" size="2" color="#000099"><b>    
                    <select name="nombreSoft" class="textocom" id="vsoft" required>
                    <option value=""><font face="sans-serif" size="2" color="#000099"> 
                     Seleccione Software </font></option>
                      <%if (nombreSoft.size() > 0){
                        for (int ii = 0; ii < nombreSoft.size(); ii++) {
                         Vector infusu = (Vector)nombreSoft.elementAt(ii) ;%>
                         <option value="<%=infusu.elementAt(0)%>"><font face="sans-serif" size="2" color="#000099"><%=infusu.elementAt(0)%></font></option>
                          <%}
                        }%>
                     </select>  
                     </b></font>
                </div>
                </td>    
               
             <td> 
                 <font face="sans-serif" size="2" color="#000099"><b>Versión Software:</b></font>
                 <div class="select">
                 <font face="sans-serif" size="2" color="#000099"><b>
                 <select name="valorver" class="textocom" id="vesoft" required>
                 <option value="">Seleccione Versión</option>                      
                 </select> 
                 </b></font>
             </div> 
             </td>  
             </tr>
             
             <tr>
              <td colspan="2">
                <input type="button" onclick=" location.href='/ServiOsiris.v2/EditarLicSoft?nombreSoft='+document.getElementById('vsoft').value + '&valorver='+document.getElementById('vesoft').value; " value="Consultar" name="boton" />  
             </td>  
             </tr>
            </table>
            </center>
                     
            <center>
                
                <fieldset style="margin:auto; width:800px">
                    <%if(infLice.size()>0){%>
                       
                           <font face="Times New Roman, Times, serif" size="2">
                            <form action="ActualizarLicSoft" method="post" id="form1" >
                                
                            <table  width="100%"> 
                            <tr>
                            <td colspan="2">
                                <center>  <font size="5" color="#808080" color="black" align="rigth">INFORMACIÓN GENERAL DEL SOFTWARE</font> </center>
                            <br>
                            </td>
                            </tr>
                            <tr>
                            <td>
                            Software:
                            <input name="NomSoftware" type="text" id="serial"  value="<%=infLice.elementAt(1)%>" required/>
                            </td>
                            <br>
                            <br>
                            <td>
                            version:
                            <input name="version" type="text" id="serial " value="<%=infLice.elementAt(2)%>" required />
                            </td>
                            </tr>
                            <tr>
                            <td>
                            fecha vencimiento:
                            <input name="fechaVenci" type="date" id="serial" value="<%=infLice.elementAt(3)%>" required />
                            </td>
                            <br>
                            <br>
                            <td>
                            Fecha de Compra:
                            <input name="FechaComp" type="date" id="serial" value="<%=infLice.elementAt(4)%>" required/>
                            </td>
                            </tr>

                            <tr>
                            <td>
                            Numero de Licencias:
                            <input name="numLic" type="number" id="serial" value="<%=infLice.elementAt(5)%>" required />
                            </td>
                            <td>
                            Vigencia (meses):
                            <input name="VigLic" type="number" id="serial" value="<%=infLice.elementAt(6)%>" required/>
                            </td>
                            </tr>

                            <tr>
                            <td>
                            Valor Software:
                            <input name="valorSoft" type="number"  id="serial" value="<%=infLice.elementAt(7)%>" required/>
                            </td>

                            <td >
                            Tipo Licencia:
                            <div class="select">
                                <select name="TipoLic" class="textocom" required>
                                  <option value="">Seleccione el Tipo de Licencia</option>
                                  <option value="<%=infLice.elementAt(8)%>" selected><%=infLice.elementAt(8)%></option> 
                                  <option value="Stand Alone">Stand Alone</option>
                                  <option value="Campus">Campus</option>
                                  <option value="En red Concurrentes">En red Concurrentes</option>                     
                                  <option value="En red No Concurrentes">En red No Concurrentes</option>   
                                 </select>  
                            </div>
                            <br>
                            </td>
                            </tr>

                            <tr>
                            <td colspan="2">
                            Condiciones de Uso:
                            <input name="CondUsoLic" type="text" id="serial" value="<%=infLice.elementAt(10)%>"/>
                            </td>
                            </tr>
                            
                            <tr>
                            <td colspan="2">
                            Descripción:
                            <input name="DescripLic" type="text" id="serial" value="<%=infLice.elementAt(9)%>"/>
                            </td>
                            </tr>
                            
                          <tr>
                              <td>
                                  Area Actual:
                               <div class="select">
                               <select name="CodAreActual">
                                  <option value="0"><font face="Times New Roman, Times, serif" size="2"> 
                                      Seleccione Area </font></option>
                                          <%if (infArea.size() > 0){
                                               String val="", tex="Seleccione Area";
                                                 for (int ii = 0; ii < infArea.size(); ii++) {
                                                        Vector inAreact = (Vector)infArea.elementAt(ii) ;
                                          %>
                                            <option value="<%=inAreact.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=inAreact.elementAt(1)%></font></option>
                                          <%}
                                          }%>
                                </select>  
                                </div>
                              </td>   
                              
                              
                           <td>
                               Area Nueva:
                               <div class="select">
                               <select name="CodAreaNew">
                                  <option value="0"><font face="Times New Roman, Times, serif" size="2"> 
                                      Seleccione Area </font></option>
                                          <%if (VecArea.size() > 0){
                                               String val="", tex="Seleccione Area";
                                                 for (int ii = 0; ii < VecArea.size(); ii++) {
                                                        Vector inArea = (Vector)VecArea.elementAt(ii) ;
                                          %>
                                            <option value="<%=inArea.elementAt(1)%>"><font face="Times New Roman, Times, serif" size="2"><%=inArea.elementAt(0)%></font></option>
                                          <%}
                                          }%>
                                </select>  
                                </div>
                           </td> 
                           </tr> 
                            
                            <tr>
                            <td colspan="2">
                                <br>
                             <table class="table" width="100%" border="1" bordercolor="#FFFFFF" align="top">
                            <tr> 
                                <td align="center" bgcolor="#6699CC" colspan="21"><b><font size="3" color="#FFFFFF" >AREAS ASOCIADAS -  # Registros Encontrados: <%=infArea.size()%></font></b></td>
                            </tr>
                            <tr> 
                              <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>ID Area</b></font></td>
                              <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Nombre Area</b></font></td>
                            </tr>
                            <% for ( int m = 0 ; m < infArea.size() ; m++ ){
                                resul = (Vector)infArea.elementAt(m);
                            %>
                            <tr bgcolor="#CCCCCC"> 
                                <td width="5%" height="48" > 
                                  <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resul.elementAt(0)%></b></font></div>
                                </td>
                               <td width="5%" height="48" > 
                                  <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resul.elementAt(1)%></b></font></div>
                                </td>
                            </tr>
                            <%}%>
                          </table>
                            </td>
                            </tr>
                            
                            <tr>
                            <td colspan="2">
                                <br>
                            <p>Seleccione para adicionar Area.<input name="usues" type="checkbox" id="usues" size="20" value="con" onclick="javascript:yesnoCheck();" /></p>
                               <div id="ifYes" style="display:none" class="select">   
                                   <center>
                                                            <select id="User_Os" name="CodArea" class="input">
                                                                
                                                                        <option value="0">
                                                                        Seleccione Area</option>
                                                                        <%if (VecArea.size() > 0){
                                                                        for (int ii = 0; ii < VecArea.size(); ii++) {
                                                                                                  Vector inf = (Vector)VecArea.elementAt(ii) ;%>
                                                                        <option value="<%=inf.elementAt(1)%>"><font face="Times New Roman, Times, serif" size="2"><%=inf.elementAt(0)%></font></option> 
                                                                        <%}
                                                                        }%> 
                                                            </select>
                                   </center>
                               </div>
                            </td>
                            </tr>
                            
                            <tr>
                            <td colspan="2">
                                <br>
                            <input type="hidden" name="idLic" value="<%=idLic%>">
                            <button name="B1" type="submit" class="boton">Actualizar licencia</button>
                            </td>
                            </tr>
                             <tr>
                            <td colspan="2">
                                <br>
                                <center> <font  size="3">Consultar Licencias en Uso &nbsp;</font><a href="/ServiOsiris.v2/UsuSoft?nombreSoftc=<%=NomSoft%>&valorverc=<%=VerSoft%>"><img src="img/infoeq.png" width="20" height="22" border="0"></a></center>
                            </td>
                            </tr>
                         </table>    
                         </form>
                         </font>
   
                    <%}%>
                </fieldset>
                </center>
                 
                <br>
                <br>
                <br>
                
                <center>
                <fieldset style="margin:auto; width:800px">
                 <%if(estado.size()>0){%>
                  <font size="5" color="#808080" color="black" align="rigth">Renovación Software </font>
                      <br>
                   <table class="table" width="100%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="21"><b><font size="3" color="#FFFFFF" >HISTORIAL DE RENOVACIONES -  # Registros Encontrados: <%=estado.size()%></font></b></td>
                    </tr>
                    <tr> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Nombre Software</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Versi&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Renova&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Costo Renovaci&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Vigencia</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>No. Licencias</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Licencia</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Descripci&oacute;n</b></font></td>                   
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Eliminar</b></font></td>
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(1)%></b></font></div>
                        </td>
                       <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(2)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(3)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(4)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(5)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(6)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(7)%></b></font></div>
                        </td>
                        <td width="5%" height="48" > 
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(8)%></b></font></div>
                        </td>
                                            
                        <td width="3%" height="48" > 
                            <form action="EliminarLicSoft"method="POST" id="delete<%=m%>">
                                  <input type="hidden" value="<%=res.elementAt(0)%>" name="idLic">
                                  <input type="hidden" value="<%=res.elementAt(9)%>" name="idLicRe">
                                 <input type="hidden" name="NomidLic" value="<%=res.elementAt(1)%>">
                                  <input type="hidden" name="VeridLic" value="<%=res.elementAt(2)%>">
                                  <input type="hidden" value="2" name="TipoDelete">
                            </form>
                            <center> <a href="javascript:{}" onclick="document.getElementById('delete<%=m%>').submit();"><img src="img/trash.png" width="20" height="22" border="0"></a> </center>
                            
                        </td>
                    </tr>
                    <%}%>
                  </table>
                 <%}%>
                 
                 
                </fieldset>
                </center>
                                
                <br>          
                <br>          
                <br>          
         
                <center>
                    
                    <fieldset style="margin:auto; width:800px">     
                <%if(infLice.size()>0){%>    
                <font size="5" color="#808080" color="black" align="rigth">Agregar Renovación</font>
                 
                             
                             
                              <div align="left"><strong><font  color="#666666" size="2" face="Times New Roman, Times, serif"><br>
                              <font face="Times New Roman, Times, serif" size="2">
                                  <form action="CreaRenovacion" method="post">
                                <table width="100%"> 
                                <tr>
                                <td>
                                    Costo Renovación:
                                    <input name="CostReno" type="number" id="serial" required />
                                </td>
                                <td>
                                    Fecha Renovación:
                                    <input name="FchRenova" type="date" id="serial" required/>
                                </td>
                                </tr>

                                <tr>
                                <td>
                                    Tipo Licencia:
                                    <div class="select">
                                        <select name="TipLic" class="textocom" required>
                                          <option value="">Seleccione el Tipo de Licencia</option>
                                          <option value="Stand Alone">Stand Alone</option>
                                          <option value="Campus">Campus</option>
                                          <option value="En red Concurrentes">En red Concurrentes</option>                     
                                          <option value="En red No Concurrentes">En red No Concurrentes</option>                     
                                         </select>  
                                    </div>
                                    <br>
                                </td>
                                
                                <td>
                                    Vigencia Renovación (meses):
                                    <input name="VigRenova" type="number" id="serial" required/>
                                </td>
                                </tr>

                                <tr>
                                <td colspan="2">
                                    Descripción Renovación:
                                    <input name="DescRenova" type="text" id="serial"/>
                                     <input type="hidden" name="idLic" value="<%=idLic%>">
                                     <input type="hidden" name="NomidLic" value="<%=NomidLic%>">
                                     <input type="hidden" name="VeridLic" value="<%=VeridLic%>">
                                </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                <button name="B2" type="submit" class="boton" value="Crear Renova" >Crear Renovación</button>
                                </td>
                                </tr>
                            </table>    
                            </form>
                        </font>
                           
                             
                        </font></strong></div>  
    
                 <%}%>   
                   
                </fieldset>
                 
                </center>
                                               
  
       <%}else{%>
           <center><b>Usted no tiene acceso a esta opción</b></center>
      <%}%>

           
                <center>
                    <footer class="footerContainer" style="margin-top:325px;">
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
</center>
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
