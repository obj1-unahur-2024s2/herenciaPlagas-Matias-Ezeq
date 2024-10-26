class Plaga{
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10
    method atacar(elemento){
        poblacion += poblacion * 0.1
        elemento.recibirAtaque(self)
    }
}

class Cucarachas inherits Plaga{
    var pesoPromedio
    method nivelDeDanio() = poblacion * 0.5

    override method transmiteEnfermedades() = super() and pesoPromedio >= 10

    override method atacar(elemento){
        super(elemento)
        pesoPromedio += 2
    }
}

class Mosquitos inherits Plaga{
    method nivelDeDanio() = poblacion

    override method transmiteEnfermedades() = super() and poblacion % 3 == 0
}

class Pulgas inherits Plaga{
    method nivelDeDanio() = poblacion * 2
}

class Garrapatas inherits Pulgas{
    override method atacar(elemento){
        poblacion += poblacion * 0.2
    }
}