<%-- 
    Document   : RepAreaSoft
    Created on : 
    Author     : leonardo.salazar
--%>
<%@page import="BDatos.BDServicios"%>
<%@page import="BDatos.Licencia"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
   <% response.setHeader("Cache-Control","no-cache");
      //Periodo Sig  
  String nro = "0", reasig = "";
  BDServicios bd =  new BDServicios();  
  Vector res =      new Vector();
  Vector resu =     new Vector();
  Vector sol =      new Vector();
  String usu =      session.getAttribute("idusr").toString();
  String rol =      session.getAttribute("rol").toString();
  String nombre =   session.getAttribute("nomusr").toString();
  String usr =      session.getAttribute("idusr").toString();
  Vector nombreSoft =    bd.nombre_Licsoftware();
  Vector usuari =        bd.usuario();
  
  //Genera la colecci�n de Dependencias
  ArrayList<Licencia> ListArea = bd.consArea2();
  
   %>

 <script language="JavaScript" type="text/JavaScript">
   
    function cargar()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='AddLicSoftware';  
            document.form1.submit();
        }
    }
</script>
   
<%
int c = 0;
String solic = "";
String est = "0";
String usu_con="0";
String fecha_ini ="0";
String fecha_fin ="0";
String cliente ="";
String nombreLic = "";
String ccUsuario = "";
String CodArea1 = "";
    
 est = (String) request.getParameter("Estado");
 usu_con = (String) request.getParameter("Usuario");
 fecha_ini = (String) request.getParameter("fechaini");
 fecha_fin = (String) request.getParameter("fechafin");
 cliente = (String) request.getParameter("cliente");
 ccUsuario = (String) request.getParameter("CCusuario");
 
 CodArea1 = (String) request.getParameter("CodArea");
 nombreLic = (String) request.getParameter("nombreLic");
 
 Vector usuari_es = bd.usuario();
 
 if (nro != null )  {
     if (!(nro.length() == 0))
           c = Integer.parseInt(nro);
     }

if( c != 0){
 est = Integer.toString(c);
}
 Vector estado = new Vector();
 Vector nombreUsu = new Vector();
 Vector estado1 = new Vector();
 
 
// if (usu_con != null )  {
 
 if (nombreLic != null && !nombreLic.equals("0"))  {
    estado = bd.ReporteSoft(nombreLic);
   // nombreUsu = bd.ConsultaNombreUsu(ccUsuario);
    } else if (CodArea1 != null && nombreLic.equals("0") )  { 
    estado1 = bd.ConsultaRepAreaSoft(CodArea1);
    }    
            
 String formato = request.getParameter("formato");      
 // PrintWriter oout = response.getWriter();
  if ((formato != null) && (formato.equals("excel"))) {
     response.setContentType("application/vnd.ms-excel");
        }
%>


 <script language="JavaScript" type="text/JavaScript">
            function enviarexcel(){
                //if(document.formulario.rbopciones[0].checked){
                    document.formulario.target = "";
                    document.formulario.action = "Reportes?formato=excel&x=2";
                    return true;
                //}else{
                   // alert("Seleccione Exportar");
                  //  return false
                //}
            }
</script>

<html>
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
        <!--script type="text/javascript" src="js/LicenciaEvent.js"></script-->
        
        
        
        <script>
            var dependencia = $("#dependencia").val(); 
            $(dependencia).change( function(){
                
                alert("The text has been changed.");
                
            });

        </script>
        <!--script>
     
            //Variables Globales
              var v_area = "";
              var marca_g = "";
            //var modelo_g = "";
            
            $(document).ready(function(){
            // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                $('#dependencia').on('change', function(){                                       // TIPO DEPENDENCIA
               
                    var cod_depend = $("#dependencia").val();                                               // Capturo el valor seleccionado en la lista <<name="CodArea" id="dependencia">>
                                
                    //Paso de valor a variable global
                    v_area = dependencia;
                
                    $.get('ConsultaSoftware',
                    {
                        codigo_area : cod_depend                                                            // Envio par�metros a ConsultaSoftware para realizar el query.                    
                    },
                    function(jsonResponse){ 
                                                      
                            $.each(JSON.parse(jsonResponse), function(idx, obj) { 
                            
                                alert(obj.tagName); 
                                
                            });                                                                     /*cierre each()*/                                                            
                       });                                                                          /*cierre function get*/    
                 });                                                                                /*cierre change()*/
            });                                                                                     /* cierre ready() */
        </script--> 
    
        <style type="text/css">

        </style>
