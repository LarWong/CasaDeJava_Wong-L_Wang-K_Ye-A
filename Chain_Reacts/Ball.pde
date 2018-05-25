class Ball {
  //final vars
  //================state variables===============
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  //==============================================
  final static float CHANGE_FACTOR = 0.25;
  final static int MAX_RADIUS = 100;

  //vars (ball info & movement)
  int state;
  color c;
  float xCor;
  float yCor;
  float xVel;
  float yVel;
  float size;

  //constructor with state variable
  Ball(int sVar) {
    this.state = sVar;
    this.xVel = random(1, 10);
    this.yVel = random(1, 10);
    this.c = color(random(0, 256), random(0, 256), random(0, 256));
    this.size = random(10, 50);
    this.xCor = random(this.size, 600 - this.size);
    this.yCor = random(this.size, 600 - this.size);
  }

  //overloaded constructor (when clicking) with state variable and mouse coordinates
  Ball(int sVar, int mX, int mY) {
    this(sVar);
    this.xCor = mX;
    this.yCor = mY;
  }

  //determines what the ball does
  void move() {
    //each ball checks for collision
    collide();

    //if the ball does not collide with growing/shrinking ball
    if (this.state == MOVING) {
      //law of reflection
      if (this.xCor > 600 - this.size || this.xCor < this.size) this.xVel = -this.xVel;
      if (this.yCor > 600 - this.size || this.yCor < this.size) this.yVel = -this.yVel;

      //normal moving
      this.xCor += this.xVel;
      this.yCor += this.yVel;
    }

    //if the ball grows
    if (this.state == GROWING) {
      this.xVel = 0;
      this.yVel = 0;
      if (this.size < MAX_RADIUS)
        this.size += 0.5;
      else
        this.state = SHRINKING; //state change
    }

    //if the ball shrinks
    if (this.state == SHRINKING) {
      if (this.size > 0)
        this.size -= 0.5;
      else
        this.state = DEAD; //state change
    }

    //the ball is dead
    if (this.state == DEAD)
      this.size = 0; //emulates a dead ball
    fill(this.c);
    ellipse(this.xCor, this.yCor, this.size, this.size);
  }

  //if the ball touches other ball
  void collide() {
    //the ball has to be moving to stop
    if (this.state == 0) {
      //checks if there is a growing/shrinking ball touching this ball
      for (int other = 0; other < existingBalls; other++) {
        if (balls[other].state != MOVING && balls[other].state != DEAD) {
          //from edge of circle to edge of circle
          float distance = dist(this.xCor, this.yCor, balls[other].xCor, balls[other].xCor);
          if (distance <= CHANGE_FACTOR * (this.size + balls[other].size)) {
            this.state = 1; //state change
          }
        }
      }
    }
  }
}
