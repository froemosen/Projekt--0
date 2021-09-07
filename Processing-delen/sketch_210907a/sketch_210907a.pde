import processing.serial.*;

Serial myPort;

String val;
PShape lok316;


void setup()
{
  size(800, 800, P2D);
  
  
  String portName = Serial.list()[6]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
 
}



void draw() { 
  clear();
  background(150, 150, 255);
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('\n'); // read it and store it in val
  //fill(255, 0, 0);
  //rect(200, 200, 100, 100);
  } 
  
  
  
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

/*
https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
*/
