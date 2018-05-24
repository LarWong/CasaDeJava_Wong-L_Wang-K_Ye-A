/*
Casa De Java - Kevin Wang, Larry Wong, Alvin Ye
 APCS2 pd8
 Lab4 - All That Bouncin’
 2018-05-24
 */

final static int MAX_NUMBER = 1000;
Ball[] balls; //array of ball objects
boolean clicked = false;
int existingBalls = 0;



void setup() {

  background(15, 15, 15); //I don't want pure black
  size(600, 600); //canvas size
  balls = new Ball[MAX_NUMBER]; //create array with random size
  //instantiate balls
  for (int i = 0; i < (int)(random(30, 40)); i++) {
    balls[i] = new Ball(0);
    existingBalls++;
  }
}

void draw() {
  if (!clicked) {
    clear(); //clears the clear to make it look like animation
    //tell each ball to move
    for (int ball = 0; ball < existingBalls; ball++) {
      //each ball checks for collision and moves
      balls[ball].collide(ball, balls);
      balls[ball].move();
    }
  }
}
void mouseClicked() {
  //cerates new ball upon click
  balls[existingBalls] = new Ball(1, mouseX, mouseY);
  existingBalls++;
}
