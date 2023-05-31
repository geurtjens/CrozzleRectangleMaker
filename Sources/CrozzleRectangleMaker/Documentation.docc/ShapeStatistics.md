# ShapeStatistics

Ability to read a set of shapes and gather score based statistics on them to know the histogram of scores

## Overview

Given an array of scores, sorted in decreasing order

Create a statistics model that has the score, number of shapes with that score, where it appears in all shapes and various percentages that we can use for filtering

We want to know:

How many shapes are there that has a score that is equal or greater than the score we provide.
What is the score for the top x% of shapes.
How many shapes are there in the top x% of shapes.
We can then use this to:

Filter how many shapes are going to be used when we merge so that the calculations are not too costly in memory and time.

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
