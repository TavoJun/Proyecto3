void keyPressed(){
  
    if(key == '1'){
      particulas.add(new PartA(mouseX,mouseY,uno.grand(1,255),dos.grand(1,255),tres.grand(1,255)));
    }
    
    if(key == '2'){
      particulas.add(new PartB(mouseX,mouseY,1,1,1));
    }
    
      if(key == '3'){
      particulas.add(new PartC(mouseX,mouseY,uno.grand(1,255),dos.grand(1,255),tres.grand(1,255)));
    }
    
      if(key == '4'){
      particulas.add(new PartD(mouseX,mouseY,uno.grand(1,255),uno.grand(1,255),uno.grand(1,255)));
    }
    
   
     if(key == 'i'){
        saveFrame("abs-######.png");//screanshoot
    }
    
    if(key == 'n'){
      background(255);
    }
    
    if(key == 'p'){
      ng+=100;//atraccion a puntero
    }
    
    if(key == 'o'){
      ng-=100;//atraccion a puntero
    }
    
      if(key == 'ñ'){
      ng+=10;//atraccion a puntero
    }
    
    if(key == 'l'){
      ng-=10;//atraccion a puntero
    }
    
    if(key == 'a'){
      estado-=1;//estado para cambio de pantallas
    }
    
    if(key == 'd'){
      estado+=1;
     background(255);
    }
  
    
  }



  void beginContact(Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();


  if (o1==null || o2==null)
     return;
  
     
  
  if (o2.getClass() == PartC.class) {
    PartC c = (PartC) o2;
    c.c1=uno.grand(1,255);//color R
    c.c2=dos.grand(1,255);//color G
    c.c3=tres.grand(1,255);//color B
    c.t=cuatro.grand(1,50);//tamaño
  }
}


void endContact(Contact cp) {
}
