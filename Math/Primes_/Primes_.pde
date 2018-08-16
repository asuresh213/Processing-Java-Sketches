import processing.pdf.*;

void setup() {
  size(900, 900, PDF, "Primes.pdf");
}
float px = width/2; 
float py = height/2;
float r = 0;
float x = 0;
float y = 0;
float angle = 0;
float count = 1;
void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i =0; i < primes.length; i++) {
    r = primes[i]/200;
    x = r*cos(angle);
    y = r*sin(angle);
    colorMode(HSB, 100);
    float col = map(i, 0, primes.length, 0, 100); 
    fill(col, 2*col, 100);
    noStroke();
    ellipse(x, y, 2, 2);
    angle += i;
    px = x;
    py = y;
}
angle =0;
println("finished");
exit();
}
