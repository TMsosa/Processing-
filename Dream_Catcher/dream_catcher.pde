
int timer = 0;

Sleepman mySleepman;
Cloud myCloud1;
Cloud myCloud2;
Cloud myCloud3;
Cloud myCloud4;
Cloud myCloud5;

int maxLife = 15;
int lifeCount = maxLife;

float x = 30;
float y = 550;
float speed = 5;
int xs = 500;
int ys = 500;
int ps = 20;
Sleepmeny[] enemies = new Sleepmeny[5];
Life[] lives = new Life[3];
 
 void mouseClicked() {
   lifeCount = 100;
   loop();
 }
 
void setup() {
  size(600,600);
  smooth();
  noStroke();
  for (int i =0; i < enemies.length; i++) {
    enemies[i] = new Sleepmeny();
  }
  for (int i = 0; i < 3; i++) {
    lives[i] = new Life();
  }
   mySleepman = new Sleepman();
   myCloud1 = new Cloud();
   myCloud2 = new Cloud();
   myCloud3 = new Cloud();
   myCloud4 = new Cloud();
   myCloud5 = new Cloud();
}



void StaRs(int DoTs) {
  int DoTsah=width/DoTs;
  int x=DoTsah;
  int y=DoTsah;
  int Distance=width-DoTsah;
  while(y<=Distance) {
    stroke(255);
    ellipse(x,y,1,1);
    if (x==Distance) {
      x=DoTsah;
      y +=DoTsah;
    } else {
     x +=DoTsah;
    }
  }
}

void draw() {
  background(3,41,85);
  for (int i =0; i < enemies.length; i++) {
    enemies[i] = new Sleepmeny();
  }
  StaRs(10);
  myCloud1.leftCloud(200,40);
  myCloud2.lowerleftCloud(40,200);
  myCloud3.rightCloud(40,200);
  myCloud4.lowerCloud(40,200);
  myCloud5.lowerrightCloud(40,450);
  Moon(80);
  //sleepmenies(270,30);
  enemies[0].drawRoundSleepmeny(x,270,30);
  enemies[1].drawRectSleepmeny(x,270,30);
  enemies[2].drawRoundSleepmeny1(x,270,30);
  enemies[3].drawRoundSleepmeny2(x,270,30);
  enemies[4].drawRoundSleepmeny3(500,y,30);
  //Lives(20,580,20);
  mySleepman.moveSleepman(xs,ys,ps);
  moveIt();
  Bringit();
  detectCollisions();
  if (lifeCount > maxLife * 2 / 3) {
    lives[0].drawLife1(20,580,20);
    lives[1].drawLife2(20,580,20);
    lives[2].drawLife3(20,580,20);
  } else if (lifeCount > maxLife / 3) {
    lives[1].drawLife2(20,580,20);
    lives[2].drawLife3(20,580,20);
  } else if (lifeCount > 0) {
    lives[1].drawLife3(20,580,20);
  } else if(lifeCount < 0) {
    noLoop();
   fill(255);
   textSize(30);
   text("Game over. Click to restart.", 100, 300);
  }
  timer ++;
  textSize(20);
  fill(255);
  text(timer, 300, 30);
  //println(lifeCount);
  stroke(255); 
}

void moveIt() {
  x=x+speed;
  y=y-speed;
  //y = y + gravity;
  //if (y > height) {
    //speed = speed * -0.95;
  //}
}

void Bringit() {
  if ((x > width) || (x < 0)&&(y > height) || (y < 0)) {
    speed=speed * -1;
  }
}

class Cloud {
  int breadth;
  int tall;
  int size;
   
  Cloud() {
  }
   
  void leftCloud(int breadth,int size) {
    fill(255);
    stroke(255);
    ellipse(x, breadth, size, size);
    ellipse(x + 25, breadth, size, size);
    ellipse(x + 50, breadth, size, size);
    ellipse(x + 75, breadth, size, size);
  }

