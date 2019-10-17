class PartB implements Particulas{
  
  float x;
  float y;
  float c1; 
  float c2;
  float c3;
  float t=50;
  
  Body b;
  
  PartB(float x_, float y_, float c1_, float c2_, float c3_){
    this.x=x_;
    this.y=y_;
    this.c1=c1_;
    this.c2=c2_;
    this.c3=c3_;
    
    //definir y configurar body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    //creo mi body
    b = box2d.createBody(bd);
    
    
    //forma de mi cuerpo;
    CircleShape ps = new  CircleShape();
    ps.m_radius = box2d.scalarPixelsToWorld(this.t/2);
    
     //defino mi fixture;
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    //agrego todo al body
    b.createFixture(fd);
    b.setUserData(this);
    
  }
  
  
      void killBody() {
    box2d.destroyBody(b);
  }
  
  boolean done() {
    if (key == 'v') {
      killBody();
      return true;
    }
    return false;
  }

   
   void attract() {
    Vec2 worldTarget = box2d.coordPixelsToWorld(mouseX,mouseY);   
    Vec2 bodyVec = b.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal(ng);
    b.applyForce(worldTarget, bodyVec);
  }
  
   void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
      float distancia=dist(pos.x,pos.y,mouseX,mouseY);
    //println(clu);
    
    if(distancia<t/2){
      if (mousePressed == true) {
          t+=2;
      }
      
      if(key == 'r'){//color R
           c1+=1;
        if(c1>255){
            c1=0;
        }
      }
      
       if(key == 'g'){//color G
           c2+=1;
        if(c2>255){
            c2=0;
        }
      }
      
       if(key == 'b'){//color B
           c3+=1;
        if(c3>255){
            c3=0;
        }
      }  
      
  }
    pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(c1,c2,c3);
    ellipse(0,0,t,t);
    popMatrix();
    
  
    
  } 
} 
