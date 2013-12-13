//Dylan Zhang

#include <MeggyJrSimple.h>    // Required code, line 1 of 2.

void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();      // Required code, line 2 of 2.
}

int x=3;
int y=4;
void loop()                     // run over and over again
{
  for (int j=0; j < 8; j++)
  {
    
    DrawPx(0,j,Blue);
    DrawPx(j,7,Blue);
    DrawPx(j,0,Blue);
    DrawPx(7,j,Blue);
    DrawPx(1,1,Red);
    DisplaySlate();
  }
  CheckButtonsDown();
  if(Button_Left)
  {
    int(x--);
    {
      if(x<1)
      {
        x=1;
      }
    }
  }
  if(Button_Right)
  {
    int(x++);
    {
      if(x>6)
      {
        x=6;
      }
    }
  }
  if(Button_Up)
  {
    int(y++);
    {
      if(y>6)
      {
        y=6;
      }
    }
  }
  if(Button_Down)
  {
    int(y--);
    {
      if(y<1)
      {
        y=1;
      }
    }
  }
  DrawPx(x,y,Red); 
  DisplaySlate();
  delay(150);
  ClearSlate();
}


