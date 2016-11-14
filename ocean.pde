AccelerometerManager accel;
float ax, ay, az;
float red, green, blue;

Water water;

void setup() {
  accel = new AccelerometerManager(this);
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);
  ellipseMode(CENTER);
  rectMode(CENTER);
  vibe(); water = new Water();
  background(0);
  smooth();
}

void draw() {
  vibe(); background(red, green, blue);
  water.display();
}

void mousePressed() {
  water.startSwipe();
}

void mouseReleased() {
  water.swipeDetector();
  water.ripple(mouseX, mouseY);
}

void vibe() {
  red = map(ax, -15, 15, 0, 255);
  green = map(ay, -15, 15, 0, 255);
  blue = map(az, -15, 15, 0, 255);
}

public void resume() {
  if (accel != null) {
    accel.resume();
  }
}

public void pause() {
  if (accel != null) {
    accel.pause();
  }
}

public void shakeEvent(float force) {
  println("shake : " + force);
}

public void accelerationEvent(float x, float y, float z) {
//  println("acceleration: " + x + ", " + y + ", " + z);
  ax = x;
  ay = y;
  az = z;
  //redraw();
}