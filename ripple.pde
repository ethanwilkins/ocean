// ripples where you press, expanding until height, then fade
// to add translate for triangles

class Ripple {
  float x, y, size, growth;
  boolean fatR = false,
    fatG = false,
    fatB = false;
  float /*red, green, blue,*/
    rMin, gMin, bMin,
    rMax, gMax, bMax,
    rCR, gCR, bCR;
  color ripColor;
  
  Ripple (float mx, float my) {
    colorPalette();
    growth = 1;
    x = mx;
    y = my;
  }
  
  void update() {
    noFill();
    stroke(ripColor);
    if (water.mode == 0) ellipse(x, y, size, size);
    else rect(x, y, size, size);
    colorMorph();
    travel();
    death();
  }

  void travel() {
    size += growth;
  }
  
  void death() {
    if (size > height*1.5) {
      water.ripples.remove(this);
    }
  }
  
  void colorPalette() {
    //red = random(0, 250);
    //green = random(0, 250);
    //blue = random(0, 250);
    //rMin = random(1, 120);
    //gMin = random(1, 120);
    //bMin = random(1, 120);
    //rMax = random(130, 255);
    //gMax = random(130, 255);
    //bMax = random(130, 255);
    //rCR = random(1, 2);
    //gCR = random(1, 2);
    //bCR = random(1, 2);
    ripColor = color(red,
      green, blue);
  }
  
  void colorMorph() {
    //float colorCR;
    //// Red
    //colorCR = random(rCR);
    //if (red < rMin) {
    //  fatR = false;
    //} else if (red > rMax) {
    //    fatR = true;
    //} if (fatR) {
    //    red -= colorCR;
    //} else red += colorCR;
    //// Green
    //colorCR = random(gCR);
    //if (green < gMin) {
    //  fatG = false;
    //} else if (green > gMax) {
    //    fatG = true;
    //} if (fatG) {
    //    green -= colorCR;
    //} else green += colorCR;
    //// Blue
    //colorCR = random(bCR);
    //if (blue < bMin) {
    //  fatB = false;
    //} else if (blue > bMax) {
    //    fatB = true;
    //} if (fatB) {
    //    blue -= colorCR;
    //} else blue += colorCR;
    ripColor = color(red, green, blue);
  }
}