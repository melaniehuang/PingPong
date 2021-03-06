# PingPong
Ping Pong scoreboard - Processing and Arduino

Official supplier of scoreboards to [Common Code](https://github.com/commoncode) 

## Requires: 
- Arduino UNO
- 2 x Giant Arcade buttons
- Processing Controlp5.js library

## Features:
- Input for 2 x player name and secondary field
- Flexible number of points per game and number of sets to win
- In-built "Must win by two" function (Thanks [Myslab](https://github.com/mylsb))
- Add/minus points per player using keyboard(Player 1: Hit A & Z, Player 2: Hit S & X)
- Each game writes text inputs and scores to individual text file - data/txt.file
- Trigger new game UI with yellow box on top left
- Serial read from Processing to Arduino
- Sick as background ball grafix

## Photos:
- Scoreboard
![alt tag](https://raw.github.com/melaniehuang/PingPong/master/images/pong2.jpg)
![alt tag](https://raw.github.com/melaniehuang/PingPong/master/images/pong3.jpg)

- Buttons
![alt tag](https://raw.github.com/melaniehuang/PingPong/master/images/pong1.jpg)

- In action
![alt tag](https://raw.github.com/melaniehuang/PingPong/master/images/pong4.jpg)

## Things that tripped me up:
> Shittenhell, I soldered the complete wrong circuit and now I have no working buttons

Keyboard shortcuts to add points available: Hit A for Player 1, hit S for Player 2

> Crap! I gave a point to the wrong player?!

Keyboard shortcuts to deduct points available: Hit Z for Player 1, hit X for Player 2

>What on earth is going on? Why isn't text appearing in my text input fields?

Controlp5.js isn't friends with Processing 3's new pixelDensity(2) in case you tried to add that in...

>People are flooding into the tournament, why doesn't it work on the Mac Mini and external display?

It should now. Just make sure the Serial.list()[] number is correct and fullScreen() has a defined display number. ie. Serial.list()[1]; & fullScreen(1)


------

*Special thanks to Swerv Merv [Bunts](https://github.com/buntine) for helping me clean up some of my code and not go insane whilst debugging.*
