<%@page import="BDatos.BDServicios"%>
<%@ page import="java.util.*,java.awt.*,java.io.*,javax.servlet.*,javax.servlet.http.*,java.util.Properties" %>
<%@ page import="java.util.*,java.awt.*,java.io.*, java.text.*, java.net.*;" %>
<%@ include file="secure.jsp" %>
<%@page contentType="text/html"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "https://www.w3.org/TR/html4/loose.dtd">
<% response.setHeader("Cache-Control", "no-cache");
    //Periodo Sig     
    String nro = "0", reasig = "";    
    Vector logs  = new Vector();   
    BDServicios bd = new BDServicios();    
    Vector res = new Vector();
    Vector sol = new Vector();    
    Vector infusu = new Vector();
     
    String usu = session.getAttribute("idusr").toString();
    String rol = session.getAttribute("rol").toString();
    String nombre = session.getAttribute("nomusr").toString();
    Vector usuari = bd.usuario_osiris();   
    
%>
<script language="JavaScript" type="text/JavaScript">
    function cargar()
    {        
        if(!(document.form1.carga[0].selected))
        {
            cargar();            
        }
    }
</script>
<%
    int c = 0;
    String solic = "0";
    String est = "0";
    String usu_con = "0";
    String fecha_ini = "0";
    String fecha_fin = "0";
    String cliente = "0";
//-----------------------------------------------
// Consulta desplegables
    Vector salon = bd.salon();
