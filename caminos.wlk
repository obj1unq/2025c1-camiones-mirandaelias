object rutaNueve {
var property nivelPeligrosidadAdmitido = 11
    method soportaCamion(camion){

        return camion.puedeCircularEnRuta(nivelPeligrosidadAdmitido)
    } 
}

object caminosVecinales {
var property pesoMaximoAdmitido = 100

    method soportaCamion(camion) {
        return camion.pesoTotal()< pesoMaximoAdmitido
    }
}