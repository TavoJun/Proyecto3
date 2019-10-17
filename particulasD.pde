class PartD implements Particulas{
  
  float x;
  float y;
  float c1; 
  float c2;
  float c3;
  float t=15;
  float r=0;
  
  Body b;
  
  PartD(float x_, float y_, float c1_, float c2_, float c3_){
    this.x=x_;
    this.y=y_;
    this.c1=c1_;
    this.c2=c2_;
    this.c3=c3_;
    
    //definir y configurar body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    //creo mi body
    b = box2d.createBody(bd);
    
    //condiciones iniciales
    b.setLinearVelocity(new Vec2(0,0));
    b.setAngularVelocity(0);
    
    //forma de mi cuerpo;
    PolygonShape ps = new PolygonShape();
    float anchoBox2d = box2d.scalarPixelsToWorld(this.t);
    float altoBox2d = box2d.scalarPixelsToWorld(this.t);
    ps.setAsBox(anchoBox2d/2,altoBox2d/2);
 
    
     //defino mi fixture;
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 100;
    fd.friction = 50;
    fd.restitution = 0;
    
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
    worldTarget.mulLocal(0);
    b.applyForce(worldTarget, bodyVec);
  }
  
   void display(){
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();
    
    float distancia=dist(pos.x,pos.y,mouseX,mouseY);
    if(distancia<t/2){
      if (mousePressed == true) {
          this.t+=1;
      }
      
      
      if(key == 'r'){
           this.c1+=1;
        if(this.c1>255){
            this.c1=0;
        }
      }
      
       if(key == 'g'){
           this.c2+=1;
        if(this.c2>255){
            this.c2=0;
        }
      }
      
       if(key == 'b'){
           this.c3+=1;
        if(this.c3>255){
            this.c3=0;
        }
      }    
  }
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    stroke(random(1,255),random(1,255),random(1,255));
    fill(this.c1,this.c2,this.c3);
    rectMode(CENTER);
    rect(0,0,this.t,this.t);
    popMatrix();
  } 
} 
