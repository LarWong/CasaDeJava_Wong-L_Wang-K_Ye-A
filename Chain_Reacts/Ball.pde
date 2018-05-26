/*
 Casa De Java - Kevin Wang, Larry Wong, Alvin Ye
 APCS2 pd8
 Lab4 - All That Bouncin’
 2018-05-24
 */

class Ball {
  //============final vars=========================
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
  final static float CHANGE_FACTOR = 0.25; //change in radius
  final static int MAX_RADIUS = 100;
  //===============================================

  //vars (ball info & movement)
  int state;
  color c;
  float xCor;
  float yCor;
  float xVel;
  float yVel;
  float radius;

  //constructor with state var
  Ball(int sVar) {
    this.state = sVar;
    this.xVel = random(1, 10);
    this.yVel = random(1, 10);
    this.c = color(random(0, 256), random(0, 256), random(0, 256));
    this.radius = random(5, 50);
    this.xCor = random(this.radius, 600 - this.radius);
    this.yCor = random(this.radius, 600 - this.radius);
  }

  //overloaded constructor with state var and mouse coordinates
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
      if (this.xCor > 600 - this.radius || this.xCor < this.radius) this.xVel = -this.xVel;
      if (this.yCor > 600 - this.radius || this.yCor < this.radius) this.yVel = -this.yVel;
      //normal moving
      this.xCor += this.xVel;
      this.yCor += this.yVel;
    }
    //if the ball grows
    if (this.state == GROWING) {
      this.xVel = 0;
      this.yVel = 0;
      if (this.radius < MAX_RADIUS) {
        this.radius++;
      } else {
        this.state = SHRINKING;//state change
      }
    }
    //if the ball shrinks
    if (this.state == SHRINKING) {
      if (this.radius > 0) {
        this.radius--;
      } else {
        this.state = DEAD;//state change
      }
    }
    //the ball is dead
    if (this.state == DEAD) {
      this.radius = 0;//emulates a dead ball
    }
    fill(this.c);
    ellipse(this.xCor, this.yCor, this.radius, this.radius);
  }

  //if the ball touches other ball, the state changes to GROWING
  void collide() {
    //the ball has to be moving to stop
    if (this.state == MOVING) {
      //checks if there is a growing/shrinking ball touching this ball
      for ( int other = 0; other < existingBalls; other++ ) {
        if (balls[other].state != MOVING && balls[other].state != DEAD) {
          //the distance between the two centers (distance formula)
          float distance = pow(this.xCor - balls[other].xCor, 2) + pow(this.yCor - balls[other].yCor, 2);
          //if less than the sum of the two radii
          if (distance <= CHANGE_FACTOR*pow(this.radius + balls[other].radius, 2)) {
            this.state = 1;//state change
          }
        }
      }
    }
  }
}
