import trenes.*
import vagones.*

class Deposito {
	const property formaciones = []
	const property locomotorasSueltas = []
	
	method agregarFormacion(formacion) {
		formaciones.add(formacion)
	}
	method agregarLocomotora(locomotora){
		locomotorasSueltas.add(locomotora)
	}
	method vagonesMasPesados() = formaciones.map {formacion => formacion.vagonMasPesado()}.asSet()
	method necesitaConductorExperimentado() = formaciones.any{formacion => formacion.esCompleja()}
	
	method hayFormacionQueNoPuedaMoverse() = formaciones.any{formacion => !formacion.puedeMoverse()}
	
	method agregarLocomotoraAFormacion() {
		if (self.hayFormacionQueNoPuedaMoverse()) {
			self.agregarLocomotora()
		}
	}
	method agregarLocomotora() {
		var formacion = formaciones.find{formacion => !formacion.puedeMoverse()}
		if (self.hayAlgunaLocomotoraPara(formacion)) {
			formacion.agregarLocomotora(self.unaLocomotoraQueCumplaLaCondicionPara(formacion))
		}
	}
	
	method unaLocomotoraQueCumplaLaCondicionPara(formacion) {
			return locomotorasSueltas.find{locomotora => locomotora.arrastreUtil() >= formacion.cuantosKilosDeEmpujeLeFaltan() }
	}
	
	method hayAlgunaLocomotoraPara(formacion) {
		return locomotorasSueltas.any{locomotora => locomotora.arrastreUtil() >= formacion.cuantosKilosDeEmpujeLeFaltan()}
	}
}