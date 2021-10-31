<template>
  <div class="container">
    <div v-if="estadoEditar==true">
      <button type="button" class="btn btn-primary" v-on:click="cambiarEstadoEditar">Agregar</button>
      <div class="row">
        <div class="col-12">
          <table class="table alinear">
            <thead>
              <tr>
                <th>id</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Edad</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="entrenador in entrenador" :key="entrenador.ID">
                <td>{{entrenador.ID}}</td>
                <td>{{entrenador.nombres_entrenador}} 
                <td>{{entrenador.apellidos_entrenador}}</td>
                <td>{{anioActual - entrenador.anio}}</td>
                <td>
                  <button type="button" class="btn btn-warning" v-on:click="editentrenador(entrenador.id_entrenador)">
                      <i class="fas fa-edit"></i>
                    </button>
                  <button type="button" class="btn btn-danger" v-on:click="cambentrenador(entrenador.id_entrenador)">
                      <i class="fas fa-user-minus"></i>
                  </button>
                </td>
              </tr>
            </tbody>
        </table>
        </div>
      </div>
    </div>
    <div v-else>
      <button type="button" class="btn btn-primary" v-on:click="cambiarEstadoEditar">Volver</button>
      <entrenadorAgregar :entrenadorEditarId="idEditar" />
    </div>
  </div>
</template>

<script>
import entrenadorAgregar from '../components/entrenadorAgregar.vue'
import axios from 'axios'

export default {
   components: {
    entrenadorAgregar
  },
  data: function() {
    return {
      estadoEditar: true,
      entrenador: [],
      idEditar: 0,
      anioActual: new Date().getFullYear()
      //solo extraer el año actual.
    }
    },
    methods:{
    cambiarEstadoEditar(){
      this.getentrenador()
      this.idEditar = 0
      this.estadoEditar = !this.estadoEditar
    },
    getentrenador() {
        axios.get("http://localhost:8000/entrenador/")
        .then(res => {  
          this.entrenador = []
          for (let i = 0; i < res.data.length; i++) {
            if(res.data[i].estado_entrenador == true){
              this.entrenador.push(res.data[i])
            }
          }
        })
        .catch(err => {
          alert(err); 
        })
    },
    editentrenador(id){
      this.idEditar = id
      this.estadoEditar = !this.estadoEditar
    },
    cambentrenador(id){
      axios.delete("http://localhost:8000/entrenador/"+id)
      .then(() => {  
        alert("Ok")
        this.getentrenador()
      })
      .catch(err => {
        alert("Ocurrió un error inesperado: "+err); 
      })
    },
   },
    mounted() {
      this.getentrenador()
  }
}
</script>

<style>

</style>