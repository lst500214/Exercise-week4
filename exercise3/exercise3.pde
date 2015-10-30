final int GAME_RUN = 0;
final int GAME_OVER = 1;

int gameState;

float x;
float spacing = 40;
float a = 0.0;
float inc = 0.8;
float sinVal;

PImage reStart;

void setup(){
size(400,400);
reStart = loadImage("img/restart.png");
gameState = GAME_RUN;
}

void draw(){

  switch (gameState){
    
    case GAME_RUN:
      background(255);
     
      fill(#FF0000);
      ellipse(mouseX, mouseY, 15, 15);
      
      for (x = 0; x < 320; x += spacing){
        sinVal = sin(a)*40.0;
        fill(#553654);
        rect(x + 40, 0, spacing, 150+sinVal);
        fill(#558651);
        rect(x + 40, 250+sinVal,spacing, height);
        a = a +inc;
      }

      //touching detection
      
        //touch upper lines
        if(mouseX > 40 && mouseX <360){
         if(mouseX <= x+40){
           if(mouseY <= 150+sinVal){
             gameState = GAME_OVER;
           }
          }
         }
        
        //touch down lines
        if(mouseX > 40 && mouseX <360){
         if(mouseX <= x+40){
           if(mouseY >= 250+sinVal){
             gameState = GAME_OVER; 
           }
          }
         }

         break;
    
    case GAME_OVER:
    background(255);
    image(reStart, 0, 0);
    
    //restart button pressed
    if(mouseX < 40 && mouseY <40){
      if(mousePressed){
        gameState = GAME_RUN;
      }
    }
    
    break;

  }//switch
}//draw
