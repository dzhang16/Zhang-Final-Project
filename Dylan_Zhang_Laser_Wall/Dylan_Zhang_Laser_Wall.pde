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
Point laser={1,0};//one of the obstacles
Point laser2={0,3};//second obstacle
Point laser3={3,0};//third obstacle
Point laser4={0,5};//4th obstacle
void setup()                    // run once, when the sketch starts
{
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
  Serial.begin(9600);
}
int letter=0;//to help change between methods
int speed=230;//made speed so that I could decrease it after a certain number of turns
int movement=0;
int x=player.x;
int counter=0;//to keep track of turns
int DeathCounter=0;// to keep track of deaths for the lives
void loop()
{
  if (letter == 1)//death screen
    DrawA();
    SetAuxLEDsBinary(B00000000);
  if (letter == 0)//this is the first screen you see when you turn on with 2 obstacles
    DrawB();
  if (letter==2)//last level with four obstacles
    DrawC();
  if (letter==3)//3 obstacle level
    DrawD();
  if (letter==4)
    DrawE();
  if (letter==5)
    DrawF();
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

void DrawB()//first level with 1 obstacle
{
  if (counter==6)
  {
    letter=3;//changes it to different method
  }
  else// if not do this
  if (laser2.x==7)
  {
    counter++;
  }
  walls();
  if (player.x==laser.x)//all this is to just make the meggy check to see if the laser is touching the player
  {
    if (player.y==laser.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser2.x)
  {
    if (player.y==laser2.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser3.x)
  {
    if (player.y==laser3.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser4.x)
  {
    if (player.y==laser4.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  Death();//controls LED's
  map1();//Draw lasers
  character();//player movement
}










void DrawD()//second level with 3 obstacles
{
  if (counter==12)
  {
    letter=2;//changes method
    Serial.println("B");
  }
  else
  if (laser.y==7)
  {
    counter++;
  }
  walls();//boundaries
  if (player.x==laser.x)//checks if laser toouching player
  {
    if (player.y==laser.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser2.x)
  {
    if (player.y==laser2.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser3.x)
  {
    if (player.y==laser3.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  Death();//LED's for the lives.  turns one LED off everytime you get hit
  map3();//draws lasers
  character();//playermovement
}














void DrawC()
{
  if (counter==17)
  {
    letter=4;//goes to win screen
    Serial.println("B");
  }
  else
  if (laser2.x==7)
  {
    counter++;
  }
  walls();//boundaries
  if (player.x==laser.x)//checks if lasers touching player
  {
    if (player.y==laser.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser2.x)
  {
    if (player.y==laser2.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser3.x)
  {
    if (player.y==laser3.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser4.x)
  {
    if (player.y==laser4.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  Death();//turns one LED off everytime you get hit
  map2();//draws lasers
  character();//controls movement
}







void DrawF()//endless level, after you die you go back to the win screen and can choose to do it again or go back to the very beginning
{
  if (counter==3)
  {
    speed=210;
    Serial.println("B");
  }
  if (counter==10)
  {
    speed=170;
  }
  else
  if (laser2.x==7)
  {
    counter++;
  }
  walls();//boundaries
  if (player.x==laser.x)//checks if lasers touching player
  {
    if (player.y==laser.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser2.x)
  {
    if (player.y==laser2.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser3.x)
  {
    if (player.y==laser3.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (player.x==laser4.x)
  {
    if (player.y==laser4.y)
    {
      DeathCounter+=1;
      Tone_Start(ToneC3, 150);
    }
  }
  if (DeathCounter==0)//turns one LED off everytime you get hit
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
    letter=4;
  }
  map2();//draws lasers
  character();//controls player movement
}








void DrawE()//win screen
{
  for (int j=0; j < 8; j++) 
  {
    DrawPx(j,0,Green);
    DrawPx(j,1,Green);
    DrawPx(j,2,Green);
    DrawPx(j,3,Green);
    DrawPx(j,4,Green);
    DrawPx(j,5,Green);
    DrawPx(j,6,Green);
    DrawPx(j,7,Green);
    DisplaySlate();
  }
  CheckButtonsPress();
  if (Button_B)//goes back to the very beginning
  {
    letter=0;
    DeathCounter=0;
    player.x=3;
    player.y=4;
    speed=230;
    counter=0;
  }
  if (Button_A)//continues to an endless type of gametype where you can't win, but can challenge yourself to dodging
  {
    letter=5;
    DeathCounter=0;
    player.x=3;
    player.y=4;
    speed=230;
    counter=0;
  }
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
  if (Button_B)//goes back to the very beginning
  {
    letter=0;
    DeathCounter=0;
    player.x=3;
    player.y=4;
    speed=230;
    counter=0;
  }
}










void map1()// first level with two obstacles
{
  DrawPx(laser2.x,laser2.y,Green);//draws laser
  {
    if (laser2.x==7)//loops obstacle back if it reaches end
    {
      laser2.y=player.y;
      laser2.x=0;
    }
    else
    if (laser2.x<7)//laser goes up one space if not at end
    {
      laser2.x++;
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
}



void map3()//second level with 3 obstacle
{
  DrawPx(laser2.x,laser2.y,Green);//draws laser
  {
    if (laser2.x==7)//loops obstacle back if it reaches end
    {
      laser2.y=player.y;
      laser2.x=0;
    }
    else
    if (laser2.x<7)//laser goes up one space if not at end
    {
      laser2.x++;
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



void map2()//last level with 4 obstacles
{
  DrawPx(laser2.x,laser2.y,Green);//draws laser
  {
    if (laser2.x==7)//loops obstacle back if it reaches end
    {
      laser2.y=player.y;
      laser2.x=0;
    }
    else
    if (laser2.x<7)//laser goes up one space if not at end
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





void walls()//boundaries for the character                     // run over and over again
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





void character()//code for character movement
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


void Death()//these are to show the lives with the LEDS.  turns one LED off everytime you get hit
{
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
    letter=1;//goes to death screen when counter goes above 7 
  }
}
