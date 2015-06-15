class Ship {
  float angle;
  float dist;
  
  Ship(float angle) {
    this.angle = angle;
    this.dist = width + 50;
  }
  
  void draw() {
    dist -= 5;
    pushMatrix();
    rotate(angle);
    image(shipImage, dist, 0, 32, 32);
    popMatrix();
  }
}
