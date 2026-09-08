object rolando {
 var mochila = []
 var capacidadMochila = 2
 var hogar = castillo
 var ordenDePosesion = []
 var podeDePelea = 0
 var poderBase = 5
 var enemigos = [caterina, archibaldo, astra]
 
 method artefactoLetalPara(enemigo){
      if(self.hayArtefactoLetal(enemigo)){
         return self.elArtefactoLetalPara(enemigo)
      }else{
         return null
      }
 }
method hayArtefactoLetal(enemigo){
    return mochila.any({artefacto => artefacto.poderDePelea() > enemigo.poderDePelea()})
}

method elArtefactoLetalPara(enemigo){
    return mochila.find({artefacto => artefacto.poderDePelea() > enemigo.poderDePelea()})
}
 method esPoderoso(){
   return self.enemigosAVencer() == enemigos
 }
 method enemigosAVencer(){
   return enemigos.filter({enemigo => enemigo.poderDePelea() < self.poderDePelea()})
 }
 method moradasAConquistar(){
   return self.enemigosAVencer().map({enemigo => enemigo.morada()})
 }
 method pelearBatalla(){
   mochila.forEach({artefacto => artefacto.usarEnBatalla()})
   poderBase = poderBase + 1
 }
 method poderDePelea(){
   return poderBase + mochila.sum({artefacto => artefacto.poderDePelea()})
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
  var artefactos = []
  var poderArtefactos = 0
   method poderArtefactos(){
      return artefactos.map({artefacto => artefacto.poderDePelea()})
   }
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
   method usarEnBatalla(){
      utilizado = true
   }
   method poderDePelea(){
      if(not utilizado){
         return personaje.poderBase()
          
      }else{
         return personaje.poderBase() / 2
      }
   }
}

object libroHechizo{
   var personaje = rolando
   var hechizos = [bendicion, invisibilidad, invocacion]
   method poderDePelea(){
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
}
object bendicion{
   method poderDePelea(){
      return 4
   }
}
object invisibilidad{
   var personaje = rolando
   method poderDePelea(){
      return personaje.poderBase()
   }
}
object invocacion{
   var personaje = rolando
   method poderDePelea(){
      return castillo.poderArtefactos().max()
   }
}


object collar{
   var poderDePelea = 3
   var personaje = rolando
   var cantVecesUtilizado = 0
   method usarEnBatalla(){
      cantVecesUtilizado = cantVecesUtilizado + 1
   }
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
???(preguntar)
*/