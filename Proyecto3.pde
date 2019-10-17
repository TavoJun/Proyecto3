import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;   
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

ArrayList <Particulas> particulas;

rand uno;
rand dos;
rand tres;
rand cuatro;

float ng=0;
int estado=0;
PImage titulo;
PImage instru;


void setup(){
  background(255);
  fullScreen();
  
  titulo=loadImage("abst.tif");
  instru=loadImage("abs-000177.png");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();
  box2d.setGravity(0,0);
  
  
  particulas = new ArrayList<Particulas>();
  uno = new rand();
  dos = new rand();
  tres = new rand();
  cuatro= new rand();
  
  
}

void draw(){
  
  box2d.step(); 
  pantallas();
  
}
