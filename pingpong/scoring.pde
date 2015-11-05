import processing.serial.*;
Serial myPort;

//set up a game
int pointsWon = 11;
// First to 4 (Plus one!)
int bestOf = 0;

int[] gamesWon = new int[2];

boolean winByTwo(int playerOne, int playerTwo) {
  int delta = abs(playerOne - playerTwo);
  return (delta > 1);
}

int findWinner(int[] players) {
  if (players[0] > players[1]) {
    return 0;
  }
  return 1;
}

void writeScores(){
  
  int gameCircle = 20;
  int gap = 10;
  
  fill(0);
  textSize(140);
  textAlign(CENTER,CENTER);
  
  //points
  text(score[0], (width/2+50)/2, height/2 +((height-100)/4)-20); 
  text(score[1], width/2 + ((width/2-50)/2), height/2 +((height-100)/4)-20); 

  //games
  int x1 = width/2 - (gap*(bestOf+1) + gameCircle*(bestOf+1));
  int x2 = width - (gap*(bestOf+1) + gameCircle*(bestOf+1) + 50);

  int y = height - 50 - (gameCircle + gap);
  
  for (int i = 0 ; i < bestOf+1; i++){
   noFill();
   strokeWeight(1);
   ellipse(x1+(gameCircle*i)+(gap*i),y,gameCircle,gameCircle);
   ellipse(x2+(gameCircle*i)+(gap*i),y,gameCircle,gameCircle);
  }
  
  if (score[0] >= pointsWon || score[1] >= pointsWon) {
    if (winByTwo(score[0], score[1])) {
      int winner = findWinner(score);
      output.println(score[0] + ", "+ score[1]);  
      if (gamesWon[winner] < bestOf) {
        gamesWon[winner]++;
        score = new int[2];
      } else if (gamesWon[winner] == bestOf) {
        gamesWon[winner]++;
        endGame();
      }
    }
  }

  for (int j = 0; j < gamesWon[0]; j++) {
      fill(255);
      ellipse(x1 + (gameCircle * j) + (gap * j), y, gameCircle - 8, gameCircle - 8);
  }
  
  for (int j = 0; j < gamesWon[1]; j++) {
      fill(255);
      ellipse(x2 + (gameCircle * j) + (gap * j), y, gameCircle - 8, gameCircle - 8);
  }
  
  buttonPressed();
}

void keyPressed() { 
  //points
  if(messageBox.isVisible()){
    score[0] = 0;
    score[1] = 0;
  } else {
    if (key == 'A' || key == 'a') {
      score[0]++;
    }
    if (key == 'Z' || key == 'z') {
      score[0]--;
    }
    
    if (key == 'S' || key == 's') {
      score[1]++;
    }
    if (key == 'X' || key == 'x') {
      score[1]--;
    } 
  }
}

void buttonPressed(){
  int val = 0;
  
  if(messageBox.isVisible()){
    score[0] = 0;
    score[1] = 0;
  } else if (myPort.available() > 0) {
    val = myPort.read();
  }
    
  if (val == 1) {
   score[0]++;
  } else if (val == 2) {
   score[1]++;
  } else {
   val = 0;
  }
  
  println(val);
}