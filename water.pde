// long press for screenshot

class Water {
  ArrayList<Ripple> ripples;
  // swipe logic variables
  int mode, swipeDetected;
  float up, down, left, right;
  // swipe detection variables
  float pmousex, pmousey,
  xDist, yDist,
  pressTime, releaseTime;
  boolean swiped;
  
  Water () {
    ripples = new ArrayList<Ripple>();
    up = height * 0.45;
    down = -height * 0.45;
    left = width * 0.60;
    right = -width * 0.60;
    swipeDetected = 0;
    mode = 0;
  }
  
  void display() {
    for (int i=0; i < ripples.size(); i++) {
      Ripple rip = ripples.get(i);
      rip.update();
    }
  }
  
  void ripple(float mx, float my) {
    if (!swiped) {
      ripples.add(new Ripple(mx, my));
    }
  }
  
  void startSwipe() {
    pressTime = millis();
    pmousex = mouseX;
    pmousey = mouseY;
    swiped = false;
  }
  
  void swipeDetector() {
    releaseTime = millis();
    xDist = pmousex - mouseX;
    yDist = pmousey - mouseY;
    if (releaseTime < pressTime + 600) { // for long draws or non-swipes
      if (yDist >= up || yDist <= down || xDist >= left || xDist <= right) {
        swiped = true;
        
        // clear screen
        if (xDist >= left || xDist <= right) {
          for (int i=0; i < ripples.size(); i++) {
            Ripple rip = ripples.get(i);
            ripples.remove(rip);
          } background(0);
        }
        
        if (yDist >= up || yDist <= down) {
          try {
            saveFrame("/storage/sdcard0/Pictures/ripples-#####.png");
          } finally {
            // do nothing
          }
        }
      }
    }
  }
}