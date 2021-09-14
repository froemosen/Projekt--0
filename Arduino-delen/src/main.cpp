#include <Arduino.h>

unsigned long coolDown = 30000; //Tid der skal gå med ingen registreringer med sensor (ms), før 0 sendes
unsigned long releaseTime = 0; //Ændres senere, til millis+cooldown
unsigned long lastSent = 2; //Ændres senere til den sidst-sendte værdi, sådan at datalinjen ikke overflower

void setup() {
  pinMode(2, INPUT);  // Sætter  digital pin 2 som input
  Serial.begin(9600); // Starter serial med en baud-rate på 9600
}

void loop() { 
  bool sensorActive = digitalRead(2);

  if (lastSent != 1 && sensorActive) { //Hvis den sidst-sendte ikke er 1 og sensoren giver 1 i output
    Serial.println(1);
    lastSent = 1;
  }

  else if (millis() > releaseTime && lastSent != 0 && !sensorActive) { //Hvis der er gået længere tid end cooldown, siden sidste 1 blev sendt fra sensor.
    Serial.println(0);
    lastSent = 0;
  }

  if (sensorActive) {
    releaseTime = millis()+coolDown;
  }

}