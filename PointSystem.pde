class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<Particle2> particles2;
  ArrayList<Particle3> particles3;
  ArrayList<Particle4> particles4;
  ArrayList<Particle5> particles5;
  ArrayList<Particle6> particles6;

  int steps = 9;
  boolean intact = true;
  int[]   depthMap;
  int bubbles = 0;
  float count = 1;
  int counter = 0;
  PVector[] realWorldMap;  
  int user1=1;
  int user2=1; 
  int user3=1;
  int user4=1;
  int user5=1; 
  int user6=1;



  ParticleSystem() {
    particles = new ArrayList<Particle>();
    particles2 = new ArrayList<Particle2>();
    particles3 = new ArrayList<Particle3>();
    particles4 = new ArrayList<Particle4>();
    particles5 = new ArrayList<Particle5>();
    particles6 = new ArrayList<Particle6>();
  }

  void addParticle(float x, float y, float z, color C, float size) {
    particles.add(new Particle(x, y, z, C, size));
  }
  void addParticle2(float x, float y, float z, color C, float size) {
    particles2.add(new Particle2(x, y, z, C, size));
  }
  void addParticle3(float x, float y, float z, color C, float size) {
    particles3.add(new Particle3(x, y, z, C, size));
  }
  void addParticle4(float x, float y, float z, color C, float size) {
    particles4.add(new Particle4(x, y, z, C, size));
  }
  void addParticle5(float x, float y, float z, float px, float py, float pz, color C, float size) {
    particles5.add(new Particle5(x, y, z, px, py, pz, C, size));
  }
  void addParticle6(float x, float y, float z, color C, float size) {
    particles6.add(new Particle6(x, y, z, C, size));
  }




  void setUser() {

    user1=(int)random(1, 7);
    user2=(int)random(1, 7); 
    while (user2 == user1) {
     user2 = (int)random(1, 7);
    }
    while (user3 == user2 || user3 == user1) {
      user3 = (int)random(1, 7);
    }
    while (user4 == user3 || user4==user2 || user4==user1) {
      user4 = (int)random(1, 7);
    }
    while (user5 ==user4 || user5==user3||user5==user2 || user5 == user1) {
      user5 = (int)random(1, 7);
    }
    while (user6 == user5 || user6==user4 || user6==user3 || user6==user2 || user6 ==user1) {
      user6 = (int)random(1, 7);
    }
    println("1:" + user1);
    println("2:" +user2);
    println("3:" +user3);
    println("4:" +user4);
    println("5:" +user5);
    println("6:" +user6);
  }
  void run() {
    for (int i = particles3.size()-1; i >= 0; i--) {
      Particle3 p = (Particle3) particles3.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles3.remove(i);
        bubbles --;
      }
    }
    for (int i = particles2.size()-1; i >= 0; i--) {
      Particle2 p = (Particle2) particles2.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles2.remove(i);
        bubbles --;
      }
    }
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles.remove(i);
        bubbles --;
      }
    }
    for (int i = particles4.size()-1; i >= 0; i--) {
      Particle4 p = (Particle4) particles4.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles4.remove(i);
        bubbles --;
      }
    }
    for (int i = particles5.size()-1; i >= 0; i--) {
      Particle5 p = (Particle5) particles5.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles5.remove(i);
        bubbles --;
      }
    }
    for (int i = particles6.size()-1; i >= 0; i--) {
      Particle6 p = (Particle6) particles6.get(i);
      p.run();
      // p.display();
      if (p.isDead()) {
        particles6.remove(i);
        bubbles --;
      }
    }
  }

  void shatter() {

    counter ++;
    realWorldMap = context.depthMapRealWorld();    
    depthMap = context.depthMap();
    int     index;
    PVector realWorldPoint;
    PVector lastPoint;
    for (int _y=0;_y < context.depthHeight();_y+=steps)
    {
      for (int _x=0;_x < context.depthWidth();_x+=steps)
      {

        index = _x + _y * context.depthWidth();
        int depthNum;
        float size;
        depthNum = depthMap[index];
        realWorldPoint = realWorldMap[index];
        size = depthNum/110;
        color C= context.rgbImage().pixels[index];
        float px, py, pz;
        if (index>=steps) {
          lastPoint = realWorldMap[index-steps];
          px = lastPoint.x;
          py = lastPoint.y;
          pz = lastPoint.z;
        }
        else {
          px = realWorldPoint.x;
          py = realWorldPoint.y;
          pz = realWorldPoint.z;
        }
        int[]   userMap = context.userMap();
        float x =realWorldPoint.x;
        float y =realWorldPoint.y;
        float z =realWorldPoint.z; 
        constrain(userMap[index], 0, 6); 

        if (userMap[index] > 0) {
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user1) { 
            addParticle(x, y, z, C, size);
          }
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user2) {
            addParticle2(x, y, z, C, size);
          }
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user3 ) {
            addParticle3(x, y, z, C, size);
          }
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user4) {
            addParticle4(x, y, z, C, 40);
          }
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user5 ) {
            addParticle5(x, y, z, px, py, pz, C, 40);
          }
          if (depthMap[index] > threshold && depthMap[index] <farThreshold && userMap[index] == user6 ) {    
            addParticle6(x, y, z, C, size);
          }
        }
      }
    }
    intact = false;
  }

  void update() {
    if (!intact) {
      for (Particle p : particles) {
        p.update();
      }
      for (Particle2 p : particles2) {
        p.update();
      }
      for (Particle3 p : particles3) {
        p.update();
      }
      for (Particle4 p : particles4) {
        p.update();
      }
      for (Particle5 p : particles5) {
        p.update();
      }
      for (Particle6 p : particles6) {
        p.update();
      }
    }
  }
}

