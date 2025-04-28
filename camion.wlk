import wollok.vm.*
import cosas.*
import caminos.*
import destinos.*

object camion {
	const property cosas = #{}
	const tara = 1000
		
	method cargar(cosa) {
		cosa.cambiosAlCargar()
		cosas.add(cosa)
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
		self.validarElDeNivel(nivel)
		return cosas.first({cosa =>cosa.nivelPeligrosidad() == nivel})
	}

	method validarElDeNivel(nivel) {
	if(not cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})){
		self.error ("No hay ninguna cosa que tenga ese nivel de peligrosidad")
	}
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
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa){
		return cosas.filter({cosa1 => cosa1.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (not self.excedidoDePeso() and 
			self.cargaSuperaPeligrosidad(nivelMaximoPeligrosidad))

	}

	method cargaSuperaPeligrosidad(nivelMaximoPeligrosidad){
		return cosas.all({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})	
	}


/* 	Estaba sumando todas la peligrosidad de las cosas y comparandolas con nivelMaximoPeligrosidad
	En realidad tengo que ver que ningun objeto supere el maximo de peligrosidad
	method cargaSuperaPeligrosidad(nivelMaximoPeligrosidad){
		return self.peligrosidadTotal() > nivelMaximoPeligrosidad
		
	} 

	method peligrosidadTotal() {
		return cosas.sum({cosa=> cosa.peligrosidad()})
	}
	*/

	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa=> cosa.peso()> min and cosa.peso() < max})
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}
	method pesos() {
		return (cosas.map({cosa => cosa.peso()})).toList()
	}
	method totalBultos(){
		return cosas.sum({cosa => cosa.bulto()})
	}

	method transportar(destino,camino) {
		self.validarTransporte(destino,camino)
		self.transportarCosas(destino,camino)
	}

	method validarTransporte(destino,camino) {
		if(not self.puedeTransportar(destino,camino)){
			self.error ("No puede transportar ")
		}
	}

	method puedeTransportar(destino,camino){
		return not self.excedidoDePeso() and
				self.totalBultos() < destino.bultosASoportar() and
				camino.soportaCamion(self)
	}

	method transportarCosas(destino,camino) {
		destino.deposito().addAll(cosas)
	}
}

