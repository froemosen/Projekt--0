import processing.serial.*;

Serial myPort;

String val;

//Plantegninger over lokaler
PImage etage100;
PImage etage200;
PImage etage300;

int etage = 3;
boolean mouseCoolUp = false;
boolean mouseCoolDown = false;




void setup()
{
  size(1200, 800, P2D);
  
  
  String portName = Serial.list()[6]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
 
}



void draw() { 
  clear();
  
  background(150, 150, 255);
  if ( myPort.available() > 0) {  // If data is available,
  val = myPort.readStringUntil('\n'); // read it and store it in val
  } 
  
  //Knapper til etager
  fill(155, 255, 155);
  rect(5, 5, 50, 50);
  
  fill(155, 155, 255);
  rect(55, 5, 50, 50);
  
  if (etage == 1) {
    println("hej");
  }
  
  else if (etage == 2) {
    println("hej");
  }
  
  else if (etage == 3) {
    
    if(val != null) {
    println(val); //print it out in the console
    val=trim(val);
    
    if (val.equals("1")){
      fill(255, 0, 0);
      rect(200, 200, 100, 100);
      println("I'm Triggered");
    }
    else if (val.equals("0")) {
      fill(0, 255, 0);
      rect(200, 200, 100, 100);
      println("I'm Triggered");
    }
    }  
  }
    
  

}


void mousePressed() {
  if(mouseX >= 5 && mouseX <= 55 && mouseY >= 5 && mouseY <= 55 && !mouseCoolUp && etage < 3) {
    mouseCoolUp = True;
    etage += 1;
  }
 
 else if(mouseX >= 65 && mouseX <= 115 && mouseY >= 5 && mouseY <= 55 && !mouseCoolDown && etage > 1) {
    mouseCoolDown = True;
    etage -= 1;
  }

  else {
  mouseCoolUp = False;
  mouseCoolDown = False;
  }

/*
https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
*/