//-----------------------------------------------
    est = (String) request.getParameter("Estado");
    usu_con = (String) request.getParameter("Usuario");
    fecha_ini = (String) request.getParameter("fechaini");
    fecha_fin = (String) request.getParameter("fechafin");
    cliente = (String) request.getParameter("cliente");

    Vector usuari_es = bd.usuario();

    if (nro != null) {
        if (!(nro.length() == 0)) {
            c = Integer.parseInt(nro);
        }
    }

    if (c != 0) {
        est = Integer.toString(c);
    }
    Vector estado = new Vector();
    if (usu_con != null) {
        estado = bd.ConsultaReporte2(usu_con, fecha_ini, fecha_fin, cliente);
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
            
            //Variables Globales
            var tipo_equipo_g = "";
            var marca_g = "";
            var modelo_g = "";
            
            
            $(document).ready(function(){
            // ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
                $('#sports').change(function(event){  //TIPO EQUIPO
                var sports = $("#sports").val();                                              // Capturo el valor seleccionado en la lista 'Tipo Equipo' (sports)
                                
                //Paso de valor a variable global
                tipo_equipo_g = sports;
                
                //alert('sports : ' + sports);
                //alert('tipo_equpo_g : ' + tipo_equipo_g );                
                
                $.get('ConsultaMarcaAJ',
                {
                    valor : sports,                                                            // Envio parámetros a ConsultaMarcaAJ para realizar el query.
                    tipcon : "0"                                                                
                },
                function(jsonResponse){            
                        var obj_modelo = $('#equipo');                                          // obj_modelo, toma el control del objeto 'equipo' (3-Modelo).
                        obj_modelo.find('option').remove();                                     // remueve los elementos de tipo 'option' que existan en el select 'equipo'.          
                        $('<option>').val("0").text("Seleccione Modelo").appendTo(obj_modelo);  // Asigna el valor del texto para el indice 0.

                        var obj_marca = $('#player');                                           // obj_marca, toma el control del objeto 'player' (2-Marca). 
                        obj_marca.find('option').remove();                                      // remueve los elementos de tipo 'option' que existan en el select 'player'.
                        $('<option>').val("0").text("Seleccione Marca").appendTo(obj_marca);    // Asigna el valor del texto para el indice 0.
                        
                        $.each(jsonResponse, function(index, value){
                        $('<option>').val(value).text(value).appendTo(obj_marca);               // Asigna los valores de la coleccion retornada por el query ('ConsultaMarcaAJ').
                        }); //cierre each()                    
                        }); //cierre llave function, cierre parentesis get()
                        }); //cierre change()
                        
              // -------------------------------------------------------------------------------------------------------------------------------------------------------------------                    
                                    
                $('#player').change(function(event){  //MARCA
                var sports = $("#sports").val();                    //select - Capturo el valor  de la prop. value='' seleccionado en la lista 'Tipo Equipo' (sports)                                                                        
                var sports1 = $("#player").val();                   //select - Capturo el valor seleccionado en la lista 'Marca' (player)
                marca_g = sports1;
                //alert('Marca: ' + sports1);
                //alert('marca_g: ' + marca_g);
                $.get('ConsultaMarcaAJ',
                {
                    valor   : sports,   //se envia Id_TipoEquipo
                    tipcon  : sports1   //se envia la Marca
                },
                function(jsonResponse){                
                        var obj_modelo2 = $('#equipo');                    
                        obj_modelo2.find('option').remove();
                        $('<option>').val("0").text("Seleccione Modelo").appendTo(obj_modelo2);
                        $.each(jsonResponse, function(index, value){
                        $('<option>').val(value).text(value).appendTo(obj_modelo2);
                        }); //cierre each()
                        }); //cierre llave function, cierre parentesis get()
                        }); //cierre change()
                
                //
                $('#equipo').change(function(event){
                    var sports2 = $("#equipo").val();                   //select - Capturo el valor seleccionado en la lista 'Marca' (player)
                    modelo_g = sports2;
                    //alert('Modelo: ' + sports2);
                    //alert('modelo_g: ' + modelo_g);                
                });
                        
            }); //cierre ready()
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

                        <br><br><br>

                        <br><br>

                        <a class="boton_personalizado" href="/ServiOsiris.v2/Consulta_Usuario">Consultar por Usuario</a>
                        <a class="boton_personalizado" href="/ServiOsiris.v2/Consulta_Solic">Consultar por Solicitud</a>
                        <a class="boton_personalizado" href="/ServiOsiris.v2/Consulta_Asign">Consultar por Asignaci&oacute;n</a>
                        <a class="boton_personalizado" href="/ServiOsiris.v2/Horarios">Consultar Horarios</a>
                        <br><br><br><br>

                        <%if ("1".equals("1")) {%> 
                        <table width="80%" border="0"> 
                            <tr> 
                                <td bgcolor="#FFFFFF" width="100%"> 
                            <di>
                                <form name="formulario" method="post">
                                    <table width="100%" border="4" class="table">
                                        <tr> 
                                            <td bgcolor="#FFFFFF" width="10%" > 
                                                <font face="sans-serif" color="#000099"><b><font size="2">Salón / Bodega / Área </font></b></font>
                                            </td>
                                            <td>
                                                <div  class="select">
                                                    <select name="Usuario">
                                                        <%if (usu_con != null && !usu_con.equals("0")) {%>
                                                        <option value="<%=usu_con%>" selected><font face="Times New Roman, Times, serif" size="2"><%=usu_con%></font></option>
                                                            <% }%>           
                                                        <option value="0"><font face="Times New Roman, Times, serif" size="2"> 
                                                            Seleccione</font></option>
                                                            <%if (salon.size() > 0)
                                                            {
                                                              for (int ii = 0; ii < salon.size(); ii++)
                                                              {
                                                                infusu = (Vector) salon.elementAt(ii);%>
                                                                <option value="<%=infusu.elementAt(0)%>"><font face="Times New Roman, Times, serif" size="2"><%=infusu.elementAt(0)%></font></option>
                                                            <%}
                                                            }%>

                                                    </select>
                                                </div>
                                            </td>
                                            <td bgcolor="#FFFFFF" width="10%" > 
                                                <font face="sans-serif" color="#000099"><b><font size="2">Tipo Equipo </font></b></font>
                                            </td>
                                            <td>
                                                <div class="select">
                                                    <select name="fechaini" class="textocom" id="sports">
                                                        <%if (fecha_ini != null && !fecha_ini.equals("0")) {%>
                                                        <%if (fecha_ini.equals("1")) {%>
                                                        <option value="<%=fecha_ini%>" selected>All in One</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("2")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Portatil</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("3")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Desktop</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("4")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Pantalla</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("5")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Teléfono</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("6")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Escaner</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("7")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Video Beam</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("8")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Switch</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("9")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Servidor</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("10")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Televisor</option>  
                                                        <% }%>
                                                        <%if (fecha_ini.equals("13")) {%>
                                                        <option value="<%=fecha_ini%>" selected>Cámara</option>  
                                                        <% }%>
                                                        <% }%>
                                                        <option value="0">Seleccione el Tipo de Equipo</option>
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
                                                        <option value="11">Sistema Inálambrico Kramer</option>
                                                        <option value="13">Cámara</option>
                                                    </select>  
                                                </div>
                                            </td>
                                            <td bgcolor="#FFFFFF" width="10%" > 
                                                <font face="sans-serif" color="#000099"><b><font size="2">Marca: </font></b></font>
                                            </td>
                                            <td>
                                                <div class="select">
                                                    <select name="fechafin" class="textocom" id="player">                                                      
                                                        <option value="0">Seleccione Tipo</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td bgcolor="#FFFFFF" width="10%" > 
                                                <font face="sans-serif" color="#000099"><b><font size="2">Modelo: </font></b></font>
                                            </td>
                                            <td width="20%">
                                                <div class="select">
                                                    <select name="cliente" class="textocom" id="equipo">
                                                        <option value="0">Seleccione Tipo y Marca</option>                      
                                                    </select>
                                                </div>
                                            </td>
                                            <td bgcolor="#FFFFFF" width="20%" > 
                                                <font face="sans-serif" color="#000099"><b><font size="2">Estado del Equipo:</font></b></font>
                                            </td>
                                            <td>
                                                <select name="Estado" class="Select">
                                                    <option value="2">Todos</option>
                                                    <option value="1">Activo</option>
                                                    <option value="0">Inactivo</option>
                                                </select>                                                    
                                            </td>
                                            <td>
                                                <button type="submit" value="Enviar Consulta" onclick="cargar();">Enviar Consulta</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>             

                                <!-- Botón de Exportacion a excel-->                            
                                <button onclick="window.location.href = '/ServiOsiris.v2/ExportarInv?formato=excel&fechaini=<%=fecha_ini%>&fechafin=<%=fecha_fin%>&Usuario=<%=usu_con%>&Estado=<%=est%>&cliente=<%=cliente%>'">Exportar a Excel</button>

                                </div>
                                </td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#FFFFFF" colspan="2" valign="top">&nbsp;</td>
                                </tr>
                                <tr> 
                                    <td bgcolor="#FFFFFF" colspan="2" valign="top"> 
                                        <%if (estado.size() > 0) {%>
                                        <div id="MyTable">
                                            <table width="100%" border="1" bordercolor="#FFFFFF" align="top">
                                                <tr> 
                                                    <td align="center" bgcolor="#6699CC" colspan="19"><b><font size="3" color="#FFFFFF" >INVENTARIO  # Registros Encontrados: <%=estado.size()%></font></b></td>
                                                </tr>
                                                <tr> 
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Serial</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>PlacaInventario</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Estado</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>FechaCompra</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>MesesGarantia</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>PuntoRed</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>HostDominio</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>MacAddress</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Marca</b></font></td>                   
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Modelo</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Tipo Equipo</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Ubicación</b></font></td>
                                                    <!---<td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Observaciones</b></font></td> --->
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable Salón</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Salón / Bodega / Área</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Aprobado por:</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario Crea</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Crea</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Detalle Último Log</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Último Log</b></font></td>
                                                    <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario Último Log</b></font></td>
                                                    <td width="3%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Detalle</b></font></td>
                                                </tr>
                                                <%                                                         
                                                        for (int m = 0; m < estado.size(); m++) {
                                                                res = (Vector) estado.elementAt(m);                               
                                                                logs = bd.ConsultaLogs((String) res.elementAt(0));
                                                                if(logs.size()>0){
                                                                     Vector aux2 = (Vector) logs.elementAt(0);                                              
                                                        
                                                %>
                                                <tr bgcolor="#CCCCCC">
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(0)%></b></font></div>
                                                    </td>
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
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(9)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(10)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(11)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(18)%></b></font></div>
                                                    </td>
                                                    <!---<td width="5%" height="48" > 
                                                      <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(12)%></b></font></div>
                                                    </td>-->
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(13)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(14)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(15)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(16)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(17)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=aux2.elementAt(2)%></b></font></div>
                                                    </td>
                                                    
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=aux2.elementAt(3)%></b></font></div>
                                                    </td>
                                                    <td width="5%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><b></b><%=aux2.elementAt(4)%></font></div>
                                                    </td>
                                                    <td width="3%" height="48" > 
                                                        <div align="center"><font face="sans-serif" size="2" color="#000099"><a href="/ServiOsiris.v2/ActInvent?ideq=<%=res.elementAt(0)%>"><img src="img/detalle.png" width="20" height="22" border="0"></a></font></div>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                <%}%>                                                
                                                <tr bgcolor="#99CCFF"> 
                                                    <td width="5%" >&nbsp;</td>
                                                    <td width="5%">&nbsp;</td>
                                                    <td width="5%">&nbsp;</td>
                                                    <td width="5%">&nbsp;</td>
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
                                        <%} else if (c != 9) {%>
                                        <br>
                                        <%}%>
                                    </td>
                                </tr>
                        </table>
                        <%} else {%>

                        <br>
                        <%}%>

                        </td>
                        <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
                        </tr>
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
            
            // evaluar!
            alert('tipo_equipo_g : ' + tipo_equipo_g);
            alert('marca_g : ' + marca_g);
            alert('modelo_g : ' + modelo_g);
            
            }
        </script>
    </body>
</html>