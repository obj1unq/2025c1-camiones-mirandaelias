object knightRider {
	
	method peso() {
		 return 300 }

	method nivelPeligrosidad() {
		 return 10 }

	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 
	
/*	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 
	 */
}

object bumblebee {
var property estado = auto
	method peso() {
	  return 300
	}

	method nivelPeligrosidad() {
	  estado.nivelPeligrosidad()
	}

	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 

	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
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

	method peso() {
  		return cant * pesoLadrillo
}

	method nivelPeligrosidad() {
  		return cant
}

	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 

	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 

}

object arenaGranel {
  
  method peso() {
	return
  }

  method nivelPeligrosidad() {
	return 1
  }

   method pesoEsPar(){
		return self.peso() % 2 == 0 
	}

	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	}  
	
}

object bateria {
  
  method peso() {
	return
  }

  method nivelPeligrosidad() {
	
  }
  
  method pesoEsPar(){
	return self.peso() % 2 == 0 
	} 

  method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 

}

object misiles {
  
}

object contenedor {
	
	method peso() {
	  return 
	}

	method nivelPeligrosidad() {
	  return 
	}

	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 

	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 

}

object residuos {
  	method peso() {
	  return 
	}

	method nivelPeligrosidad() {
	  return 
	}
	
	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 

	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 
}

object embalaje {
  	method peso() {
	  return 
	}

	method nivelPeligrosidad() {
	  return 
	}

	method pesoEsPar(){
		return self.peso() % 2 == 0 
	} 
	method pesoEsIgualAlDado(peso){
		return self.peso() == peso
	} 

}