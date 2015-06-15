import java.util.*;

PImage cx;
PImage shipImage;
float angle;
boolean leftDown, rightDown, upDown, downDown;

ArrayList<Ship> ships;
ArrayList<Bullet> bullets;
ArrayList<Particle> particles;

void setup() {
  size(800, 600);
  imageMode(CENTER);
  cx = loadImage("data/CX.png");
  shipImage = loadImage("data/PirateMkII-pxl.png");
  ships = new ArrayList<Ship>();
  bullets = new ArrayList<Bullet>();
  particles = new ArrayList<Particle>();
  noStroke();
}

void draw() {
  if (frameCount % 60 == 0) {
    ships.add(new Ship(random(2 * PI)));
  }
  
  background(0);
  
  if (leftDown) {
    angle -= 0.1;
  }
  if (rightDown) {
    angle += 0.1;
  }
  
  Iterator<Ship> its = ships.iterator();
  Iterator<Bullet> itb = bullets.iterator();
  while(its.hasNext()) {
    Ship ship = its.next();
    boolean stop = false;
    while (itb.hasNext()) {
      Bullet bullet = itb.next();
      if (abs(bullet.dist - ship.dist) < 21) {
        float x1 = cos(bullet.a) * bullet.dist;
        float x2 = cos(ship.angle) * ship.dist;
        float y1 = sin(bullet.a) * bullet.dist;
        float y2 = sin(ship.angle) * ship.dist;
        
        if (dist(x1, y1, x2, y2) < 21) {
          for (int i = 0; i < 24; i++) {
            particles.add(new Particle(x2 + width / 2, y2 + height / 2, random(-5, 5), random(-5, 5)));
          }
          itb.remove();
          its.remove();
          stop = true;
          break;
        }
      }
    }
    if (stop) {
      break;
    }
    if (ship.dist < 50 + 16) {
      return;
    }
  }
  
  translate(width / 2, height / 2);
  pushMatrix();
  rotate(angle);
  image(cx, 0, 0, 100, 100);
  popMatrix();
  
  for (Ship ship : ships) {
    ship.draw();
  }
  
  fill(255, 128, 96);
  for (Bullet bullet : bullets) {
    bullet.draw();
  }
  
  resetMatrix();
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    if(p.draw()) {
      it.remove();
    }
  }
}

void keyPressed() {
  switch(keyCode) {
    case LEFT: leftDown = true; break;
    case RIGHT: rightDown = true; break;
  } 
  if (key == ' ') {
    bullets.add(new Bullet());
  }
}

void keyReleased() {
switch(keyCode) {
    case LEFT: leftDown = false; break;
    case RIGHT: rightDown = false; break;
  } 
}

