*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Settings_Division_Add Chat Template
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Chat Template We Konnek
    Klik Button Create New Chat Template We Konnek
    Input Keyword Chat Template We Konnek
    Input Deskripsi Chat Template We Konnek
    Klik Button Save Name Division We Konnek
    Close Browser
TC_Settings_Division_Edit Chat Template
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Chat Template We Konnek
    Klik Button Edit Chat Template We Konnek
    Input Keyword Chat Template We Konnek
    Input Deskripsi Chat Template We Konnek
    Klik Button Cancel Name Division We Konnek
    Close Browser

TC_Settings_Division_Delete Edit Chat Template
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Settings We Konnek
    Klik Menu Chat Template We Konnek
    Klik Button Delete Chat Template We Konnek
    Klik Button Cancel Delete Confirmation Division We Konnek
    Close Browser

TC_Settings_Division_Send Chat Template
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Menu Chats We Konnek
    Klik Sub Menu Open Chats We Konnek
    Klik Room Chat SPV We Konnek
    Input Text Keyword Chat Template We Konnek
    Pilih Keywords Chat Template We Konnek
    Klik Button Kirim Send Chat Template We Konnek
    Close Browser


