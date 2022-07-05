var botonSearch = document.getElementById("botonBuscar");
botonSearch.addEventListener("click", aBuscar);

function aBuscar(e) {
  e.preventDefault();
  var valor = document.getElementById("inputBuscar").value;
  var filtro = document.getElementById("opcionBuscar").value;
  window.location.href = "/balizas/list/" + filtro + "/" + valor;
}

//======================================
var modal1 = document.getElementById("myModal1");
var modal2 = document.getElementById("myModal2");

function abreModal1() {
  modal1.style.display = "block";
}
function abreModal2() {
  modal2.style.display = "block";
}

function borrarNIF() {
  var NIFforzarBorrado = document.getElementById("NIFforzarBorrado").value;
  window.location.href = "/balizas/delete/" + NIFforzarBorrado;
}

function cierraModal() {
  modal1.style.display = "none";
  modal2.style.display = "none";
}

window.onclick = function (event) {
  console.log("cierra modal");
  if (event.target == modal1) {
    modal1.style.display = "none";
    modal2.style.display = "none";
  }
};
