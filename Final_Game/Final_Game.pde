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
  Serial.begin(9600);
}
int letter=0;
int speed=60;
int movement=0;
int x=player.x;
void loop()
{
  walls();
  if (ReadPx(player.x,player.y)==Green)
  {
    ClearSlate();
  }
  //need some way to track player movement?When player moves lasers are drawn
  //or you could have two variable one for x coordinate and one for y coordinate
  //then use those variable to always have twon lasers that follow player
/*    if (int (x++))
  {
    movement++;
    Serial.println("hello");
  }
  if (player.y++)
  {
    movement++;
    Serial.println("hello");
  }
  */
  map1();
  character();
}

void map1()//there needs to be a delay before laser shoots out
//, but if I add delat before map1(); then it screws up
//need delay to only apply to the lasers and not player
{
  for (int k=0; k < 8; k++)
  {
    DrawPx(player.x,0,Green);//I need it to draw this<--
    DrawPx(0,player.y,Green);//and this first then delay it<---
    DrawPx(player.x,k,Green);//then draw these lasers <--
    DrawPx(k,player.y,Green);//<--
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

