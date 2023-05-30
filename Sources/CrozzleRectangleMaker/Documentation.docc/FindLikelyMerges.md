# FindLikelyMerges

something

## Overview

I would like to merge shapes together.  

This involves two steps:
* Choosing what shapes might be able to merge
* Confirming that they merge and don't produce errors.

I want this broken down in two steps because the choosing what shapes might merge can be really fast.

Lets do the first step in this issue.

* We should only attempt to merge if both shapes contain one or more of the same words.
* We should not merge if the common words are the same number of words as our shape because that is a subset.
* We might introduce filtering so that we only merge good scoring shapes so min and max positions are required.

When there are more than one matching words:
* the direction (isHorizontal) are either all matching or all not matching.  This tells us that if it's the same words then they are going in the same direction or they are all going in opposite direction meaning flipped.
* The distances with the first word are the same for all the other words that are common.

I want to make this as quick as possible so we need to introduce a word index.  This is a cache that tells which shapes contain a particular word, for all words.  Therefore we can easily check what words are in the starting shape and use the index to list the possible shapes and how many words each shape has in common.  So we can filter to include only those that do not have the same number and so which are a subset.

I want to make what we are searching with a structure of arrays which will be faster for cpu or gpu to process https://en.wikipedia.org/wiki/AoS_and_SoA#:~:text=Structure%20of%20arrays%20(SoA)%20is,one%20parallel%20array%20per%20field.

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
