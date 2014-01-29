class Particle6 {
  PVector velocity;
  PVector acceleration;
  PVector location;
  float lifespan;
  color C;
  float size;

  Particle6(float x, float y, float z, color _C, float _size) {
  acceleration = new PVector(0,1, 0);
    velocity = PVector.random3D();
    velocity.mult(4);
    location = new PVector(x, y, z);
    lifespan = 1;
    C = _C;
    size = _size;

  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
  
    lifespan -= 1.0;
  }
  void display() {
     
 strokeWeight(5);
    stroke(random(127,255), random(127,255), random(127,255));
    point(location.x, location.y, location.z);
   if (size>0){
     size --;}
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

