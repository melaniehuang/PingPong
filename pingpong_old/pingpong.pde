PFont font;

void setup() {  
  font = createFont("TitilliumWeb300.ttf", 40,true);
  
  size(1200, 700);  
  
  cp5 = new ControlP5(this);
  background(#6858ff);
  
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
    balls[i][4] = random(2,5);
  }
  
  textFont(font);
}

void draw() {   
  drawCourt(); 
  
  rectMode(CORNER);
  strokeWeight(1);
  blendMode(BLEND);
  fill(#6858ff, 10);
  rect(0, 0, width, height);
 
  drawElement();
  drawLines();
  
  writeTeams();
  writeScores();
}