int cols, rows;
int scl = 20;
float flying = 0;
float[][]  terrain;
int w = 1200;
int h = 900;
PImage img;
PImage sky;

void setup() {
  sky = loadImage("sky.jpg");
  img = loadImage("Grass.png");
  size(600, 600, P3D);
  cols = w/scl;
  rows = w/scl;
  terrain = new float[cols][rows];
  float yoff =0;
  for (int y =0; y<cols; y++) {
    float xoff = 0;
    for (int x =0; x<rows; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);    
      xoff += 0.1;
    }
    yoff += 0.1;
  }
}

void draw() {
  flying -= 0.05;
  lights();

  float yoff = flying;
  for (int y =0; y<cols; y++) {
    float xoff = 0;
    for (int x =0; x<rows; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);    
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  background(0);
  image(sky, 0, 0, width, height/1.2);
  noStroke();
  noFill();
  translate(width/2, height/2);
  rotateX(PI/3);

  translate(-w/2, -h/2);

  for (int y =0; y< rows -1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x =0; x<cols; x++) {
      texture(img);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
