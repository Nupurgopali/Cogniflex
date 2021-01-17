#include <TinyGPS++.h>
#include <SoftwareSerial.h>
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>
#include <Stdlib.h>

TinyGPSPlus gps;  // The TinyGPS++ object

SoftwareSerial ss(4, 5); // The serial connection to the GPS device

//#define FIREBASE_HOST "" //--> URL address of your Firebase Realtime Database.
//#define FIREBASE_AUTH "" //--> Your firebase database secret code.

#define ON_Board_LED 2  //--> Defining an On Board LED, used for indicators when the process of connecting to a wifi router

const char* ssid = "JioFi2_AC3C89";
const char* password = "7hif2h64jb";

float latitude , longitude;
int year , month , date, hour , minute , second;
String date_str , time_str , lat_str , lng_str;
int pm;

float homeLat = 25.413936;
float homeLon = 68.266236;
float thresholdDistance = 1.00; //km

WiFiServer server(80);
void setup()
{
  Serial.begin(115200);
  ss.begin(9600);
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");

  server.begin();
  Serial.println("Server started");

  // Print the IP address
  Serial.println(WiFi.localIP());

}

void loop()
{
   while (ss.available() > 0)
    if (gps.encode(ss.read()))
      displayInfo();

  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
    while(true);
  }`

    getData();
}

void displayInfo()
{
  Serial.print(F("Location: ")); 
  if (gps.location.isValid())
  {
    Serial.print(gps.location.lat(), 6);
    Serial.print(F(","));
    Serial.print(gps.location.lng(), 6);
  }
  else
  {
    Serial.print(F("INVALID"));
  }
}

void getData()     
{
  while(true)
  {
    if(Serial2.available()>0)   // check for gps data
    {
       if(gps.encode(Serial2.read()))  // encode gps data
       break;
    }
  }       
    gps.f_get_position(&lat,&lon); // get latitude and longitude
    Serial.println("In getdata");
    checkDist(lat, lon);
}

void checkDist(float ltd , float lon)
{

   float dist = HaverSine(homeLat,homeLon,ltd,lon);
 
  if (dist >= thresholdDistance )
  {
   
    Serial.print("Subject is ");
    Serial.print(dist - thresholdDistance, 6);
    Serial.println("KM beyond threshold");   
  }
else
  {
        Serial.println("Subject within threshold, no worries!");
  }
}
long HaverSine(float lat1, float lon1, float lat2, float lon2)
{
 float ToRad = PI / 180.0;
 float R = 6371;   // radius earth in Km
 
 float dLat = (lat2-lat1) * ToRad;
 float dLon = (lon2-lon1) * ToRad;
 
 float a = sin(dLat/2) * sin(dLat/2) +
       cos(lat1 * ToRad) * cos(lat2 * ToRad) *
       sin(dLon/2) * sin(dLon/2);
       
 float c = 2 * atan2(sqrt(a), sqrt(1-a));
 
 float d = R * c;
 Serial.print(d, 6);
 return d;
}
