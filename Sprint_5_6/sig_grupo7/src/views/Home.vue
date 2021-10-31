<template>
  <div class="row">
    <div class="col-12 alinear">
      <!-- aqui vamos a crear los enlaces -->
      <p>¡Bienvenido al sistema! Son las <span >{{ hora }}</span></p>
      <router-link to="/estudiante" class="btn btn-primary">Afiliado</router-link>
      <router-link to="/docente" class="btn btn-primary">Entrenador</router-link>
    </div>
  </div>
</template>

<script>
export default({
  mounted() {
    this.hora= ""+this.fechaActual.getHours()+":"+this.fechaActual.getMinutes()+""
  },
  data: function() {
    return {
      fechaActual: new Date(),
      hora: ""
    }
  }
})
</script>
