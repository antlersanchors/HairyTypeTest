import geomerative.*;

RFont font;
String textTyped = "Michael and Lily and Riccardo";

void setup() {
  size(1024, 768);  

  RG.init(this);
  font = new RFont("FreeSans.ttf", 200, RFont.CENTER);

  RCommand.setSegmentLength (20);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}


void draw() {
  background(255);

  translate(width/2, height/2);

//Let's make some noise
  float noiseScale = 10;
  float mouseScale = 5;

  float noiseVal = noise((mouseX * mouseScale), (mouseY * mouseScale))*noiseScale;
  println(noiseVal);
  
  if (textTyped.length() > 0) {
    /* get the points on font outline */
    RPoint[] pnts = font.toGroup(textTyped).toPolygonGroup().getPoints();

    /* lines */
    noFill();
    noStroke();
    stroke(0, 127, 255);

    for (int i = 1; i < pnts.length; i++ ) {
      line(
      (pnts[i-1].x), pnts[i-1].y, 
      pnts[i].x, pnts[i].y);
    }

    /* dots */
    stroke(0);
    for (int i = 0; i < pnts.length; i++ ) {
      float diameter = 6;
      float mouseDiameter = map(mouseX, 0, width, 3, 30);
      ellipse(pnts[i].x, pnts[i].y, diameter, diameter);
    }

    for (int i = 0; i < pnts.length; i++ ) {
      rect((pnts[i].x)+noiseVal, (pnts[i].y)+noiseVal, 5, 5);
    }
  }
}

//void keyPressed() {
//  textTyped = "" + key;
//}

