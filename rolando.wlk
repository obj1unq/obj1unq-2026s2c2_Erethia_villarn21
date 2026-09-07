object rolando {
 var mochila = []
 var capacidadMochila = 2
 var hogar = castillo
 var ordenDePosesion = []
 var podeDePelea = 0
 var poderDeMochila = []
 method poderDePelea(){
   return podeDePelea + mochila.sum{artefacto => artefacto.poderDePelea(rolando)}
 }

method poderDePelea(_poderDePelea){
   podeDePelea = _poderDePelea
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
   method poderDePelea(_personaje){
      if(not utilizado){
         return personaje.poderDePelea()
          
      }else{
         return personaje.poderDePelea() / 2
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
   method poderDePelea(_personaje){
      if(personaje.poderDePelea() > 6){
         return poderDePelea +  (1 * cantVecesUtilizado)
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