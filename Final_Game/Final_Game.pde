//Dylan Zhang
//try make it so that you start out with one or two boulders then when the counter 
//reaches a certain number add the next boulder and decrease speed
//also add lives 
#include <MeggyJrSimple.h>    // Required code, line 1 of 2.
struct Point
{
  int x;
  int y;
};

Point player={3,4};
Point laser={1,0};
Point laser2={0,3};
Point laser3={3,0};
Point laser4={0,5};
void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
  Serial.begin(9600);
}
int letter=0;
int speed=230;
int movement=0;
int x=player.x;
int counter=0;
int DeathCounter=0;
void loop()
{
  if (letter == 1)//death screen
    DrawA();
    SetAuxLEDsBinary(B00000000);
  if (letter == 0)
    DrawB();
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
}

void DrawB()
{
  if (counter==3)
  {
    speed=200;//speeds it up 
  }
  else
  if (laser2.x==7)
  {
    counter++;
  }
  walls();
  if (player.x==laser.x)
  {
    if (player.y==laser.y)
    {
      DeathCounter++;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser2.x)
  {
    if (player.y==laser2.y)
    {
      DeathCounter++;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser3.x)
  {
    if (player.y==laser3.y)
    {
      DeathCounter++;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser4.x)
  {
    if (player.y==laser4.y)
    {
      DeathCounter++;
      Tone_Start(ToneC3, 150);
    }
  }
  if (DeathCounter==0)
  {
    SetAuxLEDsBinary(B11111111);
  }
  if (DeathCounter==1)
  {
    SetAuxLEDsBinary(B11111110);
  }
  if (DeathCounter==2)
  {
    SetAuxLEDsBinary(B11111100);
  }
  if (DeathCounter==3)
  {
    SetAuxLEDsBinary(B11111000);
  }
  if (DeathCounter==4)
  {
    SetAuxLEDsBinary(B11110000);
  }
  if (DeathCounter==5)
  {
    SetAuxLEDsBinary(B11100000);
  }
  if (DeathCounter==6)
  {
    SetAuxLEDsBinary(B11000000);
  }
  if (DeathCounter==7)
  {
    SetAuxLEDsBinary(B10000000);
  }
  if (DeathCounter>7)
  {
    letter=1;
  }
  map1();
  character();
}
void DrawA()//death screen
{
  for (int j=0; j < 8; j++) 
  {
    DrawPx(j,0,Red);
    DrawPx(j,1,Red);
    DrawPx(j,2,Red);
    DrawPx(j,3,Red);
    DrawPx(j,4,Red);
    DrawPx(j,5,Red);
    DrawPx(j,6,Red);
    DrawPx(j,7,Red);
    DisplaySlate();
  }
  CheckButtonsPress();
  if (Button_B)
  {
    letter=0;
    DeathCounter=0;
    player.x=3;
    player.y=4;
    speed=230;
    counter=0;
  }
}

void map1()//there needs to be a delay before laser shoots out
//, but if I add delay before map1(); then it screws up
//need delay to only apply to the lasers and not player
{
  DrawPx(laser2.x,laser2.y,Green);
  {
    if (laser2.x==7)
    {
      laser2.y=player.y;
      laser2.x=0;
    }
    else
    if (laser2.x<7)
    {
      laser2.x++;
    }
  }
  DrawPx(laser4.x,laser4.y,Green);
  {
    if (laser4.x==7)
    {
      laser4.y=random(6)+1;
      laser4.x=0;
    }
    else
    if (laser4.x<7)
    {
      laser4.x++;
    }
  }
  DrawPx(laser.x,laser.y,Green);
  {
    if (laser.y == 7)
    {
      laser.x = player.x;
      laser.y = 0;
    }
    else
    if (laser.y<7)
    {
      laser.y++;
    }
  }
  DrawPx(laser3.x,laser3.y,Green);
  {
    if (laser3.y==7)
    {
      laser3.x=random(6) + 1;
      laser3.y=0;
    }
    else
    if (laser3.y<7)
    {
      laser3.y++;
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
  delay(speed);
  ClearSlate();
}

