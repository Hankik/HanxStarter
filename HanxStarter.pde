/*
 Hank Kauffman
 6/16/23
 
 A mostly empty project with boiler plate
 */

// declare global fields
float dt, prevTime, elapsed = 0;
final int LEVEL_AMOUNT = 1;
int currentLevel = 0;
Level[] levels = new Level[LEVEL_AMOUNT];
boolean isPaused = false;
Cursor cursor;
Cursor uiCursor;
boolean leftMousePressed = false;
UI menu;
UI hud;
Lighting lighting;

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

  frameRate(300);

  // instantiate levels
  for (int i = 0; i < LEVEL_AMOUNT; i++) {
    levels[i] = new Level();
  }

  testFloor = loadImage("testFloor.jpg");
  testFloor.resize(640, 640);
  roboIdle = loadImage("robot/idle.png");
  roboIdle.resize(32, 40);
  for (int i = 0; i < roboIdles.length; i++) roboIdles[i] = roboIdle;
  for (int i = 0; i < roboWalk.length; i++) {
    roboWalk[i] = loadImage(nameRoboWalk[i]);
    roboWalk[i].resize(32, 40);
  }
  println("Sprites loaded successfully\n");

  cursor = new Cursor();
  uiCursor = new Cursor();
  uiCursor.isUI = true;

  menu = new UI(0);
  hud = new UI(1);
  
  lighting = new Lighting(levels[currentLevel].c.pawn);
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
  
  lighting.update();
  
  if (!isPaused) hud.update();
  hud.draw();

  uiCursor.update();
  uiCursor.draw();

  if (isPaused) {
    menu.update();
    menu.draw();
  }

  fill(WHITE);
  textAlign(CENTER, CENTER);
  textSize(12);
  text(elapsed, width/16, height/16);
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
  if (!isPaused) levels[currentLevel].keyPressed();
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
  if (!isPaused) levels[currentLevel].keyReleased();
  if (key == 'p') isPaused = !isPaused;
}

void mousePressed() {
  leftMousePressed = true;
  if (!isPaused) levels[currentLevel].mousePressed();
  menu.mousePressed();
}

void mouseReleased() {
  leftMousePressed = false;
  if (!isPaused) levels[currentLevel].mousePressed();
  menu.mouseReleased();
}
