<template>
    <div class="row">
        <div class="col-12">
          <br>
          <br>
          <button class="btn btn-primary" v-on:click="reporteAfiliado">Reporte Afiliado</button>
          <button class="btn btn-primary" v-on:click="reporteEntrenador">Reporte Entrenador</button>
        </div>
    </div>
</template>

<script>
//npm install jspdf --save
import jsPDF  from "jspdf"
import axios from 'axios'

export default {
    data: function() {
    return {
      doc: new jsPDF(),
      afiliado: "", //llenar una variable String para llenar el reporte.
      entrenador: "" //llenar una variable String para llenar el reporte.
    }
  },
  methods:{
    reporteAfiliado(){
      axios.get("http://localhost:8000/afiliado/")
        .then(res => {  
            this.afiliado= "nombre| apellido| \n"
             this.doc=new jsPDF()
             //volver a instanciar la variable para quedar vacía.
            for (let i = 0; i < res.data.length; i++) {
                this.afiliado += res.data[i].nombres_afiliado+" "
                this.afiliado += res.data[i].apellidos_afiliado+" "
            }
            this.doc.text(this.afiliado,10,30)
            //Coloque el texto, en la posición (10,30), 10 en eje x y 30 en el eje y.
            this.doc.save("reporte.pdf")
        })
        .catch(err => {
            alert(err); 
        })
    },
    reporteEntrenador(){
        axios.get("http://localhost:8000/entrenador/")
        .then(res => {  
            this.entrenador= "nombre|apellido\n"
            this.doc=new jsPDF()
            for (let i = 0; i < res.data.length; i++) {
                this.entrenador += res.data[i].nombres_entrenado+" "
                this.entrenador += res.data[i].apellidos_entrenador+" "
            }
            this.doc.text(this.entrenador,10,30)
            this.doc.save("reporteentrenador.pdf")
        })
        .catch(err => {
            alert(err); 
        })
    }
  },
}
</script>

<style>

</style>