import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
		
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
	  return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}
	method elDeNivel(nivel){
	  return cosas
	}

	method pesoTotal(){
	  return self.pesoDeCarga() + tara
	}

	method pesoDeCarga(){
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
		 self.cargaSuperaPeligrosidad(nivelMaximoPeligrosidad))
	}

	method cargaSuperaPeligrosidad(nivelMaximoPeligrosidad){
		return self.peligrosidadTotal() > nivelMaximoPeligrosidad
		
	} 

	method peligrosidadTotal() {
		return cosas.sum({cosa=> cosa.peligrosidad()})
	}
}
