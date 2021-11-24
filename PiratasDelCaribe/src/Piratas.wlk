class Pirata {
	var property energia
	
	method poderDeMandato()
	method disminuirALaMitad()
		method aumentarEnergia(valor){
		energia += valor
	}
	method disminuirEnergia(valor){
		energia -= valor
	}
	
	method piratasFuertes(){
		return self.poderDeMandato() >= 100
	}
	method pirataDebil(){
		return energia < 20
	}
}

class Guerrero inherits Pirata{
	const poderDePelea
	var property vitalida
	
	override method poderDeMandato(){
		return poderDePelea * vitalida
	}
	method clase(){
		return "Guerrero"
	}
	override method disminuirALaMitad(){
		vitalida -= vitalida/2
	}
}
class Navegador inherits Pirata{
	var property inteligencia 
	
	override method poderDeMandato(){
		return inteligencia * inteligencia
	}
	method clase(){
		return "Navegador"
	}
	override method disminuirALaMitad(){
		inteligencia -= inteligencia/2
	}
}
class Cocinero inherits Pirata{
	var property moral
	var property ingredientesQuePosee = []
	
	override method poderDeMandato(){
		return moral * ingredientesQuePosee.size()
	}
	method clase(){
		return "Cocinero"
	}
	override method disminuirALaMitad(){
		moral -= moral/2
	}
}

object jackSparrow inherits Pirata(energia = 500){
	const poderDePelea = 200
	var property inteligencia = 300
	var property ingredientesQuePosee = ["botella de ron"]
	
	override method disminuirALaMitad(){
		inteligencia -= inteligencia/2
	}
	override method poderDeMandato(){
		return energia*poderDePelea*inteligencia
	}
	
	method tomarRon(pirata){
		self.aumentarEnergia(100)
		pirata.disminuirEnergia(10)
		if(pirata.clase() == "Cocinero"){
			const ingredienteRobado = pirata.ingredientesQuePosee().anyOne()
			ingredientesQuePosee.add(ingredienteRobado)
		}
	}
	
}
class MonstruosHumanoides inherits Pirata{
	var property poderDePelea
	override method poderDeMandato(){
		return poderDePelea
	}
	override method disminuirALaMitad(){}
}