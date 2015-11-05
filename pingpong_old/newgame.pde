import controlP5.*;
import java.util.Date;

ControlP5 cp5;
ControlGroup messageBox;

PrintWriter output;

int messageBoxResult = -1;
String teamOne = "";
String teamTwo = "";

int messageBoxWidth = 500;
int messageBoxHeight = 380;

void toggleBox(int theValue) {
  if(messageBox.isVisible()) {
    messageBox.hide();
  } else {
    endGame();
    messageBox.show(); 
  }
}

void createMessageBox() {   
  ControlFont heading = new ControlFont(font,28);
  ControlFont fieldInput = new ControlFont(font,22);

  messageBox = cp5.addGroup("messageBox")
                  .setPosition(width/2-250, height/2-180)
                  .setSize(500,310)                  
                  .setBackgroundColor(color(255))
                  .bringToFront() 
                  .hideBar();
  
  Textlabel l = cp5.addTextlabel("messageBoxLabel","Enter new team names",110,40)
                   .setColorValue(#707070)
                   .setFont(heading)
                   .moveTo(messageBox);
  
  Textfield f1 = cp5.addTextfield("teamOne")
                         .setPosition(50,110)
                         .setSize(400,50)
                         .setFocus(true)
 
                         .setFont(fieldInput)
                         .setColor(255)
                         .setColorForeground(color(255))
                         .setColorBackground(color(#F03A0C))
                         .setColorActive(color(#FF5429))
                         
                         .setAutoClear(false);
                                             
  f1.moveTo(messageBox);
  
  Textfield f2 = cp5.addTextfield("teamTwo")
                    .setFont(fieldInput)
                    .setPosition(50,170)
                    .setSize(400,50)
                    .setColorForeground(color(255))
                    .setColorBackground(color(#296EFF))
                    .setColorActive(color(#00B0FF))
                  
                    .setAutoClear(false);               
   
   f2.moveTo(messageBox);                      
                                                    
  // OK button
  Button b1 = cp5.addButton("buttonOK")
                 .setSize(80,40)
                 .setPosition(210,240)
                 .setColorBackground(color(#707070))
                 .setBroadcast(false)                
                 .setValue(1)
                 .setBroadcast(true);                
  
  b1.setCaptionLabel("START")
    .getCaptionLabel()
    .setFont(fieldInput)
    .setSize(20);
    
  b1.moveTo(messageBox);
}


void createButtonOK(){
  Button b = cp5.addButton("toggleBox")
                .setLabel("+")
                .setSize(20,20)
                .setPosition(10,10)
                .setDefaultValue(1)
                .setColorBackground(color(#fde803));
  b.getCaptionLabel()
   .setColor(color(0));
}

void buttonOK(int theValue) {
  println("New game, play ball.");
  
  teamOne = ((Textfield)cp5.getController("teamOne")).getText();
  println("Team Red : " + teamOne);
  
  teamTwo = ((Textfield)cp5.getController("teamTwo")).getText();
  println("Team Blue : " + teamTwo);
  
  output.println(teamOne + "," + teamTwo);
  
  messageBoxResult = theValue;
  messageBox.hide();
}

void writeTeams(){
 fill(255);
 textSize(32);
 textAlign(CENTER);
 text(teamOne, (width/2+50)/2, 50+((height-100)/4)); 
 text(teamTwo, width/2 + ((width/2-50)/2), 50+((height-100)/4)); 
}

void endGame(){
  output.flush();  
  output.close();
  
  gamesWon[0] = 0;
  gamesWon[1] = 0;
  
  score[0] = 0;
  score[1] = 0;
  
  cp5.get(Textfield.class,"teamOne").clear();
  cp5.get(Textfield.class,"teamTwo").clear();
  messageBox.show();
  
  Date d = new Date();
  output = createWriter("data/" + d.getTime() + ".txt");   
}