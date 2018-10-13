class ComplexNumber {
  
  double x;
  double y;
  double Re;
  double Im;
  PVector pos;
  PVector newPos;
  boolean function = false;
  float t = 0.0;
  
  float scale = 10;
  
 ComplexNumber(float Re_, float Im_) {
   x = Re_;
   y = Im_;
   newPos = new PVector(map((float) x, -scale, scale, -width/2, width/2), map((float) y, -scale, scale, height/2, -height/2));
   pos = new PVector(map((float) x, -scale, scale, -width/2, width/2), map((float) y, -scale, scale, height/2, -height/2));
 }
 
 void update() {
   
  float tx = pos.x+t*(newPos.x-pos.x);
  float ty = pos.y+t*(newPos.y-pos.y);
  point(tx, ty);
  
  if (t < 1.0) {
    t += 0.05;
    if (t > 1.0) {
      t = 1.0;
    }
  }
   
 }
 
 void linearFunction(float m, float c) {
  
  Re = y * -m;
  Im = x * m;
  x += c;
  x = Re;
  y = Im;
  newPos.x = map((float) x, -scale, scale, -width/2, width/2);
  newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
 
 void linearFunction2(float m, float c) {
  
  Re = x * m;
  Im = y * m;
  x += c;
  x = Re;
  y = Im;
  newPos.x = map((float) x, -scale, scale, -width/2, width/2);
  newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
 
 void exponentialFunction(double Rb, double Ib) {
   
  double mod = Math.pow(Rb*Rb + Ib*Ib, x/2) * Math.pow(Math.E, -y * Math.atan2(Ib, Rb));
  Re = Math.cos(x*Math.atan2(Ib, Rb) + 0.5*y*Math.log(Rb*Rb + Ib*Ib)) * mod;
  Im = Math.sin(x*Math.atan2(Ib, Rb) + 0.5*y*Math.log(Rb*Rb + Ib*Ib)) * mod;
  x = Re;
  y = Im;
  newPos.x = map((float) x, -scale, scale, -width/2, width/2);
  newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
 
 void quadraticFunction(float a, float h, float k) {
  
  x -= h;
  Re = x*x - y*y;
  Im = 2 * x * y;
  x = a * Re + k;
  y = a * Im;
  newPos.x = map((float) x, -scale, scale, -width/2, width/2);
  newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
 
 void cubicFunction() {
   
   Re = x*x*x - 3*x*y*y;
   Im = 3*x*x*y - y*y*y;
   x = Re;
   y = Im;
   newPos.x = map((float) x, -scale, scale, -width/2, width/2);
   newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
 
 void quarticFunction() {
   
   Re = x*x*x*x + y*y*y*y - 6*x*x*y*y;
   Im = 4*x*x*x*y - 4*x*y*y*y;
   x = Re;
   y = Im;
   newPos.x = map((float) x, -scale, scale, -width/2, width/2);
   newPos.y = map((float) y, -scale, scale, height/2, -height/2);
   
 }
  
}