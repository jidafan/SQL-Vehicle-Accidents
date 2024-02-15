# Vehicle Accidents Exploratory Data Analysis using SQL

## Table of Contents
* [Introduction](#introduction)
* [Data Review](#data-review)
* [SQL Exploration](#sql-exploration)
* [Conclusion](#conclusion)

## Introduction

Every year there are a vast amount of car crashes that happen on the roadways. In this project, we seek to identify basic trends and see if there is a correlation between certain conditions, the frequency of accidents, and their severity.  The dataset that was used for this project was sourced from [Kaggle](https://www.kaggle.com/datasets/daveianhickey/2000-16-traffic-flow-england-scotland-wales?select=accidents_2012_to_2014.csv), in this project we solely use the accidents csv file from 2012 - 2014. 

## Data Review

The data comes from police reports of traffic accidents in the UK. The data contains information on the date of the crash, the road, weather conditions, and other essential information related to the crash.

| Variable      | Description           | 
| ------------- |:---------------------| 
| `Accident_Index`     | The unique id that refers to a specific traffic accident |
| `Location_Easting_OGSR`     | UK local coordinate grid reference for the East     |   
| `Location_Northing_OGSR` | UK local coordinate grid reference for the North                                    |
| `Longitude`  | The longitude of the location of the accident                             |
| `Latitude`  | The latitude of the location of the accident                        |
| `Police_force`  | The police force nearby the incident                        |
| `Accident_severity`  | The severity of the accident with fatal = 1, serious = 2, and slight = 3                               |
| `Number_of_Vehicles`  | The number of vehicles involved in the accident                           |
| `Number_of_casualties`  | The number of casualties that occurred from the accident                                |
| `Date`  | The date the accident occurred                                   |
| `Day_of_Week` | The day of the week in which the accident took place                                |
| `Time`  | The time of the accident                   |
| `Local_Authority_(District)`  | The local authority of the district          |
| `Local_Authority_(Highway)`  | The local authority of the highway                      |
| `1st_Road_Class`  |  The region of the major road, with each number corresponding to a different region in the UK                        |
| `1st_Road_Number`  | The number of the major road section               |
| `Speed Limit`  | The speed limit of the area                          |
| `Junction_Control`     | The control system at the traffic junction |
| `2nd_Road_Class`     |  The region of the city road |   
| `2nd_Road_Num` | The number of the road section                                     |
| `Pedestrian_Crossing-Human_Control`  | If a crossing with no signal or lights is present                          |
| `Pedestrian_Crossing-Physical_Facilities`  | If a crosswalk with signals and lights is present                    |
| `Light_Conditions`  | The lighting during the accident                      |
| `Weather_Conditions`  | The weather conditions during the incident                            |
| `Road_Surface_Conditions`  | The conditions of the road when the accident occurred                           |
| `Special_Conditions`  | If the road was under special conditions during the accident (i.e Roadwork)                         |
| `Carriageway_Hazards`  | Presence of hazards on the road (i.e Faulty Lights)                                  |
| `Urban_or_Rural_Area` | If the accident took place in the Urban or Rural Area                     |
| `Did_Police_Officer_Attend_Scene_of_Accident`  | Did a police officer attend the scene               |
| `LSOA_of_Accident_Location`  | Lower Layer Super Output Areas (LOSA) of accident location, a postal code for England and Wales        |
| `Year`  | The year the accident took place                   |

