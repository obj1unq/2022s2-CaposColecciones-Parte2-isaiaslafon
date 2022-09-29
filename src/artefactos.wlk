import capos.*

object espada{
	var fueUsada = false
	
	method poderQueAporta(personaje){
		return personaje.poderBase() * self.factorDePoder()
	}	
	
	method factorDePoder(){
		return if(fueUsada) 0.5 else 1 
	}
	
	method usar(){
		fueUsada = true
	}
}

object collar {
	var usos = 0
	const poderBase = 3
	
	method poderQueAporta(personaje){
		return poderBase + self.extraQueAporta(personaje)
	}	
	
	method extraQueAporta(personaje){
		return  if(personaje.poderBase() > 6) usos else 0
	}
	
	method usar(){
		usos += 1
	}
}

object armadura {
	method poderQueAporta(personaje){
		return 6
	}	
	
	method usar(){ 
		//No hace nada. 	
	}
}

object libro {
	var property hechizos = []
	
	method poderQueAporta(personaje){
		return if(self.quedanHechizos()) {
					self.hechizoActual().poderDeHechizo(personaje)
			   } else 0
	}	
	
	method hechizoActual() {
		return hechizos.first()
	}
	
	method quedanHechizos(){
		return not hechizos.isEmpty()
	}
	
	method usar(){ 
	 	//hechizos = hechizos.drop(1)
	 	hechizos.remove(self.hechizoActual())
	}
}


object bendicion {
	method poderDeHechizo(personaje){
		return 4
	}
	
}

object invisibilidad {
	method poderDeHechizo(personaje){
		return personaje.poderBase()
	}
	
}

object invocacion {
	method poderDeHechizo(personaje){
		return personaje.artefactoMasPoderosoEnCasa().poderQueAporta(personaje)
	}
	
	
}