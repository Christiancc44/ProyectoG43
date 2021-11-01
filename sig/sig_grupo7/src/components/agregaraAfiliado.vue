<template>
    <div>
    <form v-on:submit="onSubmit">
        <div class="form-floating mb-3">
            <input v-model="form.nombres_afiliado" class="form-control" type="text" id="pnombre">
            <label for="pnombre">Nombres</label>
        </div>
        
        <div class="form-floating mb-3">
            <input v-model="form.apellido_afiliado" class="form-control" type="text" id="papellido">
            <label for="papellido">Apellidos</label>
        </div>

        <div class="form-floating mb-3">
            <input v-model="form.año_nacimiento_afiliado" class="form-control" type="number" id="añon_afiliado">
            <label for="añon_afiliado">Año Nacimiento</label>
        </div>

        <div class="form-floating mb-3">
            <input v-model="form.telefono_afiliado" class="form-control" type="number" id="telefono">
            <label for="telefono">Teléfono</label>
        </div>

        <div class="form-floating mb-3">
            <input v-model="form.direccion_afiliado" class="form-control" type="text" id="direccion">
            <label for="direccion">Dirección</label>
        </div>



        <div class="form-floating mb-3">
            <input v-model="form.AñoMatricula_afiliado" class="form-control" type="number" id="añoM_afiliado">
            <label for="añoM_afiliado">año</label>
        </div>

        <button type="submit" class="btn btn-primary" id="basicToastBtn">Actualizar</button>
        </div>
        <div v-else>
            <button type="submit" class="btn btn-primary" id="basicToastBtn">Guardar</button>
        </div>
    </form>
    <div :style="estadoMsgInf" class="position-fixed top-0 end-0 p-3">
        <div role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header bg-primary text-light">
                <h5 class="my-0">{{ mensajeInfo }}</h5>
            </div>
        </div>  
    </div>
    </div>
</template>

<script>
    import axios from 'axios'
    export default {
    name: 'afiliadoAgregar',
    props: {
        afiliadoEditarId: Number
    },
    data: function () {
      return {
        form: {
          ID: 0,
          nombres_afiliado: '',
          apellidos_afiliado: '',
          año_nacimiento_afiliado: '',
          telefono_afiliado: '',
          direccion_afiliado: '',
          AñoMatrucula_afiliado: '',
        
        },
        afiliado: [],
        mensajeInfo: 'Se guardó correctamente',
        estadoMsgInf: 'display: none;'//Que no lo muestre
      }
    },
    methods: {
        onSubmit(event) {
            event.preventDefault()
            if (this.verificarCampos()) {
                alert("Verifique que todos los campos esten llenos")
            } else {
                if(this.afiliadoEditarId<0){
                    this.guardarafiliado()
                }else{
                    this.editarafiliado()
                }   
            }
            this.form.nombres_afiliado= '',
            this.form.apellidos_afiliado= '',
            this.form.año_nacimiento_afiliado= '',
            this.form.telefono_afiliado= '',
            this.form.direccion_afiliado= '',
            this.form.AñoMatrucula_afiliado= '',
        },
        getAfiliado() {
            axios.get("http://localhost:8000/afiliado/")
            .then(res => {  
                this.afiliado = res.data
            })
            .catch(err => {
                alert(err); 
            })
        },
        traerDatosafiliado() {
            axios.get("http://localhost:8000/afiliado/"+this.afiliadoEditarId)
            .then(res => {  
                this.form = {
                    nombres_afiliado: res.data.nombres_afiliado,
                    apellidos_afiliado: res.data.apellidos_afiliado,
                    año_nacimiento_afiliado: res.data.año_nacimiento_afiliado,
                    telefono_afiliado: res.data.telefono_afiliado,
                    direccion_afiliado: res.data.direccion_afiliado,
                    AñoMatrucula_afiliado: res.data.AñoMatrucula_afiliado,
                }
            })
            .catch(err => {
            alert(err); 
            })
             },
        guardarafiliado(){
            axios.post("http://localhost:8000/afiliado/",JSON.stringify(this.form),{
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            })
            .then(() => {  
                this.estadoMsgInf= 'display: block;'
            })
            .catch(err => {
                alert(err); 
            })
        },
        editarafiliado(){
            this.form.id_afiliado = this.afiliadoEditarId
            axios.post("http://localhost:8000/afiliado/",JSON.stringify(this.form),{
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            })
            .then(res => {  
                console.log(res);
                this.estadoMsgInf= 'display: block;'//Mostrarlo
            })
            .catch(err => {
                alert(err); 
            })
        },
        verificarCampos(){
            return this.form.nombres_afiliado==''||
            this.form.apellidos_afiliado==''||
            this.form.año_nacimiento_afiliado==''||
            this.form.telefono_afiliado==''||
            this.form.direccion_afiliado==''||
            this.form.AñoMatrucula_afiliado==''||
        },
        mostrarMensaje(text){
            this.mensajeInfo = text
        }
    },
    mounted() {
      this.getAfiliado() //método que actualiza la tabla.
      if (this.afiliadoEditarId != 0) {
          //Si voy actualizar traer datos, porque el props es de quien señaló,
          //a qué id va actualizar.
          this.traerDatosafiliado()
      }
    }
  }
</script>

<style>

</style>