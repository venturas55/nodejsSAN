
var app = new Vue({
  el: "#alcances",
  data: {
    alcance: 5,
    visibilidad: 8.172,
    tipo: "Nocturna",
    fondo: "Ninguna",
    umbral1: null,
    destello: "0.5",
    coef1: "0.7",
    coef2: "1",
    coef3: "1",
    azul: "no",
  },
  mounted: function () {
    this.calcularAlcance();
  },
  filters: {
    redondeo2: function (value) {
      if (value != null) return value.toFixed(2);
    },
    redondeo6: function (value) {
      if (value != null) return value.toFixed(6);
    },
  },
  methods: {
    calcularAlcance: function () {
      this.coef1 = parseFloat(this.coef1);
      this.coef2 = parseFloat(this.coef2);
      this.coef3 = parseFloat(this.coef3);
      this.visibilidad = parseFloat(this.visibilidad);
      if (this.tipo == 3) a = 0.2;
      else a = 0.1;

      if (isNaN(this.alcance)) alert("calcularAlcance no es un numero");
      else this.alcance = parseFloat(this.alcance);

      if (isNaN(this.destello)) alert("introduzca como destello un numero");
      else this.destello = parseFloat(this.destello);

      switch (this.tipo) {
        case "Nocturna":
          switch (this.fondo) {
            case "Ninguna":
              this.umbral1 = 0.0000002;
              break;
            case "Poca":
              this.umbral1 = 0.000002;
              break;
            case "Considerable":
              this.umbral1 = 0.00002;
              break;
          }
          break;

        case "Diurna":
          this.umbral1 = 0.001;
          break;

        case "Enfilacion":
          switch (this.visibilidad) {
            case 6.246:
              this.visibilidad = 3.888;
              break;
            case 7.469:
              this.visibilidad = 5.22;
              break;
            case 6.839:
              this.visibilidad = 4.68;
              break;
            case 5.76:
              this.visibilidad = 3.78;
              break;
            case 8.172:
              this.visibilidad = 5.775;
              break;
            case 11.699:
              this.visibilidad = 8.549;
              break;
            /*     <!-- 
                                para ENFILACIONES
                                                    <option value="3.888">Cantabrico-Galia</option>
                                                    <option value="5.22">Huelva-Cadiz</option>
                                                    <option value="4.68">Sevilla</option>
                                                    <option value="3.78">Ceuta</option>
                                                    <option value="5.775">Mediterraneo-Baleares</option>
                                                    <option value="8.549">Canarias</option>
                                --> */
          }

          switch (this.fondo) {
            case "Ninguna":
              this.umbral1 = 0.000001;

              break;
            case "Poca":
              this.umbral1 = 0.00001;
              break;
            case "Considerable":
              this.umbral1 = 0.0001;
              break;
          }
          break;
      }
    },
  },
  computed: {
    umbral: function () {
      switch (this.tipo) {
        case "Nocturna":
          switch (this.fondo) {
            case "Ninguna":
              return 0.0000002;
              break;
            case "Poca":
              return 0.000002;
              break;
            case "Considerable":
              return 0.00002;
              break;
          }
          break;

        case "Diurna":
          return 0.001;
          break;

        case "Enfilacion":
          switch (this.fondo) {
            case "Ninguna":
              return 0.000001;

              break;
            case "Poca":
              return 0.00001;
              break;
            case "Considerable":
              return 0.0001;
              break;
          }
          break;
      }
    },
    a: function () {
      if (this.azul == "si" && this.tipo == "Enfilacion") return 0.2;
      else return 0.1;
    },
    Icalculo: function () {
      return (
        3430000 *
        this.alcance *
        this.alcance *
        this.umbral *
        Math.pow(0.05, (-1 * this.alcance) / this.visibilidad)
      ).toFixed(1);
    },
    Ieficaz: function () {
      return (this.Icalculo / this.coef1 / this.coef2 / this.coef3).toFixed(1);
    },
    Iestacionaria: function () {
      return (
        (this.Ieficaz * (parseFloat(this.destello) + this.a)) /
        this.destello
      ).toFixed(1);
    },
  },
});

var app2 = new Vue({
  el: "#coordenadas",
  data: {
    decimal1: "39.65525",
    wgs2: "39º 55.345", //GGº MM.mmm'
    wgs3: "39º 52' 25\" N", //GG° MM' SS.sss&quot; N"
    decimal11: null,
    error1: "no error",
    error2: null,
    error3: null,
    bul: false,
    caracteristica: "",
    destellos: "",
    destellosAcum: "",
  },

  filters: {
    redondeo2: function (value) {
      if (value != null) return value.toFixed(2);
    },
    redondeo6: function (value) {
      if (value != null) return value.toFixed(6);
    },
  },
  methods: {
    dormir: function (milliseconds) {
      var start = new Date().getTime();
      for (var i = 0; i < 1e7; i++) {
        if (new Date().getTime() - start > milliseconds) {
          break;
        }
      }
    },
  },
  computed: {
    resultado1: function () {
      this.bul = "false";
      this.error1 = "";
      this.decimal11 = parseFloat(this.decimal1);
      if (isNaN(this.decimal1)) {
        this.error1 = "Introduzca grados en formato decimal GG.gggg";
        this.bul = "true";
      } else {
        var decarray = this.decimal1.split(".");
        if (decarray.length == 2)
          var decimales = parseFloat("0." + decarray[1]) * 60;
        else this.error1 = "Introduzca gradosen formato decimal GG.gggg";
      }
      return decarray[0] + "º " + decimales.toFixed(3) + "'";
    },
    resultado2: function () {
      this.error2 = "";
      var utmarray = this.wgs2.split(" ");

      var gradosar = utmarray[0].split("º");
      var minsar = utmarray[1].split(".");
      var milar = minsar[1].split("'");
      if (isNaN(gradosar[0]) || isNaN(minsar[0]) || isNaN(milar[0]))
        this.error2 = "Introduzca grados y minutos GGº MM.mmm";
      else {
        var grad = parseFloat(gradosar[0]);
        var min = parseFloat(minsar[0]);
        var mil = parseFloat(milar[0]);
      }

      var decimal = grad + (min + mil / 1000) / 60;

      return decimal.toFixed(6);
    },
    resultado3: function () {
      this.error3 = "";
      var utm = this.wgs3;
      var utmarray = utm.split(/\º|\'|\"|\°/g);

      if (isNaN(utmarray[0]) || isNaN(utmarray[1]) || isNaN(utmarray[2]))
        this.error3 = "Introduzca grados minutos y segundos GGº MM' ss\"";
      else {
        var grados = parseFloat(utmarray[0]);
        var min = parseFloat(utmarray[1]);
        var seg = parseFloat(utmarray[2]);
      }
      var minf = min + seg / 60;
      minf = minf.toFixed(3);
      var decimal = grados + "º " + minf + "'";

      return decimal;
    },
  },
  mounted: function () {},
});
