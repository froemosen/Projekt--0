import processing.serial.*;

Serial myPort;

String val;

void setup()
{
  size(800, 800);
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600);
}



void draw()
{
  
  if ( myPort.available() > 0) 
  {  // If data is available,
  val = myPort.readStringUntil('k'); // read it and store it in val
  fill(255, 0, 0);
  rect(200, 200, 100, 100);
  } 
  
  println(val); //print it out in the console
  
  if (val == "1k"){
    fill(255, 0, 0);
  }
  else if (val == "0k") {
    fill(0, 255, 0);
  }
  delay(500);
    
  

}

/*
https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all
*/
