*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Super Admin We Konnek
    Open browser Staging Admin
    Input Email dan password Admin
    Klik Button Login Admin Konnek
    Klik Menu Company Super Admin We Konnek
    Klik Button Add New Company Super Admin We Konnek
    Input Company Name We Konnek
    Input Company ID We Konnek
    Input Company Email We Konnek
    Input Limit Users Company We Konnek
    Input BO Client Company We Konnek
    Input BO Division Company We Konnek
    Input Domain Access Company We Konnek
    Select Date Member Period Company Join 
    To Date Member Period Company Join
    Pilih List Whatsap Channel Company We Konnek
    Klik Togle ON/OFF Status Broadcast Message WA Company We Konnek
    Pilih List Telegram Channel Company We Konnek
    Pilih Facebook Channel Company We Konnek
    Pilih Line Channel Company We Konnek
    Pilih Bot Channel Company We Konnek
    Klik Button Save New Company We Konnek
    Close Browser
TC_Super Admin We Konnek_Filtering Ascending
    Open browser Staging Admin
    Input Email dan password Admin
    Klik Button Login Admin Konnek
    Klik Menu Company Super Admin We Konnek
    Klik Filtering Sort By Ascending We Konnek
    Klik Button Apply Filtering We Konnek
    Close Browser
TC_Super Admin We Konnek_Filtering Descending
    Open browser Staging Admin
    Input Email dan password Admin
    Klik Button Login Admin Konnek
    Klik Menu Company Super Admin We Konnek
    Klik Filtering Sort By Descending We Konnek
    Klik Button Apply Filtering We Konnek
    Close Browser
TC_Super Admin We Konnek_Filtering Latest
    Open browser Staging Admin
    Input Email dan password Admin
    Klik Button Login Admin Konnek
    Klik Menu Company Super Admin We Konnek
    Klik Filtering Sort By Latest We Konnek
    Klik Button Apply Filtering We Konnek
    Close Browser
TC_Super Admin We Konnek_Filtering Oldest
    Open browser Staging Admin
    Input Email dan password Admin
    Klik Button Login Admin Konnek
    Klik Menu Company Super Admin We Konnek
    Klik Filtering Sort By Oldest We Konnek
    Klik Button Apply Filtering We Konnek
    Close Browser
TC_Settings_Division_Role Agent
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Klik Hover Role User Agent We Konnek
    Klik Button Add New Role User Agent We Konnek
    Input Role Name User Agent
    Klik Button Dropdown Status Agent User We Konnek
    Klik Button Dropdown Admin Status We Konnek
    Klik Access Checkmark We Konnek
    # Klik Button Dropdown First Page
    Pilih List Dropdown Statistic First Page
    Klik Status Active Role Agent We Konnek
    Klik Button Save Role Agent We Konnek
    Close Browser
TC_Settings_Admin Konnek New Agent
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Klik Button Add New Role Agent We Konnek
    Input New Admin Agent Name We Konnek
    Input Email Address Admin Agent We Konnek
    Input Name Division Agent We Konnek
    Input Role Admin Agent We Konnek
    Klik Button Save New Agent We Konnek
    Close Browser

TC_Settings_Admin Konnek Filtering Division
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Refresh Page Page Admin
    Klik Button Filtering Menu User Admin We Konnek
    Klik Button Checkmark Division Menu User We Konnek 
    Klik Button Apply Filtering Menu User We Konnek 
    Close Browser
TC_Settings_Admin Edit Role 
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Klik Hover Role User Agent We Konnek
    Klik Button Edit Role Agent We Konnek 
    Klik Button Inactive Status Role Agent We Konnek 
    Klik Button Save Role Agent We Konnek
    Close Browser
TC_Settings_Admin Edit Profile Role 
    Open browser Staging
    Input Company ID, Email dan password Admin
    Klik Button Login Admin QA Konnek
    Klik Menu settings Admin We Konnek
    Klik Menu User Admin We Konnek
    Refresh Page Page Admin
    Input Pencarian Manage User We Konnek 
    Klik Card Agent Manage User We Konnek 
    Klik Edit Profile Manage User We Konnek
    Klik Field Role Agent Manage User We Konnek 
    Klik Button Save New Agent We Konnek
    Close Browser
    


