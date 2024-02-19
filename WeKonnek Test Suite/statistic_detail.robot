*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Screenshot
Library    Process
Resource    ../Keywords/variables.robot
Resource    ../Resources/step.robot

*** Test Cases ***
TC_Statistic_Detail
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Select From Date Summary Detail Date We Konnek
    Select To Date Summary Date We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filtering 7 Days
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button 7 Days Filtering
    Close Browser

TC_Statistic_Detail_Filter_Header_Data_Select All
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser

TC_Statistic_Detail_Filter_Header_Data_Session ID
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Session ID We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser

TC_Statistic_Detail_Filter_Header_Data_Agent
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Agent We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser

TC_Statistic_Detail_Filter_Header_Data_Agent_Category
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Category We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Customer Name
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Chekcmark Customer Name We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser

TC_Statistic_Detail_Filter_Header_Data_Agent_Customer ID
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Chekcmark Customer ID We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Channel
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Chekcmark Channel We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Open Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Open Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Queue Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Queue Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Assign Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Assign Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_First Response Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark First Response Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Last Agent Chat Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Last Agent Chat Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent_Close Time
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Close Time We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Status
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Status We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Duration
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Duration We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Queue Duration
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Queue Duration We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_First Response Duration
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark First Response Duration We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Resolve Duration
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Resolve Duration We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Service Level Duration
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Service Level Duration We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Service Level Status
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Select Data Summary Detail We Konnek
    Klik Button Checkmark Select All Data We Konnek
    Klik Button Checkmark Service Level Status We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Agent Summary Detail
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Agent Summary Detail We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Channel
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Status Summary Detail We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Status Detail
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Status Summary Detail We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Category
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Category Summary Detail We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Service Level Status Detail
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Dropdown Service Level Status We Konnek
    Klik Button Submit Date Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Hover Customer
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Hover Customer Summary Detail We Konnek
    Klik Button Submit Date Customer Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Hover Customer 7 Days
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Hover Customer Summary Detail We Konnek
    Klik Button Last 7 Days Customer Summary Detail We Konnek
    Klik Button Submit Date Customer Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Hover Customer Select From Date and To Date
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Hover Customer Summary Detail We Konnek
    Select From Date Summary Detail Customer We Konnek
    Select To Date Summary Detail Customer We Konnek
    Klik Button Submit Date Customer Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Hover Customer All Data Customer
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Hover Customer Summary Detail We Konnek
    Klik Button Dropdown Data Customer Summary Detail We Konnek
    Klik Button Submit Date Customer Summary Detail We Konnek
    Close Browser
TC_Statistic_Detail_Filter_Header_Data_Hover Customer All Channel and Tags
    Open browser Staging
    Input Company ID, Email dan password
    Klik Button Login
    Klik Button Detail WeKonnek
    Klik Button Hover Customer Summary Detail We Konnek
    Klik Button Dropdown Channel Customer Summary Detail We Konnek
    Klik Button Submit Date Customer Summary Detail We Konnek
    Close Browser