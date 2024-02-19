*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Division_Add Category 
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Category We Konnek
    Klik Button Create New Category We Konnek
    Input Category Name We Konnek
    Input Description Text Category We Konnek
    Klik Button Save Category We Konnek
    Close Browser
TC_Settings_Division_Edit Category
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Category We Konnek
    Klik Button Edit Chat Template We Konnek
    Input Category Name We Konnek
    Input Description Text Category We Konnek
    Klik Button Cancel Name Division We Konnek
    Close Browser