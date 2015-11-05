const int redButton = 2; 
int redButtonState;             // the current reading from the input pin
int redLastButtonState = LOW;   // the previous reading from the input pin
long redLastDebounceTime = 0;  // the last time the output pin was toggled
long redDebounceDelay = 50;    // the debounce time; increase if the output flickers

const int blueButton = 3; 
int blueButtonState;             // the current reading from the input pin
int blueLastButtonState = LOW;   // the previous reading from the input pin
long blueLastDebounceTime = 0;  // the last time the output pin was toggled
long blueDebounceDelay = 50;    // the debounce time; increase if the output flickers

void setup() {
  Serial.begin(9600);
  pinMode(redButton, INPUT);
  pinMode(blueButton, INPUT);  
}

void loop() {
  // read the state of the switch into a local variable: 
  int redReading = digitalRead(redButton);
  int blueReading = digitalRead(blueButton); 

  //red 
  if (redReading != redLastButtonState) {
    redLastDebounceTime = millis();     // reset the debouncing timer
  }

  if ((millis() - redLastDebounceTime) > redDebounceDelay) {
    if (redReading != redButtonState) {
      redButtonState = redReading;
      
      if (redButtonState == HIGH) {
        //if red is active - do something
        Serial.write(1); 
        Serial.println("red"); 
      } else {
        Serial.write(0);
      }
    }
  }

  //blue 
  if (blueReading != blueLastButtonState) {
    blueLastDebounceTime = millis();     // reset the debouncing timer
  }

  if ((millis() - blueLastDebounceTime) > blueDebounceDelay) {
    if (blueReading != blueButtonState) {
      blueButtonState = blueReading;
      
      if (blueButtonState == HIGH) {
        //if red is active - do something
        Serial.println("blue");
        Serial.write(2); 
      } else {
        Serial.write(0);
      }
    }
  }
  
  redLastButtonState = redReading;
  blueLastButtonState = blueReading;
}