  void rightCloud(int siZe, int breadth) {
    fill(255);
    stroke(255);
    ellipse(450 - x, breadth - 75, siZe, siZe);
    ellipse(475 - x, breadth - 75, siZe, siZe);
    ellipse(500 - x, breadth - 75, siZe, siZe);
    ellipse(525 - x, breadth - 75, siZe, siZe);
  }

  void lowerleftCloud(int Size, int breadth) {
    fill(255);
    stroke(255);
    ellipse(105 + x, breadth + 200, Size, Size);
    ellipse(130 + x, breadth + 200, Size, Size);
    ellipse(155 + x, breadth + 200, Size, Size);
    ellipse(180 + x, breadth + 200, Size, Size);
  }

  void lowerrightCloud(int sIze,int tall) {
    fill(255);
    stroke(255);
    ellipse(tall , y, sIze, sIze);
    ellipse(tall + 25, y, sIze, sIze);
    ellipse(tall + 50, y, sIze, sIze);
    ellipse(tall + 75, y, sIze, sIze);
  }
  
  void lowerCloud(int sizE, int breadth) {  
    fill(255);
    stroke(255);
    ellipse(400 - x, breadth + 100, sizE, sizE);
    ellipse(425 - x, breadth + 100, sizE, sizE);
    ellipse(450 - x, breadth + 100, sizE, sizE);
    ellipse(475 - x, breadth + 100, sizE, sizE);
  }
}
class Sleepmeny {
 
  int xCenter;
  int yCenter;
  int pixs = 30;
  float dimensions = 30; 
  
  void Sleepmeny() {
  }
  void drawRoundSleepmeny(float x, int y, int pixs) {
    fill(255,213,167);
    ellipse(450 - x, y, pixs, pixs);//circle sleepmeny
    fill(255, 0, 230);
    triangle(430 - x, y - 10, 450 - x, y - 30, 470 - x, y - 10);
    calcCenterEllipse(x, y , pixs);
  }
  void drawRoundSleepmeny1(float x, int y, int pixs) {
    fill(255,213,167);
    ellipse(x + 40, y - 100, pixs, pixs);
    calcCenterRound1(x, y, pixs);
  }
  void drawRectSleepmeny(float x, int y, int pixs) {
     fill(255,213,167);
     rect(130 + x, y + 80, pixs, pixs); //rect sleepmeny
     fill(230,2,50);
     triangle(130 + x, y + 80, 145 + x, y + 60, 160 + x, y + 80);
     calcCenterRect(x,y,pixs);
  }
  void drawRoundSleepmeny2(float x, int y, int pixs) {
    fill(255,213,167);
    ellipse(500 - x, y - 175, pixs, pixs);
    calcCenterRound2(x, y, pixs);
  }
    void drawRoundSleepmeny3(int x, float y, int pixs) {
      fill(255,213,167);
      ellipse(x, y - 30, pixs, pixs);
      calcCenterRound3(x, y, pixs);
    }
  void calcCenterRect(float x, int y, int pixs) {
    xCenter = (int)x + 130 + pixs/2;
    yCenter = y + 80 + pixs/2;
  }
  void calcCenterEllipse(float x, int y, int pixs) {
    xCenter = int(450.0 - x);
    yCenter = y;
  }
  void calcCenterRound1(float x, int y, int pixs) {
    xCenter = (int)x + 40;
     yCenter = y - 100;
}
  void calcCenterRound2(float x, int y, int pixs) {
    xCenter = 500 - (int)x;
    yCenter = y - 175;
  }
  void calcCenterRound3(int x, float y, int pixs) {
    xCenter = x;
    yCenter = (int)y - 30;
}
}
/*
void sleepmenies(int y, int pixs) {
  fill(255,213,167);
  ellipse(450-x,y,pixs,pixs);//circle sleepmeny
  fill(255,0,230);
  triangle(430-x,y-10,450-x,y-30,470-x,y-10);
  fill(255,213,167);
  rect(130+x,y+80,pixs,pixs); //rect sleepmeny
  fill(230,2,50);
  triangle(130+x,y+80,145+x,y+60,160+x,y+80);
}
*/


