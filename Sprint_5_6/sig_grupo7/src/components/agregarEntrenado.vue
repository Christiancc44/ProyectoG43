<template>
    <div>
    <form v-on:submit="onSubmit">
        <div class="form-floating mb-3">
              <input class="form-control" type="text" id="pnombre" v-model="form.nombres_entrenado">
              <label for="pnombre">Nombres</label>
            </div>

            
            <div class="form-floating mb-3">
              <input class="form-control" type="text" id="papellido" v-model="form.apellidos_entrenador">
              <label for="papellido">Apellidos</label>
            </div>
            
            <div class="form-floating mb-3">
              <input class="form-control" type="text" id="tacademico" v-model="form.especialidad_entrenador">
              <label for="tacademico">Especialidad</label>
            </div>
            
            <div class="form-floating mb-3">
              <input class="form-control" type="text" id="anio" v-model="form.añoNacimiento_entrenador">
              <label for="anio">Año de Nacimiento</label>
            </div>
            
            <div class="form-floating mb-3">
              <input class="form-control" type="number" id="telefono" v-model="form.telefono_entrenador">
              <label for="telefono">Teléfono</label>
            </div>
            
            <div class="form-floating mb-3">
              <input class="form-control" type="text" id="barrio" v-model="form.barrio_entrenador">
              <label for="barrio">Barrio</label>
            </div>
        <br>
        <br>
        <br>
        <br>
        <div v-if="entrenadorEditarId>0">
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
    name: 'agregarEntrenado',
    props: {
        entrenadorEditarId: Number
    },
    data: function () {
      return {
        form: {
            ID: 0,
            nombres_entrenado: "",
            apellidos_entrenador: "",
            especialidad_entrenador: "",
            añoNacimiento_entrenador: "",
            telefono_entrenador: "",
            barrio_entrenador: ""
        },
        mensajeInfo: 'Se guardó correctamente',
        estadoMsgInf: 'display: none;'
      }
    },
    methods: {
        onSubmit(event) {
            event.preventDefault()
            if (this.verficarCampos()) {
                alert("Llene todos los campos")
            } else {
                if(this.entrenadorEditarId==0){
                    this.guardarEntrenador()
                }else{
                    this.editarEntrenador()
                }
            }
            this.form.ID= 0,
            this.form.nombres_entrenado= "",
            this.form.apellidos_entrenador= "",
            this.form.especialidad_entrenador= "",
            this.form.añoNacimiento_entrenador= "",
            this.form.telefono_entrenador "",
            this.form.barrio_entrenador= ""
        },
        traerDatosEntrenador() {
            axios.get("http://localhost:8000/entrenador/"+this.entrenadorEditarId)
            .then(res => {  
                this.form.nombres_entrenado= res.data.nombres_entrenado
                this.form.apellidos_entrenador= res.data.apellidos_entrenador
                this.form.especialidad_entrenador= res.data.especialidad_entrenador
                this.form.añoNacimiento_entrenador= res.data.añoNacimiento_entrenador
                this.form.telefono_entrenador= res.data.telefono_entrenador
                this.form.barrio_entrenador= res.data.barrio_entrenador
            })
            .catch(err => {
            alert(err); 
            })
             },
        guardarEntrenador(){
            axios.post("http://localhost:8000/entrenador/",JSON.stringify(this.form),{
                headers: { 
                    'Accept': 'application/json',
                    'Content-Type': 'application/json' 
                }
            })
            .then(() => {  
                this.estadoMsgInf= 'display: block;'
            })
            .catch(err => {
                alert(err); 
            })
        },
        editarDocente(){
            this.form.id_entrenador = this.entrenadorEditarId
            axios.post("http://localhost:8000/entrenador/",JSON.stringify(this.form),{
            headers: { 
                'Accept': 'application/json',
                'Content-Type': 'application/json' 
            },
            })
            .then(()=> {
                this.estadoMsgInf= 'display: block;'
            })
            .catch(err => {
                alert(err); 
            })
        },
        verficarCampos(){
            return
            this.form.nombres_entrenado== "" ||
            this.form.apellidos_entrenador== "" ||
            this.form.especialidad_entrenador== "" ||
            this.form.añoNacimiento_entrenador== "" ||
            this.form.telefono_entrenador== "" ||
            this.form.barrio_entrenador== "" 
        }
    },
    mounted() {
      if (this.entrenadorEditarId != 0) {//si tiene algo para modificar,
          this.traerDatosEntrenador()
          //para llenar la información de los datos cuando va a editar.
      }
    }
  }
</script>

<style>

</style>