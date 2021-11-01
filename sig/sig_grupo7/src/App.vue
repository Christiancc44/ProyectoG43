<template>
  <div id="app" class="container">
    <div class="row" v-if="resultado == '' || resultado == 'error'">
        <div class="col-12 formsesion" >
            <h2 class="title">Inicio de sesión</h2>
            <form v-on:submit="onSubmit">
              <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="usuario" v-model="form.Nombre_Us">
              </div>
              <div class="mb-3">
                <label for="contrasenaUsuario" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="contrasenaUsuario" v-model="form.Contraseña_us">
              </div>
              <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </div>
    
    <div v-else>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">{{textIzq}}</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav   mb-2 mb-lg-0">
              <div v-if="resultado == 'recepcionista'">
                <li class="nav-item" v-on:click="cambiarMensajeIzq('Inicio')">
                  <router-link to="/home" class="nav-link">Inicio</router-link>
                </li>
              </div>
              <div v-if="resultado == 'recepcionista'">
                <li class="nav-item" v-on:click="cambiarMensajeIzq('Afiliado')">
                  <router-link to="/afilaido" class="nav-link">Afiliado</router-link>
                </li>
              </div>
              <div v-if="resultado == 'recepcionista'">
                <li class="nav-item" v-on:click="cambiarMensajeIzq('Entrenador')" >
                  <router-link to="/entrenador" class="nav-link">Entrenador</router-link>
                </li>
              </div>
              <div v-else>
                <li class="nav-item" v-on:click="cambiarMensajeIzq('Reportes')">
                  <router-link to="/reportes" class="nav-link">Reportes</router-link>
                </li>
              </div>
              <li class="nav-item">
                <a class="nav-link" v-on:click="salir">Salir</a>
              </li>
            </ul>
            <span class="navbar-text ms-auto">
              Sistema de información del Gimnasio
            </span>
          </div>
        </div>
      </nav>

      <router-view/>

    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import router from './router'

  export default {
    data: function(){
      return {
        form: {
          Nombre_Us: '',
          Contraseña_us: '',
        },
        resultado: "",
        textIzq: "Home"
      }
    },
    methods: {
      onSubmit(event) {
        event.preventDefault()
        axios.post("http://localhost:8000/usuario/",JSON.stringify(this.form),{
          headers: { 
              'Accept': 'application/json',
              'Content-Type': 'application/json'
          },
        })
        .then(res => { 
          this.resultado = res.data 
          if(res.data == "error"){
            alert("Revise el usuario y la contraseña")
          }else{
            if(res.data == "recepcionista"){
              router.push({ path: '/home' })
            }else{
              router.push({ path: '/reportes' })
            }
          }
        })
        .catch(err => {
          alert(err); 
        })
      },
      salir(){
        this.resultado = ""
      },
      cambiarMensajeIzq(text){
        this.textIzq = text
      }
    }
  }
</script>

<style>

</style>