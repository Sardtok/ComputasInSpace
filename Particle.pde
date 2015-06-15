class Particle {
  int life = 60;
  float x, y, xVel, yVel;
  
  Particle(float x, float y, float xVel, float yVel) {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;
  }
  
  boolean draw() {
    if (life <= 0) {
      return true;
    }
    life--;
    x += xVel;
    y += yVel;
    fill(255 - (60 - life) * 2, 64, 0);
    ellipse(x, y, 50 - (life / 2), 50 - (life / 2));
    return false;
  }
}

