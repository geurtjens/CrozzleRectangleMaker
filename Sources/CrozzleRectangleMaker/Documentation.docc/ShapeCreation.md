# ShapeCreation

How we create the initial shapes before merge takes over 

## Overview

Shape creation is performed by a group of classes and they specialise in producing an exact shape.

We use these because an individual shape must obey rules of no words running along side other words unless they have interlocks in both directions.

Therefore we make these kind of shapes purposefully so we can obey the rules when we plug shapes together like jigsaw puzzle pieces in the merge process.


## Filters

### scoreMin

Limits the minimum score that a shape can be in order to be seen as valid.

This is an important limit when controlling how many shapes are generated.  

The score is also found within the `Statistics` which is helpful when deciding what the scoreMin should be from game to game, as these ratios are different from game to game.

### widthMax, heightMax

Limits the shape width and height.

Games are either 10x15 or 13x15.  The larger size of 13x15 started in game 9401 and before that it was 10x15.

But we measure sizes which includes block characters at the end of words.

This means that the maximum size is either `12x17` or `15x17`

So our shapes cannot grow larger than the maximum size of the grid.

`12x17` is the same as `17x12`.  `15x17` is the same as `17x15`.

Shapes that are outside of this range are invalid.

But we can use these two parameters of `widthMax` and `heightMax` to only find shapes that are smaller than that if we wish.

### wordsMax

Whatever function creates shapes, they currently use all the words.  Let's make a limit to the number of words being processed so that we can either only include the winning words or just reduce it to make processing and testing faster.

Lets add a new parameter to each function

``` swift
, wordsMax: Int = 0)
```

And then in the main body of code we can say that if wordsMax = 0 then wordCount will be total number of words otherwise we limit it to the number of words that is in words

``` swift
let wordCount = (wordsMax == 0) ? words.count : wordsMax
```

The default value of 0 means we don't have to change all our tests or remember how many words to pass.

But if we know the number of winning words then we can only process shapes using the winning words.

The wordData struct has the ability to determine the words for each game and we have sorted them first by words in winning game followed by words that are not in the winning game.  And we keep a record of how many winning words there are:

``` swift
public static let winningWordsCount_8612 = 25
```

So we can only process winning words as we know how many winning words there are

## Topics

### Shape Calculating Classes

- ``ClusterCalculator``

- ``EdgeCalculatorV1``

- ``RectangleCalculatorV1``
