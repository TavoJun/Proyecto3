void pantallas(){
    if(estado<0){
      estado=0;
    }
  
    if(estado>2){
      estado=1;
    }
  
  
  
   switch(estado){
    case 0:
      image(titulo,0,0);//imagen principal
      textSize(50);
      text("Presiona la Tecla D Una Vez Para Continuar", 150, 500);
      fill(random(140,180));
    
    break;
    
    case 1:  
    image(instru,0,0);//instrucciones

    break;
    
    case 2:
    for(Particulas p: particulas){
    p.display();
    p.attract();
    }  
    
     for (int i = particulas.size()-1; i >= 0; i--) {//eliminacion de objetos
    Particulas b = particulas.get(i);
    if (b.done()) {
      particulas.remove(i);
        }
    }
    break;
   
  }

}
