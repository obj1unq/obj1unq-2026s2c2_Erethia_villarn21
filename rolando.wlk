object rolando {
 var mochila = []
 var capacidadMochila = 2
 var hogar = castillo
 var ordenDePosesion = []
 var podeDePelea = 0
 var poderBase = 0
 method poderDePelea(){
   return poderBase + mochila.sum{artefacto => artefacto.poderDePelea()}
 }
method poderBase(){
   return poderBase 
}

method poderBase(_poderBase){
   poderBase = _poderBase
}

 method capacidadMochila(_capacidadMochila){
    capacidadMochila = _capacidadMochila
 }
 method llegarAHogar() {
   hogar.artefactos(mochila)
   mochila = []
 }
 method artefactos(){
    return mochila
 } 
 method encontrarArtefacto(artefacto){
    ordenDePosesion.add(artefacto)
    if(mochila.size() < capacidadMochila){
    mochila.add(artefacto)
    }
 }
 method posesiones() {
   return mochila + castillo.artefactos()
 }
 method enPosesion(artefacto){
   return self.posesiones().contains(artefacto)
 }
method ordenDePosesion() {
  return ordenDePosesion
}
}

object castillo {
  var artefactos = []
method artefactos(_artefactos){
   artefactos.addAll(_artefactos)
}
method artefactos(){
      return artefactos
}
}

object espada{
   var poderDePelea = 0
   var personaje = rolando
   var utilizado = false
   method poderDePelea(){
      if(not utilizado){
         return personaje.poderBase()
          
      }else{
         return personaje.poderBase() / 2
      }
   }
   method utilizar(){
      utilizado = true
   }
}

object libroHechizo{
   var personaje = rolando

}

object collar{
   var poderDePelea = 3
   var personaje = rolando
   var cantVecesUtilizado = 0
   method poderDePelea(){
      if(personaje.poderBase() > 6){
          return poderDePelea + cantVecesUtilizado
      }else{
          return poderDePelea 
      }
   }
   method cantVecesUtilizado(cantidad) {
     cantVecesUtilizado = cantidad
   }
}

object armadura{
   const poderDePelea = 6
   var personaje = rolando
   method poderDePelea(){
      return poderDePelea
   }
}