</head>
    <body>
 
    <div>
        
        <a href="/ServiOsiris.v2/LogOut" class="button" >Salir</a>
    <div class="content">               
    <div id="sbi_container" class="sbi_container">
        <div class="sbi_panel" data-bg="img/6.jpg">
                <!--a href="/ServiOsiris.v2/PortalOsiris" class="sbi_label">Inicio</a-->
        </div>					
    </div>
          <br><br>
            
          <div class="login-block" >
          <font size="5" color="#808080" color="black" align="rigth">Bienvenido(a) <%=nombre%> </font>
<center>
               
           <br><br><br>
           <%if(usr.equals("nicolas.almanzar") || usr.equals("jersson.salazar") || usr.equals("paulina.alvarado") || usr.equals("mauricio.tovar") || usr.equals("jimmy.ruiz")){%>         
               <%if(rol.equals("8") || rol.equals("7")){%> 
               <table width="80%" border="0"> 
              <tr> 
                <td bgcolor="#FFFFFF" width="100%"> 
                 <di>
                       <form name="ConsultarAreaLic" method="post">
                           <center>
                                <table width="80%" border="2" class="table">
                                    <tr> 
                                        <td bgcolor="#FFFFFF" width="20%" > 
                                            <font face="sans-serif" color="#000099"><b><font size="2">Seleccione Area: </font></b></font>
                                        </td>
                                        <td>
                                            <select name="CodArea" id="dependencia">
                                                <option><font face="Times New Roman, Times, serif" size="2">Seleccione Area </font></option>
                                                <%if (ListArea.size() > 0){
                                                    //String val="", tex="Seleccione Area";
                                                    //for (int ii = 0; ii < ListArea.size(); ii++) {
                                                    for (Licencia l : ListArea) {
                                                      //Vector inArea = (Vector)ListArea.elementAt(ii) ;
                                                      %>
                                                      <option value="<%=l.IdLicencia()%>"><font face="Times New Roman, Times, serif" size="2"><%=l.NombLicencia()%></font></option>
                                                  <%}
                                                }%>
                                            </select>
                                        </td>
                                        <td bgcolor="#FFFFFF" width="20%" >
                                            <font face="sans-serif" color="#000099"><b><font size="2">Licencia: </font></b></font>
                                        </td>
                                        <td>
                                            <select name="CodSoft" class="textocom" id="id_licencia">
                                                <option>Seleccione Licencia</option>
                                            </select>
                                        </td>
                                        <td bgcolor="#FFFFFF" width="20%" > 
                                            <font face="sans-serif" color="#000099"><b><font size="2">Seleccione Software: </font></b></font>
                                        </td>                                                 
                                        <td>
                                                    <select name="nombreLic">
                                                                <option value="0"><font face="Times New Roman, Times, serif" size="2"> 
                                                                Seleccione Software </font></option>
                                                                 <option value="all"><font face="Times New Roman, Times, serif" size="2"> 
                                                                todos </font></option>
                                                                <%if (nombreSoft.size() > 0){
                                                                for (int ii = 0; ii < nombreSoft.size(); ii++) {
                                                                                          Vector infusu = (Vector)nombreSoft.elementAt(ii) ;%>
                                                                <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(0)%></font></option>
                                                                <%}
                                                                }%>
                                                    </select>  
                                        </td>
                                        <td bgcolor="#FFFFFF" width="20%" > 

                                            <button type="submit" value="Enviar Consulta" onclick="cargar();">Consultar</button>

                                        </td>
                                    </tr>
                                </table>
                           </center>
                       </form> 
                     <center>
                      <table width="80%" border="2" class="table">
                          <tr>
                            <td colspan="6">
                                <button  onclick="window.location.href='/ServiOsiris.v2/ExportarArea?formato=excel&CodArea=<%=CodArea1%>&nombreLic=<%=nombreLic%>'">Exportar a Excel</button>  
                            </td>
                          </tr>
                      </table>
                     </center>
              </div>
                </td>
              </tr>
              
              
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" valign="top">&nbsp;</td>
              </tr>
              
              <tr> 
                <td bgcolor="#FFFFFF" colspan="2" valign="top"> 
                  <%if (estado.size() > 0 ) {%>
                  <div id="MyTable">
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="21"><b><font size="3" color="#FFFFFF" >LICENCIA DE SOFTWARE  # Registros Encontrados: <%=estado.size()%></font></b></td>
                    </tr>
                    <tr> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Ubicaci&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Software</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Versi&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha compra</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Vencimiento</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Vigencia</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>No. Licencias</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Costo compra</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Licencia</b></font></td>
                   
                    </tr>
                    <% 
                      
                      for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr bgcolor="#CCCCCC"> 
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(0)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(1)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(2)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(3)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(4)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(5)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(6)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(7)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(8)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(9)%></b></font></div></td>
                        
                    </tr>
                     <%}
                     %>
                    <tr bgcolor="#99CCFF"> 
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td> 
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
         
                    </tr>
                  </table>
                    
                  </div>
                    
                <p>&nbsp; 
                </p>
                  <%}else if(estado1.size() > 0 ) {%>
                  <div id="MyTable">
                  <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                    <tr> 
                        <td align="center" bgcolor="#6699CC" colspan="21"><b><font size="3" color="#FFFFFF" >LICENCIA DE SOFTWARE <%=solic%> -  # Registros Encontrados: <%=estado1.size()%></font></b></td>
                    </tr>
                    
                    <tr> 
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Software</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Versi&oacute;n</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha compra</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha vencimiento</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Vigencia</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>No. Licencias</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Costo compra</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Licencia</b></font></td>

                    </tr>
                 <%    
                  for ( int m = 0 ; m < estado1.size() ; m++ ){
                        resu = (Vector)estado1.elementAt(m);%>
                   <script>
                   
                    </script>
                        <tr bgcolor="#CCCCCC"> 
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(1)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(2)%></b></font></div></td>    
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(3)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(4)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(5)%></b></font></div></td>    
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(6)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(7)%></b></font></div></td>
                        <td width="5%" height="48" ><div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=resu.elementAt(8)%></b></font></div></td>
                    </tr>
                    
                  <%}%>
                  <tr bgcolor="#99CCFF"> 
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td> 
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      <td width="5%" >&nbsp;</td>
                      
                </td>
              </tr>
                <%  }%>
                       
              
            </table>
              <%}else{%>
                
                <br>
          <%}%>

    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
  </tr>
</table>
            <%}else{%>
           <center><b>Usted no tiene acceso a esta opci�n</b></center>
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
					defaultBg	: 'img/6.jpg',
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
                <script Language="javascript">
                            function TableToExcel()
                            {
                            var strCopy = document.getElementById("MyTable").innerHTML;
                            window.clipboardData.setData("Text", strCopy);
                            var objExcel = new ActiveXObject ("Excel.Application");
                            objExcel.visible = true;

                            var objWorkbook = objExcel.Workbooks.Add;
                            var objWorksheet = objWorkbook.Worksheets(1);
                            objWorksheet.Paste;
                            }
                </script>
    </body>
</html>