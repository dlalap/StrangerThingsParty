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

void setup() {
  //movie = new Movie(this, "clouds.mp4");
  //movie.loop();
  
  bg = loadImage("upside_down_irvine.png");
  bg.resize(displayWidth, displayHeight);
  
  //size(1200, 747);
  fullScreen(P2D, SPAN);
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
  image(bg, 0, 0);
  //filter(INVERT);
  //filter(POSTERIZE, 4);
  //background(0);
  //text(frameRate,20,20);

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
