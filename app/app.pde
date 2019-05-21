////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
// EDITORIAL LAB POSTER-GENERATOR
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////

// Dies ist die Processing-Applikation mit der die Editorial-Lab-Plakate bemalt werden
// Dafür clickt ihr einfach mit der Maus auf das Plakatmotiv

// Die Applikation speichert automatisch ein Video in den Ordner "out/mp4", 
// das ihr mir einfach mit eurer Illustration zusenden könnt. 
//
// Ihr könnt aber auch Bilder speichern. Das macht ihr mit der 's'-Taste. Die landen dann im 
// Ordner "out/jpg"
//

// Hier sind ein paar Variablen, die verändert werden dürfen
float PinselGroesse = 40;


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
// HIER BEGINNT DER CODE
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


import com.hamoid.*;
VideoExport videoExport;

PImage poster;
PGraphics topLayer;
int savedFrame = 0;

void setup() {
  poster = loadImage("posterdesign.jpg");
  poster.resize(586, 810);
  topLayer = createGraphics(586, 810);
  size(900, 900);
  frameRate(60);
  imageMode(CENTER);
  //pixelDensity(2);
  videoExport = new VideoExport(this, "out/mp4/editorialLab_" + int(random(10000, 99999)) + ".mp4");
  videoExport.setFrameRate(30);  
  videoExport.startMovie();
}

void draw() {
  background(#000000);
  topLayer.beginDraw();
  topLayer.noStroke();
  topLayer.fill(#ff0000);
  float gapX = (width-poster.width) / 2;
  float gapY = (height-poster.height) / 2;

  if (keyPressed) {
    if (key == 'c') {
      topLayer.clear();
    }
  }

  if (mousePressed) {
    topLayer.ellipse(mouseX-gapX, mouseY-gapY, 30, 30);
  }
  topLayer.endDraw();

  image(poster, width/2, height/2);
  image(topLayer, width/2, height/2);

  videoExport.saveFrame();
}

void keyReleased() {
  if (key == 's') {
    saveFrame ("out/jpg/editorialLab_" + int(random(10000, 99999)) + ".jpg");
  }

  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
