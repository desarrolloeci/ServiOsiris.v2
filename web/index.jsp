<%-- 
    Document   : index
    Created on : 16/09/2014, 03:29:38 PM
    Author     : Paulina Alvarado
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "https://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link rel="icon" type="image/jpg" href="img/Favicon.png">
<meta charset="UTF-8">

<title>Iniciar Sesi&oacute;n Mesa de Ayuda</title>
<style>
body {
    background: url('img/backNC.jpg') no-repeat center center;
    background-size: cover;
    font-family: Montserrat;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #333;
    margin: 0 auto;
    display: flex;

}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
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
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('https://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('https://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('https://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('https://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
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

</style>

       <%
       response.setHeader("Cache-Control","no-cache");
       String nMsg = request.getParameter("id");
        String mensaje = new String("");
if (nMsg != null) {
            /* Si la sesion no existe */
            HttpSession sesion = request.getSession();
            sesion.invalidate();
        if (nMsg != null) {
            if (nMsg.equals("0")) {
                mensaje = "Usuario o clave incorrecta";
            } else if (nMsg.equals("1")) {
                mensaje = "Falta alguno de los campos";
            } else if (nMsg.equals("2")) {
                mensaje = "El usuario no esta autorizado";
            } else if (nMsg.equals("3")) {
                
            }
            } else if (nMsg.equals("4")) {
                mensaje = "No ha iniciado Sesion";
            }
        }
 %>

</head>

<body>


<div class="login-block">

    <form action="Login" method="post" id="form1">
    <p>&nbsp;</p>
    <fieldset style="margin:auto; width:300px">
    <legend>Ingreso a Mesa de Ayuda - OSIRIS.<br>
    <br>
    </legend>
    <div align="center"><strong><font color="#666666" size="2" face="Times New Roman, Times, serif"><br>
				      
                                      <img src="img/LOGO.jpg" width="220" height="220">
                                      <br><br><br>
                                      <%=mensaje%>
				      <br>
				      <br>
	   </font></strong></div>
  
                                      <input value="${userInfo.displayableId}" readonly="true" name="usr" type="text" id="usr" size="20" placeholder="Usuario"/>
        <br>
        <br>

        <br>
        <br>
    <br>
    <br>
        <br>
        <button type="submit" name="button" id="button" value="Enviar">Ingresar</button>
      </fieldset>
    </form>    
</div>
</body>
</html>