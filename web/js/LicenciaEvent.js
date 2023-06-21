    
$(document).ready(function(){
// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
$('#dependencia').on('change', function(){                                       // TIPO DEPENDENCIA

    /* Capturo el valor seleccionado en la lista: name="CodArea" id="dependencia" */
    var cod_depend = $("#dependencia").val();                                           
        
    alert(cod_depend);

    });   
});