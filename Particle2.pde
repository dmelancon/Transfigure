class Particle2 {
  PVector velocity;
  PVector acceleration;
  PVector location;
  float lifespan;
  color C;
  float size;

  Particle2(float x, float y, float z, color _C, float _size) {
  acceleration = new PVector(0,-2, 0);
    velocity = PVector.random3D();
    velocity.mult(7);
    location = new PVector(x, y, z);
    lifespan = 20;
    C = _C;
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
    lifespan -= 1.0;
  }
  void display() {
     
 strokeWeight(size-5);
    stroke(C,150);
    point(location.x, location.y, location.z);
   if (size>0){
     size -=2;}
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