void Moon (int Big) {
  stroke(0);
  ellipse(300,90,Big,Big);
}
    
class Life {   
    
 void drawLife1(int x, int y, int pix) {
  fill(255,213,167);
  ellipse(x , y, pix, pix);
  fill(145, 149, 149);
  triangle(x - 12, y, x, y - 15, x + 12, y);
}
 void drawLife2(int x, int y, int pix) {
   fill(255,213,167);
   ellipse(x + 25, y, pix, pix);
   fill(145,149,149);
   triangle(x + 13, y, x + 25, y - 15, x + 37, y);
 }
 void drawLife3(int x, int y, int pix) {
   fill(255,213,167);
   ellipse(x + 50, y, pix, pix);
   fill(145,149,149);
   triangle(x + 38,y ,x + 50,y - 15 ,x + 63, y);
 }
}
 
    
  void keyPressed() {
  if(key == CODED) {
    if (keyCode == UP) {
      ys = mySleepman.yLoc - 150;
      mySleepman.moveSleepman(xs,ys,ps);
    } else if(keyCode == LEFT) {
      xs = mySleepman.xLoc - 150;
      mySleepman.moveSleepman(xs,ys,ps);
    } else if(keyCode == RIGHT) {
      xs = mySleepman.xLoc + 100;
      mySleepman.moveSleepman(xs,ys,ps);
    } else if(keyCode == DOWN) {
      ys = mySleepman.yLoc + 100;
      mySleepman.moveSleepman(xs,ys,ps);
    }
  }
}
    
    



    
  class Sleepman {
  int xLoc = 500;
  int yLoc = 500;
  int pixs = 20;
  int xCenter;
  int yCenter;
  float dimensions = 10;//((yLoc + 55 + pixs + 5) - (yLoc + 55)) - (xLoc - 10);
  
  void Sleepman() {
  }
   
  void drawSleepman() {
    fill(255,213,167);
    ellipse(xLoc, yLoc, pixs, pixs);//head 
    fill(255);
    rect(xLoc - 10, yLoc + 10, pixs, pixs + 25);//body
    fill(0);
    rect(xLoc - 10, yLoc + 55, pixs - 13, pixs + 5);//left leg
    rect(xLoc + 3, yLoc + 55, pixs - 13, pixs + 5);//right leg
    fill(95,95,94);
    rect(xLoc + 10, yLoc + 15, pixs - 13, pixs + 5);//right sleeve
    rect(xLoc - 17, yLoc + 15, pixs - 13, pixs + 5);//left sleeve
    fill(255,213,167);
    rect(xLoc - 17, yLoc + 40, pixs - 13, pixs - 15);//left arm
    rect(xLoc + 10,yLoc + 40, pixs - 13, pixs - 15);//right arm
    fill(145,149,149);
    triangle(xLoc - 15, yLoc, xLoc, yLoc - 20, xLoc + 15, yLoc);//hat
  }

  void moveSleepman(int x, int y, int p) {
    xLoc = x;
    yLoc = y;
    pixs = p;
    drawSleepman();
    calcLegcenter();
  }
  void calcLegcenter() {
    xCenter = (xLoc - 10) + ((xLoc + 3 + pixs - 13) - (xLoc - 10))/2;
    yCenter = (yLoc + 55) + ((yLoc + 55 + pixs + 5) - (yLoc + 55))/2;
    //println(xCenter);
  }
}

  void detectCollisions() {
      for (int i = 0; i < enemies.length; i++) {
       int d = (int)((enemies[i].dimensions/2.0) + (mySleepman.dimensions/2.0));
        //println(mySleepman.xCenter);
        //println(mySleepman.yCenter);
         //println(enemies[i].xCenter);
        if ((abs(enemies[i].xCenter - mySleepman.xCenter) < d) && (abs(enemies[i].yCenter - mySleepman.yCenter) < d)) {
          background(0);
          lifeCount -= 1;
          
        }
      }
  }
  
  









     