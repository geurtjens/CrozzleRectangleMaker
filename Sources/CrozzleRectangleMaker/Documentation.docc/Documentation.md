# ``CrozzleRectangleMaker``

A package of functions that can be used for the crozzle.

## Overview

Contains various groupings of components
* __create shapes from a list of words__ - Shapes are jigsaw puzzle pieces.  Including scoring, measuring width and height and working out how each word is placed with others to form the shape. 
* __merge shapes together__ - Putting jigsaw puzzle pieces together to make the larger shapes.
* __remove duplicates__ - Each shape is unique.  Even if a shape is rotated it will still be unique.  This avoids wasteful duplication of processing.
* __structures holding results__ - a structure that can store queues of already made shapes and adding to these lists through merging shapes together
* __driving algorithm__ - The program that determines what to merge with what and best hyperparameters to use such as scores.

## References

- <doc:ShapeCreation>

- <doc:FindLikelyMerges>

- <doc:AsyncMerges>

- <doc:AddingShapesIntoShapeQueue>

- <doc:RemoveDuplicateShapes>

- <doc:ScoreMinBasedOnNumberOfWords>

- <doc:ShapeStatistics>




## Component Breakdowns

### Shape Making Calculators

- ``EdgeCalculatorV1``

- ``ClusterCalculator``

- ``RectangleCalculatorV1``

### Merging Functionality

- ``ExecuteMergeCalculator``

- ``MergeCalculator``

- ``MergePlacementCalculator``

### Shape Utilities

- ``ShapeCalculator``

- ``PlacementCalculator``

- ``ScoreCalculator``

- ``WordCalculator``

### Structures that maintain state

- ``ShapeQueueListCalculator``

- ``StatisticsCalculator``

- ``RemoveDuplicatesCalculator``

### Models

- ``ClusterModel``

- ``EdgeModel``

- ``RectangleModel``

- ``MatchingShapesModel``

- ``MergeInstructionModel``

- ``PlacementModel``

- ``ShapeModel``

- ``ShapeQueueList``

- ``ShapeQueueModel``

- ``StatisticsModel``

- ``GpuShapeModel``


