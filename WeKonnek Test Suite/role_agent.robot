*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Library    RequestsLibrary
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Super Role Agent_Filtering
    Open browser Staging 
    Input Company ID, Email dan password Role Agent
    Klik Button Login Role Agent
    Input Pencarian Data Search Message Role Agent We Konnek
    Klik Button Search Message We Role Agent We Konnek
    Klik Filtering Channel Role Agent We Konnek
    Klik Checkmark Status Channel Role Agent We Konnek
    Klik Button Apply Filtering Channel Role Agent We Konnek
    Close Browser

TC_Super Role Agent_Switching Togle ON/OFF 
    Open browser Staging 
    Input Company ID, Email dan password Role Agent
    Klik Button Login Role Agent
    Klik Button Togle ON/OFF Status Unavailible Role Agent We Konnek
    Klik Button Yes Confirmation Reason Role Agent We Konnek
    Close All Browsers

TC_Super Role Agent_Chat Client
    Open browser Staging 
    Input Company ID, Email dan password Role Agent
    Klik Button Login Role Agent
    Refresh Page Until Page Contains Element
    Klik Card Chat Client Agent We Konnek 
    Klik Detail Profile Client We Konnek
    Close Browser
TC_Super Role Agent_Chat Client_assign agent
    Open browser Staging 
    Input Company ID, Email dan password Role Agent
    Klik Button Login Role Agent
    Refresh Page Until Page Contains Element
    Klik Card Chat Client Agent We Konnek 
    Klik Detail Profile Client We Konnek
    Klik Handover Agent We Konnek 
     Close Browser



    
