*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Agents We Konnek
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Agents We Konnek 
    Input Pencarian Agents We Konnek
    Klik Button Filter Status Agents We Konnek
    Pilih Status Available Agents We Konnek
    Klik Button Apply Status Agents We Konnek
    Close Browser
TC_Settings_Agents We Konnek_Perfomance
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Agents We Konnek 
    Klik Menu Hove Performance Agent We Konnek
    Klik 7 Days Performance Agent We Konnek
    Select Date From Performmance Agent We Konnek
    Select Date To Performance Agent We Konnek
    Klik Button Apply Performance Agent We Konnek
    Klik 30 Days Performance Agent We Konnek
    Close Browser
TC_Settings_Agents We Konnek_History
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Agents We Konnek
    Klik Hover History Agents We Konnek
    Select Date Period From Request Agents We Konnek
    Select To Date Period From Request Agents We Konnek
    Klik Button Submit History Request Agents We Konnek
    Input Pencarian Nama History Agents We Konnek
    Klik Button Dropdown Agent Name History Agents We Konnek
    Klik Button Dropdown Reason History Agents We Konnek
    Klik Button Submit History Request Agents We Konnek
    Klik Button Dropdown Type History Agents We Konnek
    Klik Button Submit History Request Agents We Konnek
    Klik Button Download History Agents We Konnek  
    Klik Tab Availability Agents We Konnek 
    Select Date Period From Availability Agents We Konnek 
    Select To Date Period Availability Agents We Konnek
    Klik Button Dropdown Agent Name Availability We Konnek
    Input Minimum Availability Duration We Konnek
    Input Maximum Availability Duration We Konnek
    Input Minimum Unavailibility Duration We Konnek
    Input Maximum Unavailibility Duration We Konnek
    Klik Button Submit Availability Agents We Konnek 
    Input Pencarian Availability Agent We Konnek 
    Close Browser




