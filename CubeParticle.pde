ArrayList<Particle> particles;
int MAX_PARTICLES = 100;
float MAX_SPEED = 4.0;
float SHRINK_RATE = 0.15;
int boxsize = 250;
boolean moveflag = false;

void setup(){
  size(800,600,P3D);
  background(0);
  noFill();
  particles = new ArrayList<Particle>();
  
  for(int i = 0;i < MAX_PARTICLES;i++){
    PVector location = new PVector(random(-boxsize/2,boxsize/2),random(-boxsize/2,boxsize/2),random(-boxsize/2,boxsize/2));
    particles.add(new Particle(location));
  }  
}

void draw(){
  background(0);
  translate(width/2,height/2);
  rotateY(frameCount/200.0);
  strokeWeight(2);
  stroke(255);
  noFill();
  box(boxsize);

  for(int i = 0;i < particles.size(); i++){
     if(particles.get(i).isDead()){
     } else {
      particles.get(i).draw();
      
      if(moveflag == true){
        particles.get(i).move();
      }   
    }
  } 
}

void mousePressed(){
  moveflag = true;
}

class Particle{
  PVector velocity = new PVector(random(-MAX_SPEED,MAX_SPEED),random(-MAX_SPEED,MAX_SPEED));
  PVector pos;
  float size = random(20);
  color c = color(random(255),random(255),255);
  boolean isDead;

  Particle(PVector origin)
  {
    pos = origin;
    isDead = false;
  }
  
  void draw(){
    fill(c);
    noStroke();
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    //ellipse(pos.x,pos.y,size,size);
    sphere(size);
    popMatrix();
  }
  
  void move(){
    pos.add(velocity);
    size -= SHRINK_RATE;
  }
  
  boolean isDead(){
    if(size <= 0){
      isDead = true;
      return true;
    } else {
      isDead = false;
      return false;
    }
  }
}
