//You should implement your assign3 here.

PImage start1;
PImage start2;
PImage end1;
PImage end2;
PImage bg1;
PImage bg2;
PImage enemy;
PImage bg3;
PImage fighter;
PImage hp;
PImage treasure;
PImage enemy2;
PImage bomb;

int enemyX, enemyY, bloodL, treasureX, treasureY, edge, bg2X, bg2Y, bg1X, bg1Y,start1X,start2X,gameState,end1X,end2X,stop;
int enemyXL, enemyXR, enemyYU, enemyYD;
int treasureXL, treasureXR, treasureYU, treasureYD;
//int enemyL=enemyX-280,enemyH=enemyY+200;
//int a=enemyL/5,b=enemyH/5,c=5;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int HIT_TREASURE = 3;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

float fighterX,fighterY,fighterYT,speed = 5;

void setup () {
  size(640, 480) ;
  start2 = loadImage("img/start2.png");
  start1 = loadImage("img/start1.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  start1X = 0;
  start2X = 0;
  gameState = GAME_START;
  enemyX = 0;
  enemy = loadImage("img/enemy.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  bloodL =190;
  treasure = loadImage("img/treasure.png");
  treasureX = floor(random(5,506));
  treasureY = floor(random(40,441));
  enemyY = floor(random(40,430));
  bg2X = 0;
  image(fighter,fighterX,fighterY);
  fighterX = 580;
  fighterY = 220;
  end1X = 0;
  end2X = 0; 
}

void draw() {
    switch (gameState)
    {
      case GAME_START:
        image(start2,start2X,0);
        if (mouseX>=200 && mouseX<=450 && mouseY>=365 && mouseY<=410)
          {
          image(start1,start1X,0);
          if (mousePressed)
            gameState =GAME_RUN;
          else
            image(start1,start1X,0);
          }
        break;
      
      case GAME_RUN:
        image(bg2,bg2X,0);
        image(bg1,bg2X-640,0);
        image(fighter,fighterX,fighterY);
        image(treasure,treasureX,treasureY);
        
        rectMode(CORNERS);
        fill(220,20,20);
        // bloodL = floor(random(201));
        rect(18,10,18+bloodL,24,5);
        image(hp,5,5);
        

         image(enemy,enemyX,enemyY);
         image(enemy,enemyX-70,enemyY);
         image(enemy,enemyX-140,enemyY);
         image(enemy,enemyX-210,enemyY);
         image(enemy,enemyX-280,enemyY);
   
            //image(enemy,enemyX,enemyY);
            //image(enemy,enemyX-70,enemyY+50);
            //image(enemy,enemyX-140,enemyY+100);
            //image(enemy,enemyX-210,enemyY+150);
            //image(enemy,enemyX-280,enemyY+200);
            
           


        
            
        // edge = enemyX % 640;
        if (enemyX-280 > 640) 
          {
          enemyX = 0;
          enemyY = floor(random(40,430));
          }
          enemyX += 3;
       
        //range of hit treasure 
        treasureXL = treasureX-50;
        treasureXR = treasureX+50;
        treasureYU = treasureY-50;
        treasureYD = treasureY+50;
        
        if (bg2X > 640) 
          {
          bg2X = 0;
          bg3 = bg1;
          bg1 = bg2;
          bg2 = bg3;
          }  
        bg2X += 1;
        
        if (upPressed)
          fighterY -= speed;
        if(downPressed)
          fighterY += speed;
        if(leftPressed)
          fighterX -= speed;
        if(rightPressed)
          fighterX += speed;
        fighterYT = int(fighterY); 
            //fighter out of boundary
        if (fighterX >= 580) 
          rightPressed = false;
        if (fighterX <= 20)
          leftPressed = false;
        if (fighterY <= 20)
          upPressed = false;
        if (fighterY >= 420)
          downPressed = false;
                  
        
        
        //hit treasure
        if (fighterX <= treasureXR && fighterX >= treasureXL && fighterY <= treasureYD && fighterY >= treasureYU) 
           gameState = HIT_TREASURE;
        break;
        
       case HIT_TREASURE:
        treasureX = floor(random(5,506));
        treasureY = floor(random(40,441));
        if (bloodL > 0 && bloodL <= 190)
          gameState = GAME_RUN;
        bloodL = bloodL + 19*1; 
        if (bloodL <= 0)
          gameState = GAME_OVER;
        if (bloodL > 190)
          bloodL = 190;
        break;  
      
      case GAME_OVER:
        image(end2,end2X,0);
        if (mouseX>=200 && mouseX<=450 && mouseY>=315 && mouseY<=350)
        {
          image(end1,end1X,0);
          if (mousePressed)
            {
            bloodL = 190;  
            fighterX = 580;
            fighterY = 220;
            gameState =GAME_RUN;            
            }
          else
            image(end1,end1X,0);
        }
        break;
    }
        //fighter out of boundary
        if (fighterX >= 580) 
          rightPressed = false;
        if (fighterX <= 20)
          leftPressed = false;
        if (fighterY <= 20)
          upPressed = false;
        if (fighterY >= 420)
          downPressed = false;

}

void keyPressed(){
  if (key == CODED)
    switch (keyCode)
    {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }

}


void keyReleased(){
if (key == CODED)
    switch (keyCode)
    {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
}
