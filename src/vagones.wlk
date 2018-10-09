class VagonDePasajeros {
	const property largo
	const property ancho
	method cantidadDePasajerosQueTransporta() {
		if (ancho <= 2.5) {
			return largo *8
		} else {
			return largo * 10
		}
	}
	method pesoMaximo() = self.cantidadDePasajerosQueTransporta() * 80
}

class VagonDeCarga {
	var property cargaMaxima
	method pesoMaximo() = 160 + cargaMaxima
	method cantidadDePasajerosQueTransporta() = 0
}
