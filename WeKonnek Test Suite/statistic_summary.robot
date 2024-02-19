*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Statistic_Summary_General
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Select From Date Summary General WeKonnek
    Klik Button Apply Date Summary General WeKonnek
    Close Browser
TC_Daily_Conversation_Total
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Select From Date Summary General WeKonnek
    Klik Button Apply Date Summary General WeKonnek
    Klik Button Dropdown Daily Conversation General
    Pilih List Total Daily Conversation
    Close Browser
TC_All Channel_Conversation_Total
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Select From Date Summary General WeKonnek
    Klik Button Apply Date Summary General WeKonnek
    Klik Button Dropdown Daily Conversation General   
    Pilih List All Channel Daily Conversation
    Close Browser
TC_Statistic_Summary_Conversation
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Hover Summary Conversation
    Select From Date Summary Conversation WeKonnek
    Klik Button Apply Date Summary Conversation WeKonnek
    # Klik Button Dropdown Daily Conversation Hover Conversation
    # Pilih List Total Daily Conversation Hover Conversation
    Close Browser
TC_Statistic_Summary_Conversation_Daily_Total
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Hover Summary Conversation
    Select From Date Summary Conversation WeKonnek
    Klik Button Apply Date Summary Conversation WeKonnek
    Klik Button Dropdown Daily Conversation Hover Conversation
    Pilih List Total Daily Conversation Hover Conversation
    Close Browser
TC_Statistic_Summary_Hover_Conversation_All_Channel
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Hover Summary Conversation
    Select From Date Summary Conversation WeKonnek
    Klik Button Apply Date Summary Conversation WeKonnek
    Klik Button Dropdown Daily Conversation Hover Conversation
    Pilih List Total Daily Conversation Hover Conversation
    Close Browser
TC_Statistic_Summary_Hover_Conversation_Total_Hourly
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Hover Summary Conversation
    Select From Date Summary Conversation WeKonnek
    Klik Button Apply Date Summary Conversation WeKonnek
    Klik Button Dropdown Daily Conversation Hover Conversation
    Pilih List Total Daily Conversation Hover Conversation
    Klik Button Dropdown Hourly Conversation Hover Conversation
    Pilih List Total Hourly Conversation Hover Conversation
    Close Browser
TC_Statistic_Summary_Hover_Agent
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Hover Summary Agent
    Select From Date Summary Agent WeKonnek
    Klik Button Apply Date Summary Agent WeKonnek
    Close Browser

