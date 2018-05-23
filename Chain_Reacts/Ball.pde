class Ball {
  color c;
  float xCor;
  float yCor;
  float xVel;
  float yVel;
  float size;

  Ball() {
    xVel = random(1, 10);
    yVel = random(1, 10);
    c = color(random(0, 256), random(0, 256), random(0, 256));
    size = random(5, 50);
    xCor = random(size, 600 - size);
    yCor = random(size, 600 - size);
  }

  void move() {
    //law of reflection
    if (xCor > 600 - size || xCor < size) xVel = -xVel;
    if (yCor > 600 - size || yCor < size) yVel = -yVel;
    //normal moving
    xCor += xVel;
    yCor += yVel;
  }
}