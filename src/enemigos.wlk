object erethia{
	const habitantes = #{archibaldo,caterina,astra}
	
	method enemigosVencibles(personaje){
		return habitantes.filter({enemigo => personaje.puedeVencer(enemigo)})
	}
	
	method moradasConquistables(personaje){
		return self.enemigosVencibles(personaje).map({enemigoVencible => enemigoVencible.morada()}).asSet()
	}
	
	method esPoderoso(personaje){
		return habitantes.all({enemigo => personaje.puedeVencer(enemigo)}) 
	}
		
}

object archibaldo {
	const property morada = palacio

	method poder() { 
		return 16
	}
}

object caterina{
	const property morada = fortaleza
	method poder() { 
		return 28
	}
}


object astra{
	const property morada = torre
	
	method poder() { 
		return 14
	}
	
	method morada(){
		return morada
	}
}

object torre {}

object palacio {}

object fortaleza {} 
