# RemoveDuplicateShapes

How do we remove shapes that are duplicated.  A duplicate can be exactly the same text or a flipped shape.  So how do we make duplicate removal faster.

## Requirements

We want to remove all duplicates in a collection of shapes that all have the same number of words

A duplicate shape will have:
* same score
* same area (width x height)
* same sequence of words (if words are sorted, which they should be)

Two shapes are duplicates and in the same direction if:
* isHorizontal sequence will equal isHorizontal sequence of duplicate shape
* x sequence of shape equals x sequence of duplicate shape
* y sequence of shape equals y sequence of duplicate shape
* width equals width of duplicate shape
* height equals height of duplicate shape

Two shapes are duplicate and in the flipped direction if:
* isHorizontal sequence is opposite to isHorizontal sequence of duplicate shape
* x sequence equals y sequence of duplicate shape
* y sequence equals x sequence of duplicate shape
* width equals height of duplicate shape
* height equals width of duplicate shape

## Same Sequence of Words
The convention is that all word placements are in word id order.  

Therefore if we make a csv of all the words in the shape then it can be used for identifying matching sequences using a string compare operation.  

I have tried having this as a lazy loaded field but the sort function requires that what we are sorting is not lazy loaded.  So I just generate it when the shape is created.

## Algorithm

### Marking Duplicates 

Our shape lists are grouped so that each list has the same number of words in the shapes in that list.

Sort the list by score, then area (width x height) and then wordSequence.

Go through the entire shape list using two indexes, previous and current.

We compare previous and current and see if they have the same score, wordSequence and area (width x height).

If they have those three the same then go through the x, y and isHorizontal to see if they match using loops as this is less likely to happen.

If matching then we mark the current shape as isValid = false and increase current by 1

Otherwise if not matching then move previous equal to current and increase current by 1

### Removing Duplicates

Perform a filter of all shapes where isValid == true using the following code

``` swift
let duplicatesRemoved = shapes.filter { $0.isValid }
```

### When Remove Duplicates is used

Normally our shape making algorithms do not have duplicates but when we add two lists of shapes together then there may be duplicates.

So whenever we try to add to the `ShapeQueueList` then remove duplicates.

## Topics

### Supporting Code

- ``RemoveDuplicatesCalculator``
