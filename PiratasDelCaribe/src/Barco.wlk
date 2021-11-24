import Piratas.*
class Barco {
	var property resistencia
	var property poderDeFuego
	var property municiones
	var property tripulacion = []
	
	method capitan(){
		return tripulacion.max{pirata => pirata.poderDeMandato()}
	}
	method poderDeMandoTotal(){
		return tripulacion.map{pirata => pirata.poderDeMandato()}.sum()
	}
	method barcoMasFuerte(barco){
		return self.poderDeMandoTotal() > barco.poderDeMandoTotal()
	}
	method enfrentamiento(barco){
		if(self.barcoMasFuerte(barco)){
			self.capturarTripulacio(barco)
			barco.herirTripulacion()
			barco.alAguaPato()
			barco.desolarUnBarco()
		}else{
			barco.capturarTripulacio(self)
			self.herirTripulacion()
			self.alAguaPato()
			self.desolarUnBarco()	
		}	
	}
	method capturarTripulacio(barco){
		tripulacion += barco.tripulacionFuertes()
	}
	method tripulacionFuertes(){
		return tripulacion.filter{pirata => pirata.piratasFuertes()}
	}
	method alAguaPato(){
		tripulacion = []
	}
	method herirTripulacion(){
		tripulacion.forEach{pirtas => pirtas.disminuirALaMitad()}
	}
	method desolarUnBarco(){
		resistencia = 0
		poderDeFuego = 0
		municiones = 0
	}
	method ataqueACanionasos(cantidad,barco){
		if(municiones > cantidad){
		self.disminuirMunicion(cantidad)
		barco.disminuirResistencia(50*cantidad)
		barco.eliminarTripulacionBlanda()
		}else{
			self.error("¡municiones insuficientes!")
		}
	}
	method disminuirMunicion(valor){
		municiones -= valor 
	}
	method eliminarTripulacionBlanda(){
		tripulacion = tripulacion.filter{pirata => ! pirata.pirataDebil()}
	}
	method aumentarPorsentajeDeMuniciones(porcentaje){
		municiones += municiones*porcentaje/100
	}
	method aumentarPoderDeFuego(valor){
		poderDeFuego += valor
	}
	method duplicarTripulacion(){
		tripulacion += tripulacion
	}
	method disminuirResistencia(valor){
		resistencia -= valor
	}
}

