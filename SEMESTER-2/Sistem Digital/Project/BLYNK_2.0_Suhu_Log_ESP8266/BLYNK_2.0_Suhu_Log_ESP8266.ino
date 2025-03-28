/*
# File Name      : Monitoring Suhu dan Kelembapan
# Customer       : Mr Yudhi
# Judul Research : Monitoring Suhu dan Kelembapan
# Deskripsi      : Monitoring Suhu dan Kelembapan          
# Maker by       : Arkan3dStudio Research And Implementation Team
# Start Created  : 20 Juni 2023
# Last Update    : 22 Juni 2023
# Revisi         : 0
# Version        : -
# IoT Platform   : Blynk Iot
 
# Software Requirement
      - Arduino IDE 
# Library
      - Blynk 
      - DHT 22
      - Liquid Crystal i2C
      - Arduino Json
# Hardware Requirement
      - Main Core : ESP8266
      - Input     : DHT22 Senosr
      - Output    : Temperature & Kelembapan (float)
      - Aksesoris : -
                    
# Catatan : 
#define BLYNK_TEMPLATE_ID "TMPL6ARpXN06c"
#define BLYNK_TEMPLATE_NAME "Monitoring Suhu dan Kelembapan"
#define BLYNK_AUTH_TOKEN "mCW5XQSTYwC69KDgw30db-sd0S9PgPrS"
 */


#define BLYNK_TEMPLATE_ID "TMPL6ARpXN06c"
#define BLYNK_DEVICE_NAME "Monitoring Suhu dan Kelembapan"
#define BLYNK_AUTH_TOKEN "mCW5XQSTYwC69KDgw30db-sd0S9PgPrS"
#define BLYNK_PRINT Serial
#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <DHT.h>


LiquidCrystal_I2C lcd(0x27, 16, 2); // set the LCD address to 0x27 for a 16 chars and 2 line display

char auth[] = BLYNK_AUTH_TOKEN;
char ssid[] = "Wokwi-GUEST";  // type your wifi name
char pass[] = "";  // type your wifi password

#define DHTPIN 15          // Tentukan PIN Sensor ingin di Letak dimana
#define DHTTYPE DHT22     // DHT 22
DHT dht(DHTPIN, DHTTYPE);
BlynkTimer timer;

// Inisialisasi Port Virtual Blynk 
#define BLYNK_SENSOR_TEMP    V0
#define BLYNK_SENSOR_HUM     V1


void deteksi_sensor(){
  float h = dht.readHumidity();
  float t = dht.readTemperature(); // or dht.readTemperature(true) for Fahrenheit
  if (isnan(h) || isnan(t)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp:" + String(t)+" " + "℃");
    lcd.setCursor(0, 1);
    lcd.print("Hum :" + String(h)+" " + "%");
    
  Serial.println(t);
  Serial.print("Temperature : ");
  Serial.print(t);
  Serial.print("    Humidity : ");
  Serial.println(h);
}


void send_sensor_blynk(){
  float h = dht.readHumidity();
  float t = dht.readTemperature(); // or dht.readTemperature(true) for Fahrenheit
  Blynk.virtualWrite(BLYNK_SENSOR_HUM, h);  
  Blynk.virtualWrite(BLYNK_SENSOR_TEMP, t);

   if(t > 30){
   // Blynk.email("shameer50@gmail.com", "Alert", "Temperature over 28C!");
    Blynk.logEvent("temp_alert","Suhu Melebihi Batas Yang Di Tentukan");
    }
   }


void setup(){
  lcd.begin();
  lcd.backlight();
    lcd.setCursor(0, 0);
    lcd.print(" KELOMPOK 9 ");
    lcd.setCursor(0, 1);
    lcd.print(" SUHU RUANGAN 1 ");
    delay(3000);
    lcd.clear();
 // put your setup code here, to run once:
  Serial.begin(115200);
  delay(100);
  lcd.setCursor(0, 0);
  lcd.print("Connecting to ...");
  lcd.setCursor(0, 1);
  lcd.print(ssid);
  delay(2000);
  lcd.clear();
  WiFi.begin(ssid, pass);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  lcd.setCursor(0, 0);
  lcd.print("WiFi connected ...");
  delay(3000);
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("Start ....");
  delay(2000);
  lcd.clear();  
  Blynk.begin(auth, ssid, pass);
  dht.begin();
  timer.setInterval(1000L, deteksi_sensor);
  timer.setInterval(1000L, send_sensor_blynk);
}

void loop(){
  Blynk.run();
  timer.run();
}
