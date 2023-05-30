# ``CrozzleRectangleMaker``

A package of functions that can be used for the crozzle.

## Overview

Contains various groupings of components
* ability to create shapes from a list of words.  Including scoring them and working out how they are placed into a grid
* ability to merge shapes together
* ability to remove duplicates
* a structure that can store queues of already made shapes and adding to these lists through merging shapes together

## References

- <doc:FindLikelyMerges>

- <doc:AsyncMerges>

- <doc:AddingShapesIntoShapeQueue>

- <doc:RemoveDuplicateShapes>

- <doc:ScoreMinBasedOnNumberOfWords>

- <doc:ShapeStatistics>




## Component Breakdowns

### Shape Making Calculators

- ``EdgeCalculator``

- ``ClusterCalculator``

- ``RectangleCalculator``

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


