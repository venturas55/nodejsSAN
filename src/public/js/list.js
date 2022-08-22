//FUNCION SOLO PARA CONTAR FILAS EN VISTA 'balizas/list.hbs'
document.getElementById("myInput").addEventListener("keyup", contar2);

function contar() {
    var numElem = document.getElementsByClassName("hidden").length;
    console.log(numElem);
}

async function contar2() {
    var x = await document.getElementsByClassName("fila");
    var ocultos = 0;
     for (var i = 0; i < x.length; i++) {
         if (await window.getComputedStyle(x[i]).display === "none") {
            ocultos++;
        }
    }
    document.getElementById("suma2").innerHTML= ocultos;
}