#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <SoftwareSerial.h>
#include <FirebaseArduino.h>
#include <ArduinoJson.h>
//#include <FirebaseError.h>
#include <ESP8266HTTPClient.h>
//#include <FirebaseObject.h>
#define USE_ARDUINO_INTERRUPTS true    // Set-up low-level interrupts for most acurate BPM math.
#include <PulseSensorPlayground.h>// Includes the PulseSensorPlayground Library.   
#include <GSM.h>

#define FIREBASE_HOST "trial1-3f97b.firebaseio.com"
#define FIREBASE_AUTH "homEnmaGrqjT4PknF77PLGXq0gKeSzaFrcihlQGL"
#define WIFI_SSID "iPXr Bazooka"
#define WIFI_PW "arunacdm"
GSM gsmAccess;
GSM_SMS sms;

int myint;
int inp=A0;
int sdata= 0;
int pinButton = 8; //the pin where we connect the button
int LED = 2; //the pin we connect the LED

const int PulseWire = 0; 
int Threshold = 550;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(inp,INPUT);
  pinMode(pinButton, INPUT); //set the button pin(SOS button) as INPUT
  pinMode(LED, OUTPUT); //set the LED pin as OUTPUT
}
  //connect to wifi            

  pinMode(LED_BUILTIN, OUTPUT);  
  WiFi.begin(WIFI_SSID,WIFI_PW);
  Serial.print("connecting");
  while(WiFi.status()!= WL_CONNECTED)
  {
    Serial.print("./");
    delay(500);
    }
  Serial.println();
  Serial.print("connected");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  //Configure the PulseSensor object, by assigning our variables to it. 
  pulseSensor.analogInput(PulseWire);   
  pulseSensor.blinkOnPulse(LED_BUILTIN);       //auto-magically blink Arduino's LED with heartbeat.
  pulseSensor.setThreshold(Threshold); 

    // connection state
  boolean notConnected = true;

  // Start GSM shield
  // If your SIM has PIN, pass it as a parameter of begin() in quotes
  while (notConnected) {
    if (gsmAccess.begin(PINNUMBER) == GSM_READY) {
      notConnected = false;
    } else {
      Serial.println("Not connected");
      delay(1000);
    }
  }
  Serial.println("GSM initialized");
 
  // Double-check the "pulseSensor" object was created and "began" seeing a signal. 
   if (pulseSensor.begin()) {
    Serial.println("We created a pulseSensor Object !");  //This prints one time at Arduino power-up,  or on Arduino reset.  
      }
   
}

void loop() {
  
  char remoteNum[20]="8760333344";  // telephone number to send sms
  char txtMsg[200]="high pulse rate! emergency";
  int stateButton = digitalRead(pinButton); //read the state of the button
  if(stateButton == 1) { //if is pressed
     digitalWrite(LED, HIGH); //write 1 or HIGH to led pin
     sms.beginSMS(remoteNum);
     sms.print("emergency!! call back immediately");
     sms.endSMS();
  } else { //if not pressed
     digitalWrite(LED, LOW);  //write 0 or low to led pin
  }
  
    // put your main code here, to run repeatedly:
  sdata= analogRead(inp);
  //int ldr=analogRead(A0);
  Serial.println(sdata);
  myint=int(sdata);

  int myBPM = pulseSensor.getBeatsPerMinute();  // Calls function on our pulseSensor object that returns BPM as an "int".
                                               // "myBPM" hold this BPM value now. 
 
if (pulseSensor.sawStartOfBeat()) {            // Constantly test to see if "a beat happened". 
 Serial.println("A HeartBeat Happened ! "); // If test is "true", print a message "a heartbeat happened".
 Serial.print("BPM: ");                        // Print phrase "BPM: " 
 Serial.println(myBPM);                        // Print the value inside of myBPM. 
}
 
  delay(20);                    // considered best practice in a simple sketch.
  Firebase.setInt("/pulse",myBPM);
  if (myBPM>100)
  {
  digitalWrite(LED, HIGH);
  sms.beginSMS(remoteNum);
  sms.print(txtMsg);
  sms.endSMS();
    }
  
  delay(3000);
  digitalWrite(LED, LOW);
}
