import artefactos.*

object castillo {
	
	const property artefactos = #{}
		
	method agregarArtefactos(_artefactos) {
		artefactos.addAll(_artefactos)		
	}	
	
	method artefactoMasPoderoso(personaje){
		return artefactos.max({artefacto => artefacto.poderQueAporta(personaje)})
	}
}

object rolando {
	var property poderBase = 5
	const property artefactos = #{}
	var property capacidad = 2
	const casa = castillo
	const property historia = []

	method encontrar(artefacto) {
		if(artefactos.size() < capacidad) {
			artefactos.add(artefacto)
		}
		historia.add(artefacto)
	}
	
	method poder(){
		return poderBase + self.poderDeArtefactos()
	}
	
	method poderDeArtefactos(){
		return artefactos.sum({ artefacto => artefacto.poderQueAporta(self)})	
	}
	
	method volverACasa() {
		casa.agregarArtefactos(artefactos)
		artefactos.clear()
	}	
	
	method posesiones() {
		return self.artefactos() + casa.artefactos()
	}
	
	method posee(artefacto) {
		return self.posesiones().contains(artefacto)	
	}
	
	method luchar(){
		self.incrementarPoderBase()
		self.utilizarArtefactos()		
	}
	
	method utilizarArtefactos(){
		artefactos.forEach({artefacto => artefacto.usar()})
	}
	
	method incrementarPoderBase(){
		poderBase += 1
	}
	
	method artefactoMasPoderosoEnCasa(){
		return casa.artefactoMasPoderoso(self)
	}
	
	method tieneArtefactoFatal(enemigo){
		return artefactos.any({artefacto => self.artefactoEsFatal(enemigo, artefacto)})
	}

	method artefactoEsFatal(enemigo,artefacto){ 
		return artefacto.poderQueAporta(self) > enemigo.poder()
	}
	
	method artefactoFatal(enemigo){ 
		return artefactos.find({ artefacto => self.artefactoEsFatal(enemigo,artefacto)})
	}
	
	method puedeVencer(enemigo){
		return enemigo.poder() < self.poder()
	}
	
}

