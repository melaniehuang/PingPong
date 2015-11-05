PFont font;

void setup() {  
  font = createFont("slkscr.ttf", 60,true);
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
  
  //size(displayWidth, displayHeight);
  fullScreen();
  frameRate(60);
  
  cp5 = new ControlP5(this);
  background(#00D2FF);
  
  createMessageBox();
  createButtonOK();
  
  Date d = new Date();
  output = createWriter("data/" + d.getTime() + ".txt");  
        
  score[0] = 0;  
  score[1] = 0;
  gamesWon[0] = 0;
  gamesWon[1] = 0;

  for (int i = 0; i < balls.length; i++) {
    balls[i][0] = random(width);
    balls[i][1] = random(height);
    balls[i][2] = 1;
    balls[i][3] = 1;
    balls[i][4] = random(20,30);
  }
  
  textFont(font);
}

void draw() {   
  drawCourt(); 
  
  rectMode(CORNER);
  strokeWeight(1);
  blendMode(BLEND);
  fill(#00D2FF, 10);
  rect(0, 0, width, height);
 
  drawElement();
  drawLines();
  
  writeTeams();
  writeScores();
}