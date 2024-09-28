/*8. Зобразити фігуру, яку описує фіксована точка Р, яка лежить на колі,
 яке котиться по прямій (циклоїда). Розглянути випадки, коли точка Р
 лежить в колі й поза колом і при коченні кола жорстко з ним зв’язана.*/
float r = 50;
float d = 50;
float t = 0;
ArrayList<PVector> trail = new ArrayList<PVector>();

void setup() {
  size(1600, 800);
  background(255);
}

void draw() {
  background(255);

  float circleX = r * t;
  float circleY = height / 2;

  float x = circleX + d * cos(t);
  float y = circleY + d * sin(t);

  trail.add(new PVector(x, y));

  strokeWeight(2);
  noFill();
  stroke(0, 0, 255);
  ellipse(circleX, circleY, 2*r, 2*r);

  stroke(0);
  beginShape();
  for (PVector point : trail) {
    vertex(point.x, point.y);
  }
  endShape();

  stroke(255, 0, 0);
  line(circleX, circleY, x, y);

  fill(139, 0, 0);
  stroke(139, 0, 0);
  ellipse(x, y, 8, 8);

  t += 0.05;

  if (circleX > width) {
    noLoop();
  }
}
