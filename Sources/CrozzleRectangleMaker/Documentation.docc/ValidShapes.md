# OverlappingPlacementsCalculator

Used when merging two shapes together.

## Overview

We have this situation which indicates that OverlappingPlacementCalculator is not working.

```
score:604, winningScore:694, gameId:8612, width:17, height:12, words:20, area:150, density:4.0266666

let gameWithOverlaps = [
"      . .        ",
"   .INN.J .      ",
"    . A E T    . ",
"   .HAZELNUT.. T ",
" .JOY.A L R.STAR.",
" A .MERRY.K  O E ",
".ZION.E .HE.CAKE.",
" U  . T.TOYS.S . ",
" R    H  L.NUTS. ",
" E    .  L O .   ",
" . .FAMILY.WHITE.",
"         . .     "]
```

Lets break it down into a simple merge

```
score:604, winningScore:694, gameId:8612, width:17, height:12, words:20, area:150, density:4.0266666

             
          .  
          T    
   .HAZELNUT.  
          R  
         .K  
        .HE  
       .TOYS. 
         L.  
         L   
         Y   
         .     
```

When I put these into the overlapping calculator then it shows that they are overlapping

So how could we get such a shape
``` swift

let toys_turkey = [
   "   .  ",
   "   T  ",
   "   U  ",
   "   R  ",
   "   K  ",
   "   E  ",
   ".TOYS.",
   "   .  "]

// If we merge this shape then it will detect the overlap.  Overlap relies on the fact that our shapes are already put into same coordinate system
let toys_holly = [
    "      ",
    "      ",
    "      ",
    "      ",
    "  .   ",
    "  H   ",
    ".TOYS.",
    "  L   ",
    "  L   ",
    "  Y   ",
    "  .   "]


// But if you give this shape then its not in the same coordinate system and so it will not detect the overlap

let toys_holly2 = [
       "  .   ",
       "  H   ",
       ".TOYS.",
       "  L   ",
       "  L   ",
       "  Y   ",
       "  .   "
]
```

The `MergePlacementCalculator.GetPlacementsForBothShapes` wrongly takes out the common shape so we cannot align both lists of placements.
It takes it out because it doesnt want to place the same placement twice when merging but this is done too early


## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
