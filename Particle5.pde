class Particle5 {
  PVector velocity;
  PVector acceleration;
  PVector location;
  float lifespan;
  PVector lastloc;
  color C;
  float size;

  Particle5(float x, float y, float z, float px, float py, float pz, color _C, float _size) {
  acceleration = new PVector(0,0, 0);
//    velocity = PVector.random3D();
      
//
//    velocity.mult(2);
    location = new PVector(x, y, z);
    lastloc = new PVector(px,py,pz);
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
//    velocity.add(acceleration);
//    location.add(velocity);
    lifespan -= 1.0;
  }
  void display() {
     

    stroke(0);
   strokeWeight(1);
   if (lastloc.z>10){
    line(location.x, location.y, location.z, lastloc.x, lastloc.y, lastloc.z);}
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

