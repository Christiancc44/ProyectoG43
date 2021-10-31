<template>
  <div class="container">
    <div v-if="estadoEditar">
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
              <tr v-for="afiliado in afiliados" :key="afiliado.id_afiliado">
                <td>{{afiliado.id_afiliado}}</td>
                <td>{{afiliado.nombre_afiliado}}</td>
                <td>{{afiliado.apellido_afiliado}} </td>
                <td>{{anioActual - afiliado.anio_afiliado}}</td>
                <td>
                  <button type="button" class="btn btn-warning" v-on:click="editafiliado(afiliado.id_afiliado)">
                      <i class="fas fa-edit"></i>
                    </button>
                  <button type="button" class="btn btn-danger" v-on:click="cambafiliado(afiliado.id_afiliado)">
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
      <afiliadoAgregar :afiliadoEditarId="idEditar" />
    </div>
  </div>
</template>

<script>
import afiliadoAgregar from '../components/afiliadoAgregar.vue'
import axios from 'axios'

export default {
  mounted() {
      this.getafiliados()
  },
  data: function() {
    return {
      estadoEditar: true,
      afiliados: [],
      idEditar: 0,
      anioActual: new Date().getFullYear()
    }
  },
  methods:{
    cambiarEstadoEditar(){
      this.getafiliados()
      this.idEditar = 0
      this.estadoEditar = !this.estadoEditar
    },
    getafiliados() {
        axios.get("http://localhost:8000/afiliado/")
        .then(res => {  
          this.afiliados = []
          for (let i = 0; i < res.data.length; i++) {
            if(res.data[i].estado_afiliado == true){
              this.afiliados.push(res.data[i])
            }
          }
        })
        .catch(err => {
          alert(err); 
        })
    },
    editafiliado(id){
      this.idEditar = id
      this.estadoEditar = !this.estadoEditar
    },
    cambafiliado(id){
      axios.delete("http://localhost:8000/afiliado/"+id)
      .then(() => {  
        alert("Ok")
        this.getafiliados()
      })
      .catch(err => {
        alert("Ocurrió un error inesperado: "+err); 
      })
    }
  },
  components: {
    afiliadoAgregar
  }
}
</script>

<style>

</style>