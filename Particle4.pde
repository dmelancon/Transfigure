class Particle4 {
  PVector velocity;
  PVector acceleration;
  PVector location;
  float lifespan;
  color C;
  float size;

  Particle4(float x, float y, float z, color _C, float _size) {
    acceleration = new PVector(0, 1, 0);
    velocity = PVector.random3D();
    velocity.mult(4);
    location = new PVector(x, y, z);
    lifespan = random(10);
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
    fill(C,150);
    noStroke();
    if (random(1)>.5) {
      if (random(1)>.5) {
        pushMatrix();
        translate(location.x, location.y, location.z);
        triangle(0, 0, 0, size+5, size+5, 0);
        popMatrix();
      }
      else {
        pushMatrix();
        translate(location.x, location.y, location.z);
        triangle(0, 0, 0, size+5, size+5, size+5);
        popMatrix();
      }
    }
    else {
      if (random(1)>.5) {
        if (random(1)>.5) {
          pushMatrix();
          translate(location.x, location.y, location.z);
          triangle(0, size+5, size+5, 0, size+5, size+5);
          popMatrix();
        }
        else {  
          pushMatrix();
          translate(location.x, location.y, location.z);
          triangle(0, 0, 0, size+5, size+5, 0);
          popMatrix();
        }
      }
      //      if (size>0) {
      //        size --;
      //      }
      //      else {
      //        size = 1;
      //      }
    }
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

