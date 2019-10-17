class PartA implements Particulas{
  
  float x;
  float y;
  float c1; //color R
  float c2; //color G
  float c3; //color B
  float t=15;//tamaño
  float r;//radio
  
  Body b;
  
  PartA(float x_, float y_, float c1_, float c2_, float c3_){
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
    CircleShape ps = new  CircleShape();
    ps.m_radius = box2d.scalarPixelsToWorld(this.r);
    
     //defino mi fixture;
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 0;
    fd.friction = 0;
    fd.restitution = 1.2;
    
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
    r=t;
    pushMatrix();
    translate(pos.x,pos.y);
    //rotate(-angulo);
    noStroke();
    fill(c1,c2,c3);
    rectMode(CENTER);
    ellipse(0,0,t,t);
    popMatrix();
  } 
} 
