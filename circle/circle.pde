/**
 * WigglePShape.
 *
 * How to move the individual vertices of a PShape
 */
 
 /*variables from flatNoise*/
float xnoise=0.0;
float ynoise=0.0;
float inc=0.09;
float yOffset=0.0;
int gridSize=10;

 
// A "Wiggler" object
Wiggler w;
int rayon =100;
 
void setup() {
  size(640, 360, P3D);
  w = new Wiggler();
}
 
void draw() {
  background(0);
  w.display();
  w.wiggle();
  
  //Imported from flatNoise
  xnoise=0.0;
  ynoise=yOffset;
 
  translate(0, 10, -50);
  rotate(0);
 
  for (int y =height/2-rayon; y<height/2+rayon; y++) {
//    println("haut: "+(height/2-rayon));
    //println("y: "+y);
    noFill();
    beginShape();
    for (int x =height/2+rayon; x<height/2+2*rayon; x++) {
      //print("x: "+x);
      float z=noise(xnoise, ynoise)*255.0;
      float alpha=map(y, 0, 60, 0, 255);
      stroke(50,50,50);
      vertex(x, y);
      xnoise=xnoise+inc;
    }
    xnoise=0.0;
    ynoise=ynoise+inc;
    endShape();
  }
  yOffset+= inc/6.0;
}

void keyPressed(){
  println(key);
  if(key=='e'){  
    inc+=0.1;
  }
  if(key=='a'){
    inc-=0.11;
  }
  println(inc);
}