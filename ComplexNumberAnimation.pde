int scale = 10;

ArrayList<ComplexNumber> hnumbers = new ArrayList<ComplexNumber>();
ArrayList<ComplexNumber> vnumbers = new ArrayList<ComplexNumber>();
//ComplexNumber[][] numbers;

void setup() {
  
  size(700, 700);
  
  //numbers = new ComplexNumber[32 * scale + 1][32 * scale + 1];
  
  for (int y = -scale; y <= scale; y++) {
    for (float x = -scale; x <= scale; x+=0.01) {
      hnumbers.add(new ComplexNumber(x, y));
      //numbers[x][y] = new ComplexNumber(0.0625*x-scale, y-scale);
    }
  }
  for (int x = -scale; x <= scale; x++) {
    for (float y = -scale; y <= scale; y+=0.01) {
      vnumbers.add(new ComplexNumber(x, y));
      //numbers[x][y] = new ComplexNumber(x-scale, 0.0625*y-scale);
    }
  }
  
}

void mousePressed() {
  println(map(mouseX, 0, width, -scale, scale), map(mouseY, 0, height, scale, -scale));
  animate();
}

void draw() {
  
  translate(width/2, height/2);
  background(0);
  noFill();
  
  stroke(255);
  line(-width/2, 0, width/2, 0);
  line(0, -height/2, 0, height/2);
  
  stroke(138, 43, 226);
  for (ComplexNumber n : hnumbers) {
    n.update();
    //point(n.newPos.x, n.newPos.y);
  }
  stroke(64, 183, 70);
  for (ComplexNumber n : vnumbers) {
    n.update();
    //point(n.newPos.x, n.newPos.y);
  }
  
}

void animate() {
  
  for (ComplexNumber n : hnumbers) {
    //n.linearFunction2(2, 0);
    n.linearFunction(1, 0); //m = 1i
    //n.quadraticFunction(1, 0, 0);
    //n.cubicFunction();
    //n.quarticFunction();
    //n.exponentialFunction(n.x, n.y);
    //n.exponentialFunction(Math.E, 0);
    //n.exponentialFunction(Math.E, Math.E);
    //n.exponentialFunction(0, 1);
    //n.exponentialFunction(0, Math.E);
    //n.exponentialFunction(0.5, 0.5);
    n.t = 0;
  }
  for (ComplexNumber n : vnumbers) {
    //n.linearFunction2(2, 0);
    n.linearFunction(1, 0); //m = 1i
    //n.quadraticFunction(1, 0, 0);
    //n.cubicFunction();
    //n.quarticFunction();
    //n.exponentialFunction(n.x, n.y);
    //n.exponentialFunction(Math.E, 0);
    //n.exponentialFunction(Math.E, Math.E);
    //n.exponentialFunction(0, 1);
    //n.exponentialFunction(0, Math.E);
    //n.exponentialFunction(0.5, 0.5);
    n.t = 0;
  }
  
}