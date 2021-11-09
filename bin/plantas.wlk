

class Planta {
	const property anioObtencion
	var property altura

	method horasDeSolToleradas()
	method esFuerte() = self.horasDeSolToleradas() > 10
	method daSemillas() = self.esFuerte()
}


class Menta inherits Planta{
	
	override method horasDeSolToleradas() = 6
	override method daSemillas() = super() or altura > 0.4
	method espacio() = altura * 3
	
	///PARCELAS IDEALES
	method parcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta{
	
	override method horasDeSolToleradas(){
		var horas = 0
		if( altura < 0.5 ) horas = 6 
		else if( altura.between(0.5, 1) ) horas = 7
		else if( altura > 1) horas = 9
		
		return horas
	}
	
	method obtencionReciente() = anioObtencion > 2007
	override method daSemillas() = super() or (self.obtencionReciente() and altura > 1)
	method espacio() = altura / 2	 

	///PARCELAS IDEALES
	method parcelaIdeal(parcela) = parcela.horasDeSol() == self.horasDeSolToleradas()
}


class Quinoa inherits Planta{
	var property horasDeSolToleradas
	
	override method horasDeSolToleradas() = horasDeSolToleradas
	override method daSemillas() = super() or self.obtencionAntigua()
	method espacio() = 0.5
	
	//auxiliar
	method obtencionAntigua() = anioObtencion < 2005

	///PARCELAS IDEALES
	method parcelaIdeal(parcela) = not parcela.tienePlantaDeAltura(1.5)

}


////////2. VARIABLES

class SojaTransgenica inherits Soja{
	
	override method daSemillas() = false

	///PARCELAS IDEALES
	override method parcelaIdeal(parcela) = parcela.cantMaxima() == 1
}


class Hierbabuena inherits Menta{
	override method espacio() = super() * 2
}













