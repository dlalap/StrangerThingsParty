// import processing.video.*; 
import processing.opengl.*;

PImage bg;
// Movie movie;

int quantity = 100;
float[] xPosition = new float[quantity];
float[] yPosition = new float[quantity];

int[] flakeSize = new int[quantity];
int[] direction = new int[quantity];
int minFlakeSize = 3;
int maxFlakeSize = 7;
float currTime = -1;
float currentRandNum = 0;
float currentRandNum2 = 0;
String[] images;
String[] test;
int testpointer;

void setup() {
  //movie = new Movie(this, "clouds.mp4");
  //movie.loop();
  
  images = new String[]{
    "upside_down_irvine.png",
    "upside_down_irvinespectrum_transparent.png",
    "upside_down_greatpark1_transparent.png",
    "upside_down_uci.png"
  };
  
  test = new String[] {
    "a",
    "b",
    "c"
  };
  
  testpointer = -1;
  
  bg = loadImage(images[0]);
  bg.resize(displayWidth, displayHeight);
  
  //size(1200, 747);
  fullScreen(P2D);
  frameRate(30);
  noStroke();
  noCursor();
  smooth();
  
  for (int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(-1, 1));
  }
}

// void movieEvent(Movie movie) {
//   movie.read();
// }

void draw() {
  //background(bg);
  //image(movie, 0, 0, displayWidth, displayHeight);
  //LoadImage();
  //background(0);
  
  float newTime = millis()/(1000 *  5); // Change images every 5 minutes
  if (currTime != newTime) {
    currentRandNum2 = random(50);
    currTime = newTime;
    testpointer = testpointer + 1;
    if (testpointer > 3) {
      testpointer = 0;
    }
  }
  //if (millis()/1000.0 % 1 < 10) {
  //  currentRandNum2 = random(50);
  //}
  text(currTime, 10, 60);
  text(currentRandNum2, 10, 90);
  //text(test[testpointer], 10, 120);
  bg = loadImage(images[testpointer]);
  bg.resize(displayWidth, displayHeight);
  background(bg);
  
  for (int i = 0; i < xPosition.length; i++) {
    fill(100, 100, 100, 120);
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    //filter(BLUR, 2);
    
    if (direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);      
    } 
    else {
      //xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, 5);
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, 0.1, 0.5);
    }
    
    yPosition[i] += (flakeSize[i] + direction[i]) / 10;
    //float flakeDirection = flakeSize[i] + direction[i];
    //yPosition[i] += random(-flakeDirection, flakeDirection);
    
    if (xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      //if (xPosition[i] == 0) {
      yPosition[i] = random(0, height);
      //} 
      //else {
      //yPosition[i] = -flakeSize[i];
      //}
    }
  }
}

void LoadImage(PImage img) {
  image(img, 0.0, 0.0);
  //filter(INVERT);
  //filter(POSTERIZE, 4);
  //background(0);
  //text(frameRate,20,20);

  
}
