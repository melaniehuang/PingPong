// ** CUSTOMISE BACKGROUND ** x,y,xd,yd,speed
float[][] balls = new float[2][5];
int circleWidth = 200;
int[] score = new int[2];

void drawElement(){  
  for (int i = 0; i < balls.length; i++) {
    
    float x = balls[i][0];
    float y = balls[i][1];
    
    float xd = balls[i][2];
    float yd = balls[i][3];
    
    float speed = balls[i][4];
    
    balls[i][0] = x + ( speed * xd );
    balls[i][1] = y + ( speed * yd );
    
    if ( xd == -1 && x <= 0 + circleWidth/2){
     balls[i][2] *= -1;
    }
  
    if ( xd == 1 && x > width - circleWidth /2 ){
     balls[i][2] = -1;
    }
    
    if ( yd == -1 && y <= 0 + circleWidth/2){
     balls[i][3] *= -1;
    }
  
    if ( yd == 1 && y > height - circleWidth/2 ){
     balls[i][3] = -1;
    }
    
    stroke(#DEFF00);
    ellipse(x,y,circleWidth,circleWidth);
    point(x,y);
  }
}

void drawLine(float x1, float y1, float x2, float y2){ 
  float d = dist(x1,y1,x2,y2);
  if (d <= circleWidth){    
    stroke(#DEFF00);
    line(x1,y1,x2,y2);
  }
}

void drawLines(){
    for (int i = 0; i < balls.length-1; i++) {    
      float[] ballA = balls[i];
         
      for (int n = i + 1; n < balls.length; n++) {
        float[] ballB = balls[n];
        
        drawLine(ballA[0], ballA[1],
                 ballB[0], ballB[1]);
      }      
    }
}

void drawCourt(){  
  rectMode(CENTER);
  noFill();
  strokeWeight(10);
  stroke(0);
  rect(width/2,height/2,width-100,height-100);
  
  line(width/2, 0, width/2, height);
  line(50, height/2, width-50, height/2);
  
  for (int w = 0; w < width; w+=25) {
    for (int h = 0; h < height; h+=25) { 
      strokeWeight(1);
      stroke(255);
      point(w,h);
    }
  } 
}