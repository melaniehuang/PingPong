import controlP5.*;
import java.util.Date;

ControlP5 cp5;
ControlGroup messageBox;

PrintWriter output;

int messageBoxResult = -1;
String teamOne = "";
String teamTwo = "";

String teamOneCompany = "";
String teamTwoCompany = "";

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
  ControlFont fieldInput = new ControlFont(font,22);
  ControlFont cta = new ControlFont(font,22);

  messageBox = cp5.addGroup("messageBox")
                  .setPosition(width/2-375, height/2-170)
                  .setSize(750,330)                  
                  .setBackgroundColor(color(0))
                  .bringToFront() 
                  .hideBar();
  
  Textlabel teamTitle = cp5.addTextlabel("messageBoxLabel1","Contestant 1",110,50)
                           .setColorValue(255)
                           .setFont(cta)
                           .moveTo(messageBox);
                   
  Textlabel teamTitle2 = cp5.addTextlabel("messageBoxLabel2","Contestant 2",450,50)
                            .setColorValue(255)
                            .setFont(cta)
                            .moveTo(messageBox);
  
  Textfield f1 = cp5.addTextfield("teamOne")
                         .setPosition(60,110)
                         .setSize(300,50)
                         .setFocus(true)
                         .setColorLabel(0) 
 
                         .setFont(fieldInput)
                         .setColor(0)
                         .setColorForeground(color(0))
                         .setColorBackground(color(255))
                         .setColorActive(color(255))
                         
                         .setAutoClear(false);
                                             
  f1.moveTo(messageBox);
  
  Textfield f3 = cp5.addTextfield("teamOneCompany")
                         .setPosition(60,170)
                         .setSize(300,50)
                         .setColorLabel(0) 
 
                         .setFont(fieldInput)
                         .setColor(0)
                         .setColorForeground(color(0))
                         .setColorBackground(color(255))
                         .setColorActive(color(255))
                         
                         .setAutoClear(false);
                                             
  f3.moveTo(messageBox);
  
  Textfield f2 = cp5.addTextfield("teamTwo")
                    .setFont(fieldInput)
                    
                    .setColor(0)
                    .setPosition(390,110)
                    .setSize(300,50)
                    .setColorLabel(0) 
                    .setColorForeground(color(0))
                    .setColorBackground(color(255))
                    .setColorActive(color(255))
                  
                    .setAutoClear(false);
   
   f2.moveTo(messageBox); 
   
   Textfield f4 = cp5.addTextfield("teamTwoCompany")
                    .setFont(fieldInput)
                    
                    .setColor(0)
                    .setPosition(390,170)
                    .setSize(300,50)
                    .setColorLabel(0) 
                    .setColorForeground(color(0))
                    .setColorBackground(color(255))
                    .setColorActive(color(255))
                  
                    .setAutoClear(false);
   
   f4.moveTo(messageBox); 
   
                                                    
  // OK button
  Button b1 = cp5.addButton("buttonOK")
                 .setSize(100,40)
                 .setPosition(325,250)
                 .setColorBackground(color(#FF00A8))
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
                .setColorBackground(color(#DEFF00));
  b.getCaptionLabel()
   .setColor(color(0));
}

void buttonOK(int theValue) {
  println("New game, play ball.");
  
  teamOne = ((Textfield)cp5.getController("teamOne")).getText();
  println("Team Red : " + teamOne);
  
  teamOneCompany = ((Textfield)cp5.getController("teamOneCompany")).getText();
  println("Team Red Company : " + teamOneCompany);
  
  teamTwo = ((Textfield)cp5.getController("teamTwo")).getText();
  println("Team Blue : " + teamTwo);
  
  teamTwoCompany = ((Textfield)cp5.getController("teamTwoCompany")).getText();
  println("Team Blue Company: " + teamTwoCompany);
  
  output.println(teamOne + "," + teamTwo);
  output.println(teamOneCompany + "," + teamTwoCompany);
  
  messageBoxResult = theValue;
  messageBox.hide();
}

void writeTeams(){
 fill(0);
 textSize(60);
 textAlign(CENTER);
 text(teamOne, (width/2+50)/2, 50+((height-100)/4)); 
 text(teamTwo, width/2 + ((width/2-50)/2), 50+((height-100)/4)); 
 
 textSize(40);
 text(teamOneCompany, (width/2+50)/2, 120+((height-100)/4)); 
 text(teamTwoCompany, width/2 + ((width/2-50)/2), 120+((height-100)/4)); 
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
  cp5.get(Textfield.class,"teamOneCompany").clear();
  cp5.get(Textfield.class,"teamTwoCompany").clear();
  messageBox.show();
  
  Date d = new Date();
  output = createWriter("data/" + d.getTime() + ".txt");   
}