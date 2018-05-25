final static int MAX_NUMBER_BALLS = 100; //max number of balls in canvas

Ball[] balls; //array of ball objects

int existingBalls = 0; //num of balls that can act

void setup() {
  background(15, 15, 15); //I don't want pure black
  size(600, 600); //canvas size
  balls = new Ball[MAX_NUMBER_BALLS]; //create array with MAX_NUMBER_BALLS, 0 meaningful elements
  //instantiate balls
  for (int i = 0; i < (int)(random(30, 40)); i++) {
    balls[i] = new Ball(0);
    //increment number of objects that are meaningful in the array
    existingBalls++;
  }
}

void draw() {
  clear(); //clears the clear to make it look like animation
  //tell each ball to move
  for (int ball = 0; ball < existingBalls; ball++) {
    //each ball moves
    balls[ball].move();
  }
}

void mouseClicked() {
  //creates new ball upon click
  balls[existingBalls] = new Ball(1, mouseX, mouseY);
  existingBalls++;
}
