# StategyCalculatorFindings

The `StrategyCalculator` contains code that can generate each winning game and its called by `StartegyCalculatorTests`.  When we change algorithm we can run these tests to see if modifying the algorithm breaks any winning game generation.  So its a good layer of automated testing to catch errors introduced in the future.

## How it was done
CrozzleExperiment has a user interface that allowed me to select shapes that are part of each winning game and save to JSON.

Then I wrote a program within `JsonIOCalculator` which generates the code that would create these games and the test for each game.

To invoke the generating code I write the game number and max score, width and height into `JsonIOCalculatorTests` and run the test to make the code

I copy the running code into `StrategyCalculator` and the tests into `StrategyCalculatorTests`.

Then I run the tests and see if the game is generated.  I need to change the index of which shape to generate from the groups of words.
So for example we start with OBErON:rEGENT but the next option is OBEROn:REGEnT which is what we want.

``` swift
let regent_oberon = edges.containing(["REGENT", "OBERON"], from: words)[0]
```
will form
`
score:28, width:8, height:8, words:2, area:36, density:0.7777778

 .      
 O      
 B      
 E      
.REGENT.
 O      
 N      
 .      
`
but
``` swift
let regent_oberon = edges.containing(["REGENT", "OBERON"], from: words)[1]
```
Is what we want 
`
score:28, width:8, height:8, words:2, area:36, density:0.7777778

     .  
     O  
     B  
     E  
     R  
     O  
.REGENT.
     .  
`

or we have this

`
score:80, width:10, height:10, words:4, area:64, density:1.25

   .      
   V      
   I      
   C .    
  .THRONE.
   O A    
.CORONET. 
   I I    
   A .    
   .    
`
but we need this

`
 .      
 V .    
 I C    
 C O    
 T R    
 O O    
.RANI.  
 I E    
.ARTHUR.
 . .    
`



`
    .    
    C    
    O    
 .THRONE.
 M  O    
.IVAN.   
 D  E    
 A  T    
 S  .    
 .       
`

but we want 
`
score:60, width:10, height:10, words:4, area:64, density:0.9375

     .    
   .MIDAS.
   C V    
   O A    
.THRONE.  
   O .    
   N      
   E      
   T      
   .      

`
Sometimes we are missing an attachment.  So SHELLS,FINS,REEFS,LINE first needs CAsTLE:sHELLS otherwise it cannot be merged 

`
score:124, width:10, height:12, words:4, area:80, density:1.55

      .   
      P   
      R   
      O   
      T . 
      O C 
.HYDROZOA.
      O S 
   .COAST.
      . L 
        E 
        . 
Merging with

score:56, width:8, height:7, words:4, area:30, density:1.8666667

   .    
   R .  
.SHELLS.
   E I  
  .FINS.
   S E  
   . .  
`


Sometimes the shape is already in the grid and so it wont merge and thats when I remove the instruction from `StrategyCalculator` such as the `mckinley_rocky` instruction and also remove it from the json file.

In this process if the shapes just cannot be made yet then it will fail but we mark it as impossible, but mostly we check the winning game and can see that the shape generation required is not yet made and just make an empty test routine with "CannotDo" written in the title.

Sometimes find that a perfectly valid shapes cannot work and that is because of weaknesses in algorithm

Did you know that you can rotate the participants in the . block

`
score:72, width:9, height:9, words:4, area:49, density:1.4693878

    .    
  .SWEET.
  B I    
.DRINK.  
  A E    
  N .    
  D      
  Y      
  .      
`
becomes
`
score:72, width:9, height:8, words:4, area:42, density:1.7142857

    .    
  .SWEET.
  D I    
.BRANDY. 
  I E    
  N .    
  K      
  .      
`

## Overview

Rules discovered:

1. Shape deadlock - You need the proceeding shape before you can add the following shape and visa versa otherwise you have an overlap when you go down the optimal path.

So in 8906 we have a circular problem that means we cannot proceed down the optimal high scoring path.
* YEAr:ArC must come before CRATEr:ArIES 
* CRATEr:ArIES must come before YEAr:ArC.

But if you created lots of paths and joined them together then you would not have this problem by having YEAr:ArC put in first.

2. When you specify the shape and the words in that shape then you will find many shapes that can meet that requirement

In fact some combinations of that shape with those words produce the same score or different score.  Seems like a good idea to reject those shapes with exactly the same words but lower scores.  Or perhaps the same thing across shape types.  So you can eliminate shapes because the word is best served in a different configuration or shape.

3. overlaps still exist

Here we have 8908 which has WHITE which should not be allowed to be placed there.

What should happen is that WET should go before it and this WHITE here should be an error.

`
   . .    .  .  
   D P    R  C  
 . A A .  E .O  
.GLOVES.L..SNOW. 
 E  O.SKIS.O L.F 
.ALPS...FLURRY.R 
 R  .WHITE.T M E 
 .QUIET..D . P E 
     T   .MORITZ.
     .       C E 
             S . 
             .   
`
So the winning game looks like this:

   . .    .  .  
   D P    R  C  
 . A A .  E .O  
.GLOVES.L..SNOW. 
 E  O.SKIS.O L.F 
.ALPS...FLURRY.R 
 R. .WHITE.T M E 
 .L  E  .D . P E 
.QUIET.  .MORITZ.
  G  .       C E 
  E          S . 
  .          .   

just had to change from

``` swift
let quiet_wet = edges.containing(["QUIET", "WET"], from: words)[0]
```

to 

``` swift
let quiet_wet = edges.containing(["QUIET", "WET"], from: words)[1]
```

Look at ems, again bad from 9408 error but it allowed it. "PLATES,EMS" was wrong

`
 . .  . . . 
 . .PAPERS.F I 
.PICA.A .CROWN.
 R  G.PAIR.R K 
 O.DEMY. I.M . 
 O ...R .PRESS.
 F T.QUARTO. E 
.STYLUS.E.L  W 
 . P I.BALLOON.
 .MOULD.M.E  . 
 C G L F.PRINT.
 O R .ROLLS. E 
 S A   N A.BOX.
.TYPES.TITLE.T 
 E H   ..EMS.. 
.ROYAL.  S     
 . .     .     
`

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
