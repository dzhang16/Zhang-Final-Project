//Dylan Zhang
#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
struct Point
{
  int x;
  int y;
};

Point player={3,4};
void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
}
int letter=0;
int speed=60;
void loop()
{
  walls();
  if (ReadPx(player.x,player.y)==White)
  {
    ClearSlate();
  }
  delay(700);
  DrawPx(2,0,7);
  DrawPx(0,5,7);
  DisplaySlate();
  delay(700);
  map1();
}

int j=0;
void map1()
{
  for (int k=0; k < 8; k++)
  {
    DrawPx(2,k,7);
    DrawPx(k,5,7);
    
/*    DrawPx(2,1,7);
    DrawPx(2,2,7);
    DrawPx(2,3,7);
    DrawPx(2,4,7);
    DrawPx(2,5,7);
    DrawPx(2,6,7);
    DrawPx(2,7,7);
    DrawPx(1,5,7);
    DrawPx(2,5,7);
    DrawPx(3,5,7);
    DrawPx(4,5,7);
    DrawPx(5,5,7);
    DrawPx(6,5,7);
    DrawPx(7,5,7);*/
    DisplaySlate();
    delay(200);
    if (k++)
    {
      j++;
      {
        if (j==1)
        {
          character();
         }
      }
    }
  }
}



void walls()                     // run over and over again
{
  for (int j=0; j < 8; j++)
  {
    
    DrawPx(0,j,Blue);
    DrawPx(j,7,Blue);
    DrawPx(j,0,Blue);
    DrawPx(7,j,Blue);
    DisplaySlate();
  }
}

void character()
{
  CheckButtonsDown();
  if(Button_Left)
  {
    int(player.x--);
    {
      if(player.x<1)
      {
        player.x=1;
      }
    }
  }
  if(Button_Right)
  {
    int(player.x++);
    {
      if(player.x>6)
      {
        player.x=6;
      }
    }
  }
  if(Button_Up)
  {
    int(player.y++);
    {
      if(player.y>6)
      {
        player.y=6;
      }
    }
  }
  if(Button_Down)
  {
    int(player.y--);
    {
      if(player.y<1)
      {
        player.y=1;
      }
    }
  }
  DrawPx(player.x,player.y,Red); 
  DisplaySlate();
  delay(150);
  ClearSlate();
}








// this is second version
/*
#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
struct Point
{
  int x;
  int y;
};

Point player={3,4};
void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
}
int letter=0;
int speed=60;
void loop()
{
  walls();
  if (ReadPx(player.x,player.y)==White)
  {
    ClearSlate();
  }
  delay(700);
  DrawPx(2,0,7);
  DrawPx(0,5,7);
  DisplaySlate();
  delay(700);
  map1();
  character();
}

int k=0;
void map1()
{
  if (k==0)
  {
    DrawPx(2,1,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,2,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,3,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,4,7);
    k++;
  }
  if (k==1)
  { 
    DrawPx(2,5,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,6,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,7,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(1,5,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(2,5,7);
    k++;
  }
  if (k==1)
  {
    DrawPx(3,5,7);
    k++;
  }
  if (k==1)
  { 
    DrawPx(4,5,7);
    k++;
  }
  if (k==1)
  { 
    DrawPx(5,5,7);
    k++;
  }
  if (k==1)
  { 
    DrawPx(6,5,7);
    k++;
  }
  if (k==1)
  { 
    DrawPx(7,5,7);
    k++;
    DisplaySlate();
    delay(200);
  }
}


void walls()                     // run over and over again
{
  for (int j=0; j < 8; j++)
  {
    
    DrawPx(0,j,Blue);
    DrawPx(j,7,Blue);
    DrawPx(j,0,Blue);
    DrawPx(7,j,Blue);
    DisplaySlate();
  }
}

void character()
{
  CheckButtonsDown();
  if(Button_Left)
  {
    int(player.x--);
    {
      if(player.x<1)
      {
        player.x=1;
      }
    }
  }
  if(Button_Right)
  {
    int(player.x++);
    {
      if(player.x>6)
      {
        player.x=6;
      }
    }
  }
  if(Button_Up)
  {
    int(player.y++);
    {
      if(player.y>6)
      {
        player.y=6;
      }
    }
  }
  if(Button_Down)
  {
    int(player.y--);
    {
      if(player.y<1)
      {
        player.y=1;
      }
    }
  }
  DrawPx(player.x,player.y,Red); 
  DisplaySlate();
  delay(150);
  ClearSlate();
}




//third
struct Point
{
  int x;
  int y;
};

Point player={3,4};
void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
  Serial.begin(9600);
}
int letter=0;
int speed=60;
int timer=0;
void loop()
{
  if (timer%5==0)
  {
    
  timer++;
  {
    Serial.println("hello");
  }
}
*/
