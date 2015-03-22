---
title       : Shining on International Airline travellers 
subtitle    : 
author      : Kay Dee
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : prettify      # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]   # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Description

1. Simple time series exploration
2. Using __dygraphs__ package
3. An example of time series decomposition using __loess__
4. Forecasting of time series

The shiny app is running [here](https://abysmon.shinyapps.io/AirPassenger/)

--- .class #id 

## What is it about

`AirPassengers` is contains monthly international airline passengers, in thousands, from 1949 to 1960. 

Summary

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  104.0   180.0   265.5   280.3   360.5   622.0 
```


--- .class #id 

## What do we do

1. We split the dataset into seasonal component and the trend line
2. Then we forecast it from 6 months ahead to 60 months ahead, prediction interval is user controlled input






