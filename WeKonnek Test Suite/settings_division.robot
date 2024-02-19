*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Division_Add Division
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Division We Konnek
    Klik Button Klik Create New Division We Konnek
    Input Nama Divisi We Konnek 
    Klik Button Save Name Division We Konnek
    Close Browser
TC_Settings_Division_Cancel Division
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Division We Konnek
    Klik Button Klik Create New Division We Konnek
    Input Nama Divisi We Konnek 
    Klik Button Cancel Name Division We Konnek
    Close Browser


TC_Settings_Division_Delete Division
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Division We Konnek
    Klik Button Delete Division We Konnek
    Klik Button Cancel Delete Confirmation Division We Konnek
    Close Browser
TC_Settings_Division_Edit Division
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Division We Konnek
    Klik Button Edit Division We Konnek
    Input Nama Divisi We Konnek 
    Klik Button Cancel Name Division We Konnek
    Close Browser
TC_Settings_Division_Add User Division
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Klik Button Add New Agent We Konnek
    Input Name Agent We Konnek
    Input Email Address We Konnek
    Input Division Agent We Konnek
    Input Role Agent We Konnek
    Klik Button Save Add New Agent We Konnek
    Close Browser
TC_Settings_Division_Edit User Division
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Input Pencarian Data User We Konnek
    Klik User Agent We Konnek
    Klik Button Edit Profile User Agent We Konnek
    Input Division Agent We Konnek
    Klik Button Save Add New Agent We Konnek
    Close Browser

