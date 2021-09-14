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
  
  etage100 = loadImage("/Lokaleoversigter/AnneksStue.PNG");
  etage200 = loadImage("/Lokaleoversigter/Gang1sal.PNG");
  etage300 = loadImage("/Lokaleoversigter/Gang2sal.PNG");

 
}

 

void draw() { 
  clear();
  
  background(180, 180, 255);
  if ( myPort.available() > 0) {  // If data is available,
  val = myPort.readStringUntil('\n'); // read it and store it in val
  } 
  
  //Knapper til etager
  fill(0, 0, 0);
  rect(5, 5, 50, 50);
  
  fill(255, 255, 255);
  rect(55, 5, 50, 50);
  
  
  
  if (etage == 1) {
    fill(255, 255, 255);
    text("Etage 1", 40, 70);
    image(etage100, 250, 150);
    
  }
  
  
  
  else if (etage == 2) {
    fill(255, 255, 255);
    text("Etage 2", 40, 70);
    image(etage200, 250, 150);
    
  }
  
  
  
  else if (etage == 3) {
    
    if(val != null) {
    println(val); //print it out in the console
    val=trim(val);
    
    if (val.equals("1")){
      fill(255, 75, 85);
      rect(486, 174, 90, 140);
      println("I'm Triggered");
    }
    else if (val.equals("0")) {
      fill(85, 255, 95);
      rect(486, 174, 90, 140);
      println("I'm Triggered");
    }
    } 
    
    fill(255, 255, 255);
    image(etage300, 250, 150);
    text("Etage 3", 40, 70);
  }
 
    
  

}


void mousePressed() {
  if(mouseX >= 5 && mouseX <= 55 && mouseY >= 5 && mouseY <= 55 && !mouseCoolUp && etage > 1) {
    mouseCoolUp = true;
    etage -= 1;
  }
 
 else if(mouseX >= 65 && mouseX <= 115 && mouseY >= 5 && mouseY <= 55 && !mouseCoolDown && etage < 3) {
    mouseCoolDown = true;
    etage += 1;
  }

  else {
  mouseCoolUp = false;
  mouseCoolDown = false;
  }

/*
https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
*/
}
