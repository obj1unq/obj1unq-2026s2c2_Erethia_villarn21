object rolando {
 var mochila = []
 var capacidadMochila = 2
 method capacidadMochila(_capacidadMochila){
    capacidadMochila = _capacidadMochila
 }
 method artefactos(){
    return mochila
 }
 method llevarArtefacto(artefacto){
    if (mochila.size() < capacidadMochila){
        mochila.add(artefacto)
    }
 }
}

object espada{

}

object libroHechizo{

}

object collar{

}

object armadura{

}