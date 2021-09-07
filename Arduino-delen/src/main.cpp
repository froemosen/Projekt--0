#include <Arduino.h>

void setup() {
  pinMode(2, INPUT);  // sets the digital pin 13 as output1
  Serial.begin(9600);
}

void loop() {
  Serial.print(digitalRead(2));
  delay(50);
}