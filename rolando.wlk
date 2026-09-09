object rolando {
 const mochila = #{}
 var capacidadMochila = 2
 var hogar = castillo
 const ordenDePosesion = []
 var poderBase = 5

method elArtefactoLetalPara(enemigo){
    return mochila.find({artefacto => self.esArtefactoEsLetalPara(artefacto, enemigo) })
}
method esArtefactoEsLetalPara(artefacto, enemigo){
   return artefacto.poderDePelea(self) > enemigo.poderDePelea()
}
 method pelearBatalla(){
   mochila.forEach({artefacto => artefacto.usarEnBatalla()})
   poderBase = poderBase + 1
 }
 method poderDePelea(){
   return poderBase + mochila.sum({artefacto => artefacto.poderDePelea(self)})
 }
method poderBase(_poderBase){
   poderBase = _poderBase
}
method poderBase(){
 return poderBase
} 
method capacidadMochila(_capacidadMochila){
    capacidadMochila = _capacidadMochila
 }
 method llegarAHogar() {
   hogar.artefactos(mochila)
   mochila.clear()
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
object erethia {
  const enemigos = #{caterina, archibaldo, astra}
  method enemigos(){
   return enemigos
  }
  method enemigo(enemigo){
   enemigos.add(enemigo)
  }
 method esPoderoso(personaje){
   return enemigos.all({enemigo => enemigo.poderDePelea() < personaje.poderDePelea()})
 }
 method enemigosVencidos(personaje){
   return enemigos.filter({enemigo => enemigo.poderDePelea() < personaje.poderDePelea()})
 }
 method moradasConquistadas(personaje){
   return self.enemigosVencidos(personaje).map({enemigo => enemigo.morada()})
 }
}
object caterina {
  var poderDePelea = 28
  var morada = fortalezaAcero
  method poderDePelea(){
    return poderDePelea
  }
  method morada(){
    return morada
  }
}
object archibaldo {
  var poderDePelea = 16
  var morada = palacioMarmol
  method poderDePelea(){
    return poderDePelea
  }
   method morada(){
    return morada
  }
}
object astra {
  var poderDePelea = 14
  var morada = torreMarfil
  method poderDePelea(){
    return poderDePelea
  }
  method morada(){
    return morada
  }
}
object fortalezaAcero{
}
object palacioMarmol{  
}
object torreMarfil{  
}
object castillo {
  const artefactos = #{}
   method poderArtefactos(){
      return artefactos.map({artefacto => artefacto.poderDePelea(rolando)})
   }
method artefactos(_artefactos){
   artefactos.addAll(_artefactos)
}
method artefactos(){
      return artefactos
}
}
object espada{
   var utilizado = false
   method usarEnBatalla(){
      utilizado = true
   }
   method poderDePelea(personaje){
      if(not utilizado){
         return personaje.poderBase()
          
      }else{
         return personaje.poderBase() / 2
      }
   }
}
object libroHechizo{
   const hechizos = [bendicion, invisibilidad, invocacion]
   method poderDePelea(personaje){
      if(hechizos.isEmpty()){
         return 0
      }else{
         return hechizos.first().poderDePelea()
      }
   }
   method usarEnBatalla(){
      hechizos.remove(hechizos.first())
   }
   method hechizos(){
      return hechizos
   }
   method agregarHechizo(hechizo){
      hechizos.add(hechizo)
   }
   method quitarHechizo(hechizo){
      hechizos.remove(hechizo)
   }
}
object bendicion{
   method poderDePelea(personaje){
      return 4
   }
}
object invisibilidad{
   method poderDePelea(personaje){
      return personaje.poderBase()
   }
}
object invocacion{
   method poderDePelea(personaje){
      return castillo.poderArtefactos().max()
   }
}
object collar{
   var poderDePelea = 3
   var cantVecesUtilizado = 0
   method usarEnBatalla(){
      cantVecesUtilizado = cantVecesUtilizado + 1
   }
   method poderDePelea(personaje){
      if(personaje.poderBase() > 6){
          return poderDePelea + cantVecesUtilizado
      }else{
          return poderDePelea 
      }
   }
}
object armadura{
   const poderDePelea = 6
   method poderDePelea(personaje){
      return poderDePelea
   }
   method usarEnBatalla(){

   }
}

/*
Elegir un polimorfismo e indicar:

a)¿Qué nombre le pondrías al tipo de los objetos polimórficos?
b)¿Qué mensajes componen ese tipo?
c) ¿Quiénes usan los mensajes polimórficos?

a)artefacto 
b)poderDePelea() y usarEnBatalla()
c)rolando 


Respecto de las colecciones definidas:

1)¿Qué tipo de elementos contienen?
2)¿Qué mensaje polimórfico (perteneciente al tipo mencionado) utilizaste dentro de un bloque?

1)
mochila         = artefacto 
castillo        = artefacto
ordenDePosesion = artefacto
enemigos        = enemigo

2)poderDePelea 
*/