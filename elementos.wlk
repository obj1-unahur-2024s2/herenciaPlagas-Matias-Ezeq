class Hogar{
    var mugre
    const comfort

    method esBueno() = mugre <= comfort * 0.5

    method recibirAtaque(plaga){
        mugre += plaga.nivelDeDanio()
    }
}

class Huerta{
    var produccion

    method esBueno() = produccion > nivelMinimoDeProduccion.valor()

    method recibirAtaque(plaga){
        produccion -= plaga.nivelDeDanio() * 0.1
        if (plaga.transmiteEnfermedades()){
            produccion -= 10
        }
    }
}

object nivelMinimoDeProduccion{
    var property valor = 0
}

class Mascota{
    var salud

    method esBueno() = salud > 250

     method recibirAtaque(plaga){
        if (plaga.transmiteEnfermedades()){
            salud = 0.max(salud - plaga.nivelDeDanio())
        }
    }
}

class Barrio{
    const property elementos = []

    method esCopado() = self.elementosBuenos() > self.elementosNoBuenos()

    method elementosBuenos() = elementos.count({elemento => elemento.esBueno()})

    method elementosNoBuenos() = elementos.count({elemento => !elemento.esBueno()})
}