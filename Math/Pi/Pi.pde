import processing.pdf.*;
String[] lines = loadStrings("PiDigits.txt");
float angle =0;
float clr = 1;

size(800, 800, PDF, "Pi.pdf");
background(255);

translate(width/2, height/2);
noFill();
colorMode(HSB, 100);
for (int i=0; i<=400; i++) {
  clr = map(int(lines[i]), 0, 9, 10, 90);
  stroke(clr, clr, 100);
  arc(0, 0, 2*(i+1), 2*(i+1), angle, angle + 2*int(lines[i])*PI/9);
  angle += 2*int(lines[i])*PI/9;
}
println("Finished");
