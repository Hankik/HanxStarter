/*
 Hank Kauffman
 6/16/23
 
 An empty project with boiler plate
 */

// declare global fields
float dt, prevTime, elapsed = 0;
final int LEVEL_AMOUNT = 1;
int currentLevel = 0;
Level[] levels = new Level[LEVEL_AMOUNT];
boolean isPaused = false;
Cursor cursor;
boolean leftMousePressed = false;
PauseMenu pauseMenu;

String[] nameRoboWalk = {"robot/walk0.png", "robot/walk1.png", "robot/walk2.png", "robot/walk3.png",
                     "robot/walk4.png", "robot/walk5.png", "robot/walk6.png", "robot/walk7.png"};
PImage[] roboWalk = new PImage[nameRoboWalk.length];
PImage[] roboIdles = new PImage[2];
PImage roboIdle, testFloor;

// color constants
final color RED = #bf616a;
final color ORANGE = #d08770;
final color YELLOW = #ebcb8b;
final color GREEN = #a3be8c;
final color PURPLE = #b48ead;
final color BLUE = #5e81ac;
final color WHITE = #eceff4;
final color BLACK = #3b4252;
final color BROWN = #9e6257;
final color LIGHTGREEN = #d9e68f;
final color PINK = #db96ad;
final color LIGHTBLUE = #92cade;
final color LIGHTRED = #FF8C8C;

void setup() {

  size(640, 640);

  // instantiate levels
  for (int i = 0; i < LEVEL_AMOUNT; i++) {
    levels[i] = new Level();
  }
  
  testFloor = loadImage("testFloor.jpg");
  testFloor.resize(640,640);
  roboIdle = loadImage("robot/idle.png");
  roboIdle.resize(32, 40);
  for (int i = 0; i < roboIdles.length; i++) roboIdles[i] = roboIdle;
  for (int i = 0; i < roboWalk.length; i++){
    roboWalk[i] = loadImage(nameRoboWalk[i]);
    roboWalk[i].resize(32, 40);
  }
  println("Sprites loaded successfully\n");
  
  cursor = new Cursor();
  pauseMenu = new PauseMenu();
  
}

void draw() {

  // calculate delta time
  float currTime = millis();
  dt = (currTime - prevTime) / 1000;
  prevTime = currTime;

  // fill canvas with black (aka clear canvas)
  background(BLACK);
  
  
  pushMatrix();
  translate(-levels[currentLevel].view.x, -levels[currentLevel].view.y);
  
  
  image(testFloor, 0, 0);
  image(testFloor, -640, 0);
  image(testFloor, 640, 0);
  image(testFloor, -640, 0);
  image(testFloor, -640, -640);
  image(testFloor, 640, 640);
  image(testFloor, 0, 640);
  image(testFloor, 0, -640);
  image(testFloor, 640, -640);
  image(testFloor, -640, 640);

  // if you want game to continue in background, remove focused condition
  if (!isPaused && focused) {
    elapsed += dt;
    levels[currentLevel].update();
  }
  levels[currentLevel].draw();

  Keyboard.update();    
  
  cursor.update();
  cursor.draw();

  popMatrix();
  
  pauseMenu.update();
    
  fill(WHITE);
  textAlign(CENTER, CENTER);
  textSize(12);
  text(elapsed, width/16, height/16);
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
  levels[currentLevel].keyPressed();
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
  levels[currentLevel].keyReleased();
  if (key == 'p') isPaused = !isPaused;
}

void mousePressed() {
  leftMousePressed = true;
  levels[currentLevel].mousePressed();
}

void mouseReleased() {
  leftMousePressed = false;
  levels[currentLevel].mousePressed();
}
