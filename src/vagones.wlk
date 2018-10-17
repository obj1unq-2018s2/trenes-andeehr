class VagonDePasajeros {
	var property largo
	var property ancho
	var property cantidadDeBanios
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
	method cantidadDeBanios() = 0
}

class Locomotora {
	var property peso
	var property pesoMaximo
	var property velocidadMaxima
	method arrastreUtil() = pesoMaximo - peso
	
}