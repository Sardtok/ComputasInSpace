class Bullet {
  float a, dist;
  
  Bullet() {
    this.a = angle;
    this.dist = 50;
  }
  
  void draw() {
    dist += 6.7;
    pushMatrix();
    rotate(a);
    ellipse(dist, 0, 10, 10);
    popMatrix();
  }
}

