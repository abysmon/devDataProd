---
title       : Shining on International Airline travellers 
subtitle    : 
author      : Kay Dee
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : prettify      # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []   # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Description

We explore simple time series decomposition and forecasting. The chief features of the app

  * We use `dygraphs` package for interactive charting 
  * An example of time series decomposition using `loess`
  * Forecasting of time series using `Holt-Winters Filtering`

The app is running [shiny server](https://abysmon.shinyapps.io/AirPassenger/).
Sourcecode is on [github](https://github.com/abysmon/devDataProd/).

--- .class #id 

## What is it about

`AirPassengers` is contains monthly international airline passengers, in thousands, from 1949 to 1960. 

Summary

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  104.0   180.0   265.5   280.3   360.5   622.0 
```

![plot of chunk f](assets/fig/f-1.png) 


--- .class #id 

## What do we do

We split the dataset into seasonal component and the trend line

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

--- .class #id 

## What do we do (contd..)
Then we forecast it from upto 60 months ahead with two user controlled input
  *  Forecast ahead months
  *  Prediction bounds

**The predicted data and measured data are shown below**
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png) 



