import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa){
	  self.validarDescargar(cosa)
	  cosas.remove(cosa)
	}

	method validarDescargar(cosa){
		if (not self.estaCargaEnCamion(cosa)){
			self.error ("La carga no esta en el camion")
		}
	} 

	method estaCargaEnCamion(cosa){
		return cosas.contains(cosa)
	}

	method todoPesoPar() {
	  return cosas.all({cosa => cosa.pesoEsPar()})
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.pesoEsIgualAlDado(peso)})
	}
	method elDeNivel(nivel){
	  
	}
	method pesoTotal(){
	  return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel){
		
	}

	method objetosMasPeligrososQue(cosa){

	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (not self.excedidoDePeso() and 
		not self.cargaSuperaPeligrosidad(nivelMaximoPeligrosidad))
	}

	method cargaSuperaPeligrosidad(nivelMaximoPeligrosidad){
		return self.peligrosidadTotal() > nivelMaximoPeligrosidad
		
	} 

	method peligrosidadTotal() {
		return cosas.sum({cosa=> cosa.peligrosidad()})
	}
}
