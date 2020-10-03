// By Roni Kaufman
// inspired by https://www.instagram.com/p/B7F8Uwln0l3/?igshid=oijtmrzffmq2
// By Roni Kaufman
// inspired by https://www.instagram.com/p/B7F8Uwln0l3/?igshid=oijtmrzffmq2
// Shade 3.6
// https://www.openprocessing.org/sketch/842192/
int counter = 0;
float x = 0;
float t = 0;
float step;
float colors;
float resolutions;
float alpha = 80;
float noice, digit, hue;
float res = 1 / random(200, 1000);

float density = random(10, 500);

void setup() {
  size(10000, 10000);
  colorMode(HSB, 100);
  background(98);
  noStroke();
  step = 1/density;
  println("density = " + density);
}

void draw() {

  for (float y = 0; y < height; y += 0.5) {
    noice = noise(x * res, y * res, t);
    digit = floor(noice * density);

    for (float i = 0; i < 1; i += step) {
      if (noice >= i && noice < i + step) {
        if (digit % 2 == 0) {
          hue = map(noice, i, i + step, 0, 100);
        } else {
          hue = map(noice, i, i + step, 100, 0);
        }
      }
    }
    fill(hue);
    square(x, y, 1);
  }
  x += 0.5;
  if (x > width) {
    save("density = " + density + "_" + counter + ".png");
    println("density = " + density);
    density = random(10, 500);
    t += 0.05;
    x = -1;
    counter ++;
  }
}
