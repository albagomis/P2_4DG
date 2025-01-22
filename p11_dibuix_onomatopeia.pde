//Onomatopeia_AlbaGomis

import processing.pdf.*;
boolean record;
PFont myfont;
String mytext="Pum#";
float angleU = 0;
color[] paleta={#f24c3d,#f29727,#f2be22}; //llistat

void setup() {
  //size(595, 879);
  //size(794, 1172);
  size(568, 843); //200,378mm x 297,392mm
  myfont=createFont("IBMPlexMono-Medium.ttf",8);
}

void draw() {
  //guardar .pdf
  if (record) {
    beginRecord(PDF, "onomatopeia_alba-####.pdf");
  }
  textFont(myfont);
  textSize(8);
  frameRate(1);
  
  int r=int(random(paleta.length));
  //println(r);
  //if (frameCount % 30 == 0){
    background(paleta[r]);
  //}
  
  //fill(paleta[r]);
  fill(0);
  
  /*//"p" al centre
  text(mytext.charAt(0),width/2,height/2);*/

  //funció principal
  centre();
  
  //particules eme
  for(int i = 0;i<50;i++){
  particules1(random(width), random(height));
  }
  
  /*//particules exclamació
  for(int i = 0;i<50;i++){
  particules2(random(width), random(height));
  }*/
 
 //guardar vídeo
 //saveFrame("png/onomatopeia_alba-####.png");
 
  //guardar .pdf click
  if (record) {
    endRecord();
    record = false;
  }
}
void mousePressed() {
  record = true;
}

  
String lineaU() {
  int numU = int(random(5, 45)); // num de "u" per línia (min i max de "u")
  String linea = "p";
  
  //linea de "u"
  for (int x = 0; x < numU; x++) {
    linea += mytext.charAt(1);
  }
  /*for (int x=width/2+12; x<=width-20; x*=1.03) { //degradaes
    text(mytext.charAt(1),x,height/2);
  }*/
  
  return linea; // Retorna la línia generada
}
  
void centre(){
  for (int i = 0; i < 30; i++) {  // número de línies
    
    //angle de cada línia
    float angle = radians((360 / 36) * i + angleU);
    
    //distància des del centre
    float distance = 20 + random(5, 50); 
    float x = width / 2 + cos(angle) * distance;
    float y = height / 2 + sin(angle) * distance;
  
    String linea= lineaU();
    dibuixalineaU(x,y, linea);
    
    angleU += 2;
  }
}
    
void dibuixalineaU(float x, float y, String linea) {
  push();
  translate(x, y);
  rotate(atan2(y - height / 2, x - width / 2)); //alinear la linea radialment
  text(linea, 0, 0); // dibuixa la línia de "u"
  pop();
}
  
/*void linea(float angulo, float i, float j, String texto){
  push();
  translate(i,j);
  rotate(radians(angulo));
  //text(mytext.charAt(2),0,0);
  text(texto, -5, -5);
  pop();
}

void explosio(int j){
for(int i=0;i<360;i+=j){
  linea(i,width/2,height/2, texto.substring(int(random(0,29)),int(random(30,59))));
}
/*
for(int i=0;i<360;i+=j*5){
  linea(i, random(100,700),random(100,700));
}*/
//}

void espiga() {
  for (int y = 20; y <= height-20; y += 25) {
    for (int x = 20; x <= width-20; x += 25) {
      if ((x % 10) == 0) {
        text("g", x+8, y-8);
      } else {
        text("h", x+8, y+8);
      }
    }
  }
}


void particules1(float px, float py){
  push();
  translate(px,py);
  text(mytext.charAt(2),0,0);
  pop();
}

void particules2(float px, float py){
  push();
  translate(px,py);
  text(mytext.charAt(3),0,0);
  pop();
}
