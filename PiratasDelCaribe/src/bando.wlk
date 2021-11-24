import Barco.*
class Bando {
	var property flota = [] 
	
	method unirBarco(barco){
		flota.add(barco)
	}
	method abandonarFlota(unBarco){
		flota = flota.filter{barco => barco != unBarco}
	}

}

object armadaInglesa inherits Bando{
	override method unirBarco(barco){
		super(barco)
		barco.aumentarPorsentajeDeMuniciones(30)
	}
}
object unionPirata inherits Bando{
	override method unirBarco(barco){
		super(barco)
		barco.aumentarPoderDeFuego(60)
	}
}
object armadaDelHolandesErrante inherits Bando{
	override method unirBarco(barco){
		super(barco)
		barco.duplicarTripulacion()
	}
}

