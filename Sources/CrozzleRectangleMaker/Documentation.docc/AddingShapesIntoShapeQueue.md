# AddingShapesIntoShapeQueue

We want to add newly created or newly merged shapes into the shape queue

## Overview

## Requirements
Shape indexes are collections of shapes that all have the same number of words in each shape. 

Merging two shape indexes together returns a list of shapes that can have a varying numbers of words.

To fit the merged shapes back into shape indexes we must split the shapes into groups of same number of words.

## Technical Design
Whenever we add to the `ShapeQueueList` we must split the shapes by word count using the syntax

``` swift
let dictionary = Dictionary(grouping: shapes, by: { $0.placements.count})
```

Next we want to remove the shapes that have a score lower than minScore with

``` swift
let filteredShapes = shapes.filter { $0.score >= queue.scoreMin }
```

Then we add the existing shapes with the new shapes for that word length

and we then create the gpuShapes and the statistics is refreshed.

## Topics

### Components

- ``ShapeQueueList``

- ``ShapeQueueModel``

- ``RemoveDuplicatesCalculator``
