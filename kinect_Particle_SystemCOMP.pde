
import ddf.minim.signals.*;
import ddf.minim.*;


import oscP5.*;
import netP5.*;
import SimpleOpenNI.*;
import controlP5.*;

SimpleOpenNI context;
ControlP5 GUI;
//OscP5 oscP5;
//NetAddress myRemoteLocation;
ParticleSystem ps;
Minim minim;
AudioInput in;
 
PVector      com = new PVector();                                   
PVector      com2d = new PVector();      
float translateWidth = 700;
float translateHeight = -352;
float        zoomF =1.12f;
float        rotX = radians(180);  
float        rotY = radians(0);
float nearThreshold;
float farThreshold;
float threshold;
int     steps    = 2;  
boolean state = false;
int bubbles = 0;
int orbs = 0;

void setup(){
  size(1920, 1080, P3D);
  farThreshold = 8000;
  nearThreshold = 4040;
  threshold = 2177;
  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }   
  context.setMirror(true);
  context. enableDepth();
  context.enableRGB();
  context.alternativeViewPointDepthToImage();
  context.enableUser();
  ps = new ParticleSystem();
  initGUI();  
  ps.setUser();
   minim = new Minim(this);
   minim.debugOn();  
in = minim.getLineIn(Minim.MONO, 256);
}

void draw() {
   
float volume = in.right.level();
if (volume>.3){
 
  ps.setUser();}
//println(volume);
  bubbles = 0;
  background(255);
  pushMatrix();
  scale(zoomF);
  rotateX(rotX);
  rotateY(rotY);
  translate(translateWidth, translateHeight, -1000);
  int[]   depthMap = context.depthMap();
  int[]   userMap = context.userMap();
  PVector realWorldPoint;
  int depthNum;
  PVector[] realWorldMap = context.depthMapRealWorld();
  int     index;
  for (int y=0;y < context.depthHeight();y+=steps)
  {
    for (int x=0;x < context.depthWidth();x+=steps)
    {
      index = x + y * context.depthWidth();
      color ColorFromImage= context.rgbImage().pixels[index];
        if (depthMap[index] > nearThreshold && depthMap[index] <threshold){
        depthNum = depthMap[index];
        realWorldPoint = realWorldMap[index];
        strokeWeight(depthNum/60);
        stroke(ColorFromImage,35);
        point(realWorldPoint.x, realWorldPoint.y, realWorldPoint.z );
        
        
      }
    }
  }

 ps.shatter();
  ps.run(); 
 popMatrix();
  context.update();
}
void initGUI() {
  GUI = new ControlP5(this);
  GUI.addSlider("farThreshold").setPosition(10, 30).setRange(0, 8000);
  GUI.addSlider("threshold").setPosition(10, 50).setRange(0, 8000);
  GUI.addSlider("nearThreshold").setPosition(10, 10).setRange(0, 8000);
  GUI.addSlider("zoomF").setPosition(10, 70).setRange(0, 3);
  GUI.addSlider("rotX").setPosition(10, 90).setRange(0, 2*PI);
  GUI.addSlider("rotY").setPosition(10, 110).setRange(0, 2*PI);
  GUI.addSlider("translateWidth").setPosition(10, 130).setRange(-2*width, 2*width);
  GUI.addSlider("translateHeight").setPosition(10, 150).setRange(-2*height, 2*height);
}

