/*
Casa De Java - Kevin Wang, Larry Wong, Alvin Ye
APCS2 pd8
Lab4 - All That Bouncin’
2018-05-23
*/
Ball[] balls; //array of ball objects
boolean clicked = false;

void setup() {
  background(15, 15, 15); //I don't want pure black
  size(600, 600); //canvas size
  balls = new Ball[(int) random(25, 36)]; //create array with random size
  //instantiate balls
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  if (!clicked) {
    clear(); //clears the clear to make it look like animation
    //tell each ball to move
    for (Ball b : balls) {
      b.move();
      ellipse(b.xCor, b.yCor, b.size, b.size);
      fill(b.c);
    }
  }
}

void mouseClicked() {
  clicked = !clicked;
}
