import vagones.*

class Formacion {

	const property vagones = []
	const property locomotoras = []

	method agregarLocomotora(locomotora) {
		locomotoras.add(locomotora)
	}

	method agregarVagon(vagon) {
		vagones.add(vagon)
	}

	method cuantosVagonesLivianosTiene() = vagones.count{ vagon => vagon.pesoMaximo() < 2500 }

	method velocidadMaxima() = (locomotoras.min{ locomotora => locomotora.velocidadMaxima() }).velocidadMaxima()

	method esEficiente() = locomotoras.all{ locomotora => locomotora.arrastreUtil() > locomotora.peso() * 5 }

	method arrastreTotal() = locomotoras.sum{ locomotora => locomotora.arrastreUtil() }

	method pesoMaximoTotalVagones() = vagones.sum{ vagon => vagon.pesoMaximo() }

	method puedeMoverse() = self.arrastreTotal() >= self.pesoMaximoTotalVagones()

	method cuantosKilosDeEmpujeLeFaltan() {
		if (self.puedeMoverse()) {
			return 0
		} else {
			return self.pesoMaximoTotalVagones() - self.arrastreTotal()
		}
	}

	method vagonMasPesado() = vagones.max{ vagon => vagon.pesoMaximo() }

	method esCompleja() = self.tieneMasDe20Unidades() || self.pesoTotal() > 10000

	method tieneMasDe20Unidades() = vagones.size() + locomotoras.size() > 20

	method pesoMaximoTotalLocomotoras() = locomotoras.sum{ locomotora => locomotora.pesoMaximo() }

	method pesoTotal() = self.pesoMaximoTotalVagones() + self.pesoMaximoTotalLocomotoras()

	method estaBienArmada() = self.puedeMoverse()

	method totalPasajeros() = vagones.sum{ vagon => vagon.cantidadDePasajerosQueTransporta() }

	method totalBanios() = vagones.sum{ vagon => vagon.cantidadDeBanios() }

	method todosLosVagonesSonLivianos() = self.cuantosVagonesLivianosTiene() == vagones.size()

}

class FormacionDeCortaDistancia inherits Formacion {

	override method estaBienArmada() = super() && !self.esCompleja()

	method limiteVelocidad() = 60

}

class FormacionDeLargaDistancia inherits Formacion {

	var property uneDosCiudadesGrandes = true

	// Lo hice asi simple, porque el enunaciado no especifica nada sobre las ciudades
	override method estaBienArmada() = super() && self.tieneSuficientesBanios()

	method tieneSuficientesBanios() = self.totalPasajeros() / 50 <= self.totalBanios()

	method limiteVelocidad() {
		if (self.uneDosCiudadesGrandes()) {
			return 200
		} else {
			return 150
		}
	}

}

class FormacionDeAltaVelocidad inherits FormacionDeLargaDistancia {

	override method estaBienArmada() = self.velocidadMaxima() >= 250 && self.todosLosVagonesSonLivianos()

}

