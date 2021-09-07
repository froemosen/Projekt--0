#include <Arduino.h>

unsigned long coolDown = 2000;
unsigned long releaseTime = 0;
unsigned long lastSent = 2;

void setup() {
  pinMode(2, INPUT);  // sets the digital pin 13 as output1
  Serial.begin(9600);
}

void loop() { 
  bool sensorActive = digitalRead(2);

  if (millis() > releaseTime && lastSent != 1 && sensorActive) {
    Serial.println(1);
    lastSent = 1;
  }

  else if (millis() > releaseTime && lastSent != 0 && !sensorActive) {
    Serial.println(0);
    lastSent = 0;
  }

    if (sensorActive) {
    releaseTime = millis()+coolDown;
  }

}