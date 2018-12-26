var ingresar=  document.getElementById(boton);
function capturarDatos(){
    var Usuario = document.getElementById("user").value;
    var Clave = document.getElementById("pass").value;
    if (Usuario=="" || Clave==""){
        return 0;
    }else{
        return 1;
    }


}

boton.onclick = function () {
    var r = capturarDatos();
    
    if(r==1){
        console.log("Todo bien");
    }else{
        console.log("Todo mal");
    }
    //document.location.href = 'menuPrincipal.html';

};
