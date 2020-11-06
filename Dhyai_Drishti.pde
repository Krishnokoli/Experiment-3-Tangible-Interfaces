/*
 This code is for the Dhyai Drishti installation for Tangible Interfaces assignment, Experiment 3
 Based on Kate Hartman and Nick Puckett's example for tangible interfaces assignment
 Based on based on this Lab on the ITP Physical Computing site: 
 https://itp.nyu.edu/physcomp/labs/labs-serial-communication/two-way-duplex-serial-communication-using-an-arduino/
 */

import processing.serial.*; // import the Processing serial library
Serial myPort;              // The serial port

int totalPins =12;
int pinValues[] = new int[totalPins];
int pinValuesPrev[] = new int[totalPins];

int margin = 50;

  
import processing.sound.*;
SoundFile sahasaraSound;
SoundFile ajnaSound;
SoundFile visuddhaSound;
SoundFile anahataSound;
SoundFile manipuraSound;
SoundFile svadisthanaSound;
SoundFile muladharaSound;


//Image Variables
PImage sahasaraImage;
PImage ajnaImage;
PImage visuddhaImage;
PImage anahataImage;
PImage manipuraImage;
PImage svadisthanaImage;
PImage muladharaImage;
PImage stateImage;

//Circle Array
ArrayList<Circle> circles = new ArrayList<Circle>();


void setup() {
  frameRate (12);
  size(800,800);
  // List all the available serial ports in the console
  printArray(Serial.list());

  // Change the 0 to the appropriate number of the serial port
  // that your microcontroller is attached to.
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  // read incoming bytes to a buffer
  // until you get a linefeed (ASCII 10):
  myPort.bufferUntil('\n');
  
  //Load Images
  
  stateImage = loadImage("Dhyai_Drishti.png");
  sahasaraImage = loadImage("Sahasara.png");
  ajnaImage = loadImage("Ajna.png");
  visuddhaImage = loadImage("Visuddha.png");
  anahataImage = loadImage("Anahata.png");
  manipuraImage = loadImage("Manipura.png");
  svadisthanaImage = loadImage("Svadistha.png");
  muladharaImage = loadImage("Muladhara.png");
  
  //Load Sound
  
  sahasaraSound = new SoundFile(this,"Sahasara_Sound.mp3");
  ajnaSound = new SoundFile(this,"Ajna_Sound.mp3");
  visuddhaSound = new SoundFile(this,"Visuddha_Sound.mp3");
  anahataSound = new SoundFile(this,"Anahata_Sound.mp3");
  manipuraSound = new SoundFile(this,"Manipura_sound.mp3");
  svadisthanaSound = new SoundFile(this,"Svadisthana_Sound.mp3");
  muladharaSound = new SoundFile(this,"Muladhara_Sound.mp3");
}

void touch() {
  for(int i = 0;i<pinValues.length;i++)
  {
     if(pinValues[i]==0)
     {
        for(int r = 0; r < 1; r++){
           circles.add(new Circle(width/2, height/2)); 
          }
     }
  }
}

void draw() 
{
  background(0);
  image(stateImage,0,0);
  noStroke();
  
  touch();
  for(int i = 0;i<pinValues.length;i++)
  {
     if(pinValues[i]==1)
     {
       //Sahasara
       if(i==0){
           fill (197, 183, 239);
           background(55,55,112);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(sahasaraImage,0,0);
       }
       //Ajna
       if(i==2){
           fill (152,215,249);
           background (25,40,63);
           for (int g1 = circles.size()-1; g1 >= 0; g1--) {
              circles.get(g1).move();
              circles.get(g1).display();
    
                  if(circles.get(g1).isOffScreen()){
                    circles.remove(g1);
                    }
              }
              image(ajnaImage,0,0);
       }
       //Visuddha
       if(i==4){
           fill (172,234,249);
           background (2,52,63);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(visuddhaImage,0,0);
       }
       //Anahata
       if(i==6){
           fill (159,216,149);
           background (13,48,13);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(anahataImage,0,0);
       }
       //Manipura
       if(i==8){
           fill (255,222,128);
           background (114,84,0);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(manipuraImage,0,0);
       }
       //Svadisthana
       if(i==10){
           fill (255,177,138);
           background (48,14,10);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(svadisthanaImage,0,0);
       }
       //Muladhara
       if(i==11){
           fill (255,141,185);
           background(58,0,33);
           for (int r1 = circles.size()-1; r1 >= 0; r1--) {
              circles.get(r1).move();
              circles.get(r1).display();
    
                  if(circles.get(r1).isOffScreen()){
                    circles.remove(r1);
                    }
              }
              image(muladharaImage,0,0);
       }
        else
       {
        noFill(); 
       }
     } 
     //SOUND
     //Sahasara Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==0)
           {
             sahasaraSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==0)
           {
            sahasaraSound.pause(); 
           }
       }
     //Ajna Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==2)
           {
             ajnaSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==2)
           {
            ajnaSound.pause(); 
           }
       }
     //Visuddha Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==4)
           {
             visuddhaSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==4)
           {
            visuddhaSound.pause(); 
           }
       }
     //Anahata Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==6)
           {
             anahataSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==6)
           {
            anahataSound.pause(); 
           }
       }
     //Manipura Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==8)
           {
             manipuraSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==8)
           {
            manipuraSound.pause(); 
           }
       }
     //Svadisthana Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==10)
           {
             svadisthanaSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==10)
           {
            svadisthanaSound.pause(); 
           }
       }
       //muladhara Sound
       if((pinValues[i]==1)&&(pinValuesPrev[i]==0))
       {
         if(i==11)
           {
             muladharaSound.play(); 
           }
       }
       if((pinValues[i]==0)&&(pinValuesPrev[i]==1))
       {
          if(i==11)
           {
            muladharaSound.pause(); 
           }
       }


  //save the previous value   
  pinValuesPrev[i] = pinValues[i];   
  }
  
  

 
}


void serialEvent(Serial myPort) {
  // read the serial buffer:
  String myString = myPort.readStringUntil('\n');
  if (myString != null) {
    // println(myString);
    myString = trim(myString);
    pinValues = int(split(myString,','));

    
  }
  //printArray(pinValues);
}

//Circle
class Circle {

  float x;
  float y;
  float xSpeed = random(-2,2);
  float ySpeed = random(-2,2);
  
  Circle(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void move() {
    x += xSpeed;
    y += ySpeed;
  }

  void display() {
    ellipse(x, y, 1, 1);
  }
  
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}
