class Particle3 {
  PVector velocity;
  PVector acceleration;
  PVector location;
  float lifespan;

  float size;
color c = color(255,0,0);
  Particle3(float x, float y, float z, color _C, float _size) {
acceleration = new PVector(0,1,0);
    float vx = randomGaussian()*0.3;
    float vy = randomGaussian()*0.3 ;
    velocity = new PVector(vx,vy);
    location = new PVector(x, y, z);
    lifespan = 40;
  
    size = _size;

  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2;
  }
  void display() {
    strokeWeight(random(20,size));
    if (random(1)>.5){
    stroke(c,100);}
    else{
    stroke(c, 10);}
    point(location.x, location.y, location.z);
    c =(color(0,220)) ;
    if (size>0){
     size -=1;}
    else{
      size = 1;}
  
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

