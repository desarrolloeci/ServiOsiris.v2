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
  Vector usuari = bd.usuario_osiris();
   %>
<script language="JavaScript" type="text/JavaScript">
   
    function cargar()
    {
        if(!(document.form1.carga[0].selected))
        {
            document.form1.action='RepInventario';  
            document.form1.submit();
        }
    }
</script>
<%
int c = 0;
String solic        = "0";
String est          = "0";
String usu_con      = "0";
String fecha_ini    = "0";
String fecha_fin    = "0";
String cliente      = "0";
//-----------------------------------------------
// Consulta desplegables
Vector salon = bd.salon();

//-----------------------------------------------
 est            = (String) request.getParameter("Estado");
 usu_con        = (String) request.getParameter("Usuario");
 fecha_ini      = (String) request.getParameter("fechaini");
 fecha_fin      = (String) request.getParameter("fechafin");
 cliente        = (String) request.getParameter("cliente");
 
 
 Vector usuari_es = bd.usuario();
 
 if (nro != null )  {
     if (!(nro.length() == 0))
           c = Integer.parseInt(nro);
     }

if( c != 0){
 est = Integer.toString(c);
}
 Vector estado = new Vector();
 if (usu_con != null )  {
    estado = bd.ConsultaReporte2(usu_con, fecha_ini, fecha_fin, cliente) ;
    }

 String formato = request.getParameter("formato");      
 // PrintWriter oout = response.getWriter();
  if ((formato != null) && (formato.equals("excel"))) {
     response.setContentType("application/vnd.ms-excel");
     response.setHeader("Content-Disposition", "attachment; filename=\"Inventario" + ".xls\"");
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
    </head>
    <body>
 
    <div class="container">
          
<div class="content">               

                    <%if("1".equals("1" )){%> 
               <table width="90%" border="0"> 
              <tr> 
                <td bgcolor="#FFFFFF" width="100%"> 
                                                      
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
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Observaciones</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Salón / Bodega</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Aprobado por:</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Usuario Crea</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Fecha Crea</b></font></td>
                      <td width="5%" bgcolor="#99CCFF" height="15"><font face="sans-serif" size="2" color="#000099"><b>Responsable Salon</b></font></td>
                      
                    </tr>
                    <% for ( int m = 0 ; m < estado.size() ; m++ ){
                        res = (Vector)estado.elementAt(m);
                    %>
                    <tr> 
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
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(12)%></b></font></div>
                        </td>
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
                          <div align="center"><font face="sans-serif" size="2" color="#000099"><b><%=res.elementAt(18)%></b></font></div>
                        </td>
                    </tr>
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
                  <%}else if(c!=9){%>
                  <br>
                  <%}%>
                </td>
              </tr>
              
            </table>
              <%}else{%>
                
                <br>
          <%}%>

    </td>
    <td background="img/portal_r2_c4.jpg" style="background-repeat:repeat-y" width="34">&nbsp;</td>
  </tr>
</table>
                   	
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