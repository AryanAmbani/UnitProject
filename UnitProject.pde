import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//PImage Kill;
float circlex [];
float circley [];
float xdirection [];
float ydirection[];
float x = 20;
float y = 20;
int diff =1;
int lasttime=0;
int screen= 1;
Minim minim;
AudioPlayer boink;
void setup()
{
  minim = new Minim(this);
  boink = minim.loadFile("Boink.mp3");
  fullScreen(P3D);
  //Kill=loadImage("Kill.png");

  circlex= new float [100];
  circley= new float [100];
  xdirection= new float [100];
  ydirection= new float [100];
  for (int i=0; i<100; i++)
  {
    circlex[i] = random(width);
    circley[i]= random (height);

    xdirection[i]= random(10);
    ydirection[i]= random(10);
  }
}

void draw()
{
  if (screen == 1)
  {
    background(0);
    for (int i=0; i<diff; i++)
    {

      fill(1, 100, 230);
      ellipse(circlex[i], circley[i], x, y);

      circlex[i] = circlex[i] + xdirection[i];
      circley[i] = circley[i] + ydirection[i];

      if (circlex[i]> width)
      {
        xdirection[i]= xdirection[i] *-1;
      }

      if (circlex[i]<0)
      {
        xdirection[i] = xdirection[i] *-1;
      }
      
      if (circley[i]> height)
      {
        ydirection[i] = ydirection [i] *-1;
      }
      
      if (circley[i]< 0)
      {
        ydirection[i] = ydirection [i] * -1;
      }
      
      if  (dist(circlex[i], circley[i], mouseX, mouseY)<10)
      {
        screen =2;
        break;
      }
      
      if (millis() - lasttime > 1000)
      {
        lasttime=millis();
        diff = diff +1;
      }
      
      fill(random(255), random(255), random(255), random(255)); 
      ellipse(mouseX, mouseY, 10, 10);
    }
  }

  if (screen == 2)
  {
    background(255);
    boink.play();
    text("HA TRY HARDER", height/2, width/2);
  }
}