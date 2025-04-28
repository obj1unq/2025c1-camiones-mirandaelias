object knightRider {
	var property bulto = 1  

	method peso() {
			return 300 
			}

	method nivelPeligrosidad() {
			return 10 
			}
//Esto puede ser que lo tenga que hacer el obj pero simplifico con la funcion en camion
	/*method pesoEsPar(){
		return self.peso() % 2 == 0 
	} */
	
	method bulto() {
		return bulto
	}

	method cambiosAlCargar(){
		//No hace nada
	}

}

object bumblebee {
var property estado = auto
var property bulto = 2
	
	method peso() {
		return 300
	}

	method nivelPeligrosidad() {
		estado.nivelPeligrosidad()
	}
	method bulto() {
		return bulto
	}	

	method cambiosAlCargar(){
		self.estado(robot)

	}

}

object auto {

	method nivelPeligrosidad() {
		return 15
	}

	
}

object robot {
	method nivelPeligrosidad() {
		return 30
	}
}

object paqueteLadrillos {
var property cant  = 0
const pesoLadrillo = 2
var property bulto = 0
var property agregadoAlCargar =12 

	method peso() {
  		return cant * pesoLadrillo
}

	method nivelPeligrosidad() {
		return cant
}
	method bulto() {
		return 	if(cant <= 100 ) self.bulto(1) 
				if (cant <= 300 ) self.bulto(2) 
				else self.bulto(3)
	}

	method cambiosAlCargar(){
		cant =+ agregadoAlCargar
	}
}

object arenaGranel {
var property pesoArena = 100 
var property bulto = 1
var property agregadoAlCargar = 20 
	
	method peso() {
	return pesoArena
	}

	method nivelPeligrosidad() {
	return 1
	}

	method bulto() {
		return bulto
	}

	method cambiosAlCargar(){
		pesoArena =+ agregadoAlCargar
	}
	
}

object bateria {
var property tieneMisiles = true 
var property bulto = 0

	method peso() {
		return if (tieneMisiles) 300 else 200
	}

	method nivelPeligrosidad() {
		return if (tieneMisiles) 100 else 0
	}

	method bulto() {
		return if(tieneMisiles) self.bulto(1) else  self.bulto(2)
	}

	method cambiosAlCargar(){
		self.tieneMisiles(true)
	}

}



object contenedor {
var property cosasEnContenedor = #{} 
var property bulto = cosasEnContenedor.sum({cosa => cosa.bulto()})
const cosaMasPeligrosa = cosasEnContenedor.max({cosa=> cosa.nivelPeligrosidad()})
	
	method peso() {
		return 100 + self.pesoDeCosasDentro()
	}

	method pesoDeCosasDentro() {
		return cosasEnContenedor.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return if (cosasEnContenedor.isEmpty()) 0 else cosaMasPeligrosa.nivelPeligrosidad()
	}

	method bulto() {
		return bulto + 1
	}

	method cambiosAlCargar(){
		cosasEnContenedor.forEach({cosa =>cosa.cambiosAlCargar()})
	}

}

object residuos {
var property pesoResiduos = 0 
var property bulto = 1
var property agregadosAlCargar = 15 

	method peso() {
		return pesoResiduos
	}

	method nivelPeligrosidad() {
		return  200
	}

	method bulto() {
		return bulto
	}	

	method cambiosAlCargar(){
		pesoResiduos =+ agregadosAlCargar
	}

}

object embalaje {
var property cosaEmbalada = bumblebee 
var property bulto = 2

	method peso() {
		return cosaEmbalada.peso()
	}

	method nivelPeligrosidad() {
		return cosaEmbalada.nivelPeligrosidad() / 2
	}

	method bulto() {
		return bulto
	}

	method cambiosAlCargar(){
		//No hace nada
	}

}