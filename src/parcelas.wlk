import plantas.*

class Parcela{
	const property largo
	const property ancho
	const property horasDeSol
	const property plantas = []
	
	method superficie() = largo *  ancho
 	method cantMaxima(){
 		var cant = 0
 		if( ancho > largo ) cant = self.superficie() / 5
 		else cant = self.superficie() / ( 3 + largo )
 		
 		return cant
 	}
 	
 	method tieneComplicaciones() = plantas.any({p => p.horasDeSolToleradas() < horasDeSol })
 
 	
 	method puedePlantar(planta){
 		if(self.hayEspacio() and self.toleraSol( planta.horasDeSolToleradas()) ){
 			plantas.add(planta)
 		}else{
 			self.error("No puede ser plantada")
 		}
	
	}
	//auxiliares
	method hayEspacio() = plantas.size() < self.cantMaxima() 
	method toleraSol(tolerancia) = (horasDeSol - tolerancia) < 2 

	method tienePlantaDeAltura(altura) = plantas.any({p => p.altura() > altura })
	method totalPlantas() = plantas.size()
	//method porcentajePlantasAsociadas() = 
}


////5 ASOCIACION DE PLANTAS
class ParcelaEcologica inherits Parcela{
	method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.parcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	method seAsociaBien(planta) = plantas.size() <= 2 and planta.esFuerte()
}

object inta{
	const property parcelas = []
	
	method agregarParcela(parcela){ parcelas.add(parcela) } 
	
	method promedioPlantas(){
		const plantas = parcelas.sum({ p => p.totalPlantas() })
		return plantas / parcelas.size() 
	}
	
	
	//method masAutosustentable(){}
	//NO LO PUDE RESOLVERRRR :(
	
	
}



