*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot
Library    BuiltIn
Library    RequestsLibrary
# Library    date_times1.py
Library    Telnet
Resource    ../Keywords/variables.robot
Library    DateTime

#Step Login WeKonnek
*** Keywords ***
Open browser Staging
    Set Selenium Speed    0.2
y    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Go To    ${url_konnek}
     ${Reload}=  Run Keyword And Return Status  Page Should Contain Element     xpath=/html//div[@id='root']/div/div/div[@class='col']//div[@class='login-wrapper']//form//input[@name='companyId']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='root']/div/div/div[@class='col']//div[@class='login-wrapper']//form//input[@name='companyId']
    END
    # SeleniumLibrary.Wait Until Page Contains Element    ${company_id}
Open browser Staging Admin
    Set Selenium Speed    0.2
    SeleniumLibrary.Open Browser     about:blank    browser=chrome    options=add_argument("--incognito")
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Go To    ${url_admin_konnek}
    SeleniumLibrary.Page Should Contain    Sign in to your account
    Capture Page Screenshot
Refresh Page Until Page Contains Element
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']/div[@class='ant-switch-handle']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']/div[@class='ant-switch-handle']
    END
Refresh Page Page Admin
    ${Reload1}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']/img[@alt='image-filter']
    WHILE    ${Reload1} != ${TRUE}
        ${Reload1}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']/img[@alt='image-filter']
    END
Input Email dan password Admin
    SeleniumLibrary.Input Text       ${email_admin_konnek}          ${username_admin_konnek}
    SeleniumLibrary.Input Password   ${element_password_admin_konnek}         ${password_super_admin_konnek}
    Capture Page Screenshot
Input Company ID, Email dan password
    SeleniumLibrary.Input Text        ${company_id}             ${company_id_spv_konnek}
    SeleniumLibrary.Input Text        ${email_konnek}           ${email_spv_konnek}
    SeleniumLibrary.Input Password    ${password_konnek}        ${password_spv_konnek}
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div/div/div[@class='col']//div[@class='login-wrapper']//form//i[@role='button']
    Capture Page Screenshot
Input Company ID, Email dan password Admin
    SeleniumLibrary.Input Text        ${company_id}             ${company_id_spv_konnek}
    SeleniumLibrary.Input Text        ${email_konnek}           ${emails_admin_konnek} 
    SeleniumLibrary.Input Password    ${password_konnek}        ${password_admin_konnek}
    Capture Page Screenshot
Input Company ID, Email dan password Role Agent
    SeleniumLibrary.Input Text        ${company_id}             ${company_id_spv_konnek}
    SeleniumLibrary.Input Text        ${email_konnek}           ${emails_role_agent_konnek}
    SeleniumLibrary.Input Password    ${password_konnek}        ${password_role_agent_konnek}
    Capture Page Screenshot
Klik Button Login Admin QA Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div/div/div[@class='col']//div[@class='login-wrapper']//form//button[@type='primary']
    Capture Page Screenshot
    # SeleniumLibrary.Page Should Contain    Channel
Klik Button Login
    SeleniumLibrary.Click Element    ${btn_login_konnek}
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[1]/a[@role='tab']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[1]/a[@role='tab']
    END
    Capture Page Screenshot
    # SeleniumLibrary.Page Should Contain  Overview  
    # xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='tab-content']/div[1]//h3[.='Overview']    Overview
Klik Button Login Admin Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']//div[@class='ant-row h-100']//form/div[@class='ant-row']//button[@type='submit']/span[.='Sign in']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='root']//div[@class='ant-row h-100']//ul[@role='menu']/li[2]//a[@href='/company']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='root']//div[@class='ant-row h-100']//ul[@role='menu']/li[2]//a[@href='/company']
    END
    Capture Page Screenshot
    # SeleniumLibrary.Page Should Contain    Overview
Klik Button Login Role Agent
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div/div/div[@class='col']//div[@class='login-wrapper']//form//button[@type='primary']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//input[@name='search_messages']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//input[@name='search_messages']
    END
    Capture Page Screenshot
    # SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']/div[@class='ant-switch-handle']
    # SeleniumLibrary.Page Should Contain    waiting for response
Klik Menu Open Chat Agent We Konnek
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']/div[@class='ant-switch-handle']
    SeleniumLibrary.Click Element        xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[1]/ul[@role='menu']/li[1]//a[@href='/chat/open']    
    SeleniumLibrary.Page Should Contain    waiting for response
    Capture Page Screenshot
Klik Card Chat Client Agent We Konnek 
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']/div[@class='ant-switch-handle']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']//div[@class='col-md-10']
    Capture Page Screenshot
Klik Detail Profile Client We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[2]/div[1]//img[@alt='icon-dot pl-3']
    # SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div//button[@type='button']/p[@class='mb-0']
    Capture Page Screenshot
Klik Handover Agent We Konnek 
    SeleniumLibrary.Click Element    xpath=//button[1]/p[@class='mb-0']
    SeleniumLibrary.Page Should Contain    Handover Conversation
    Capture Page Screenshot
    #Button Handover
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']//div[@class='col-lg-12']/div[2]/div/div/button[@type='primary']
    Capture Page Screenshot
    #Button Sure,Go Ahead
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Sure, go ahead']
    Capture Page Screenshot
Pilih Assign Agent We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[3]//input[@value='0']
Input Pencarian Data Search Message Role Agent We Konnek 
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//input[@name='search_messages']    f+a+d+h+i+l
    Capture Page Screenshot
Klik Button Search Message We Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='align-items-center d-flex mb-4']/button[1]
    Capture Page Screenshot
Select From Date Summary General WeKonnek
    ${random_number2}    Evaluate    random.randint(1, 30)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Select From Date Summary Conversation WeKonnek
    ${random_number2}    Evaluate    random.randint(1, 30)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Select From Date Summary Agent WeKonnek
    ${random_number2}    Evaluate    random.randint(1, 30)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[3]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[3]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[3]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[3]/div/div[1]/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
# Select To Date Summary WeKonnek // Still Issue
    # SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//input[@value='02 Jan 2024']
Klik Button Apply Date Summary General WeKonnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[1]//button[@type='primary']
    Capture Page Screenshot
Klik Button Apply Date Summary Conversation WeKonnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[2]//button[@type='primary']
    Capture Page Screenshot
Klik Button Apply Date Summary Agent WeKonnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[3]//button[@type='primary']
    Capture Page Screenshot
Klik Button Dropdown Daily Conversation General
    SeleniumLibrary.Click Element    xpath=//select[@class='form-control-flat']
    Capture Page Screenshot
Klik Button Dropdown Daily Conversation Hover Conversation
    SeleniumLibrary.Click Element    xpath=//div[@class='tab-content']/div[2]/div/div[2]/div[@class='row']/div[3]/div[1]/div[@class='row']/div[1]/select[@class='form-control-flat']
    Capture Page Screenshot
Klik Button Dropdown Hourly Conversation Hover Conversation
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']/div[@class='col-sm-12']/div/div[2]/div/div[2]/div[@class='row']/div[4]/div[@class='row']/div[1]/div/div[@class='row']/div[1]/select[@class='form-control-flat']
    Capture Page Screenshot
Pilih List Total Daily Conversation
    ${total_options}    Get Element Count    xpath=//select[@class='form-control-flat']
    ${random_index}    Evaluate    random.randint(0, 1)
    SeleniumLibrary.Select From List By Index  xpath=//select[@class='form-control-flat']     ${random_index}
    Capture Page Screenshot
Pilih List Total Daily Conversation Hover Conversation
    ${total_options}    Get Element Count    xpath=//div[@class='tab-content']/div[2]/div/div[2]/div[@class='row']/div[3]/div[1]/div[@class='row']/div[1]/select[@class='form-control-flat']
    ${random_index}    Evaluate    random.randint(0, 1)
    SeleniumLibrary.Select From List By Index  xpath=//div[@class='tab-content']/div[2]/div/div[2]/div[@class='row']/div[3]/div[1]/div[@class='row']/div[1]/select[@class='form-control-flat']     ${random_index}
    Capture Page Screenshot
Pilih List All Channel Daily Conversation
    ${total_options}    Get Element Count    xpath=//select[@class='form-control-flat']
    ${random_index}    Evaluate    random.randint(0, 1)
    SeleniumLibrary.Select From List By Index  xpath=//select[@class='form-control-flat']     ${random_index}
    Capture Page Screenshot
Klik Hover Summary Conversation
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[2]/a[@role='tab']
    Capture Page Screenshot
Pilih List Total Hourly Conversation Hover Conversation
    ${total_options}    Get Element Count    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']/div[@class='col-sm-12']/div/div[2]/div/div[2]/div[@class='row']/div[4]/div[@class='row']/div[1]/div/div[@class='row']/div[1]/select[@class='form-control-flat']
    ${random_index}    Evaluate    random.randint(0, 1)
    SeleniumLibrary.Select From List By Index  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']/div[@class='col-sm-12']/div/div[2]/div/div[2]/div[@class='row']/div[4]/div[@class='row']/div[1]/div/div[@class='row']/div[1]/select[@class='form-control-flat']     ${random_index}
    Capture Page Screenshot
Klik Hover Summary Agent
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[3]/a[@role='tab']
    Capture Page Screenshot
#Statistic Detail
Klik Button Detail WeKonnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[1]/ul[@role='menu']/li[2]//a[@href='/dashboard/detail']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[1]//div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Select From Date Summary Detail Date We Konnek
    ${random_number2}    Evaluate    random.randint(1, 30)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Select To Date Summary Date We Konnek
    ${random_number2}    Evaluate    random.randint(1, 30)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Klik Button Submit Date Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[1]//div[@class='row']/div[4]/button[1]
    Capture Page Screenshot
Klik Button 7 Days Filtering
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[1]//div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Klik Button Dropdown Select Data Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[3]/span[@class='multiselect-native-select']/div[@class='btn-group']/button[@title='Session ID, Agent, Category, Customer Name, Customer ID, Channel, Open Time, Queue Time, Assign Time, First Response Time, Last Agent Chat Time, Close Time, Status, Duration, Queue Duration, First Response Duration, Resolve Duration, Service Level Duration, Service Level Status']/span[.='All']
    Capture Page Screenshot
Klik Button Checkmark Select All Data We Konnek
    SeleniumLibrary.Click Element    ${checkmark_select_all_data_weKonnek}
    Capture Page Screenshot
Klik Button Checkmark Session ID We Konnek
    SeleniumLibrary.Click Element    ${checkmark_session_id_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Session ID
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Agent We Konnek
    SeleniumLibrary.Click Element    ${checkmark_agent_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Agent
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Category We Konnek
    SeleniumLibrary.Click Element    ${checkmark_category_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Category
    Sleep    0.2
    Capture Page Screenshot
Klik Button Chekcmark Customer Name We Konnek
    SeleniumLibrary.Click Element    ${checkmark_customer_name_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Customer Name 
    Sleep    0.2
    Capture Page Screenshot
Klik Button Chekcmark Customer ID We Konnek
    SeleniumLibrary.Click Element    ${checkmark_customer_id_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Customer ID
    Sleep    0.2
    Capture Page Screenshot
Klik Button Chekcmark Channel We Konnek
    SeleniumLibrary.Click Element    ${checkmark_channel_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Channel
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Open Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_open_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Open Time 
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Queue Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_queue_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Queue Time 
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Assign Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_assign_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Assign Time
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark First Response Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_first_response_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    First Response Time
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Last Agent Chat Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_last_agent_chat_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Last Agent Chat Time
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Close Time We Konnek
    SeleniumLibrary.Click Element    ${checkmark_last_agent_chat_time_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Last Agent Chat Time
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Status We Konnek
    SeleniumLibrary.Click Element    ${checkmark_status_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Status
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Duration We Konnek
    SeleniumLibrary.Click Element    ${checkmark_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Queue Duration We Konnek
    SeleniumLibrary.Click Element    ${checkmark_queue_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Queue Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark First Response Duration We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    ${checkmark_first_response_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    First Response Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Resolve Duration We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    ${checkmark_resolve_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Resolve Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Service Level Duration We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    ${checkmark_service_level_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Service Level Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Checkmark Service Level Status We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    ${checkmark_service_level_duration_weKonnek}
    SeleniumLibrary.Wait Until Page Contains    Service Level Duration
    Sleep    0.2
    Capture Page Screenshot
Klik Button Dropdown Agent Summary Detail We Konnek
   SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[4]/div//span[@title='All']
    ${totalAgent_options}    Get Element Count    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[4]/div//span[@title='All']
    ${random_index}    Evaluate    random.randint(0, ${totalAgent_options}-1)
    SeleniumLibrary.Click Element    xpath=(//div[@title='Candy']/div[@class='ant-select-item-option-content'])[${random_index + 1}]
    Capture Page Screenshot
Klik Button Dropdown Channel Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[5]/div//span[@title='All']
    Capture Page Screenshot

Klik Button Dropdown Status Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[6]/div//span[@title='All']
    Capture Page Screenshot

Klik Button Dropdown Category Summary Detail We Konnek
    Sleep    0.4
    SeleniumLibrary.Click Element    xpath=//div[@class='tab-content']/div[1]//button[@title='test lagi, Promosi, Complain, Financial Complain, Category Ucan, Complaint, Test Demo, Demo 2, Harga, Info Umum Blu Deposit, Idle, Create New Category, NCat, aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa']/span[.='All']
    Capture Page Screenshot

Klik Button Dropdown Service Level Status We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[1]//div[@class='row']/div[2]/div[8]/div//span[@title='All']
    Capture Page Screenshot
Klik Button Hover Customer Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[2]/a[@role='tab']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[2]//div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Klik Button Submit Date Customer Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[2]//div[@class='row']/div[4]/button[1]
    Capture Page Screenshot
Klik Button Last 7 Days Customer Summary Detail We Konnek
    SeleniumLibrary.Click Element     xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']//div[@class='tab-content']/div[2]//div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Select From Date Summary Detail Customer We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    28 December 2023
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Select To Date Summary Detail Customer We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    1 January 2024
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]/div[@class='row']//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    RETURN
    Capture Page Screenshot
Klik Button Dropdown Data Customer Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[3]/span[@class='multiselect-native-select']/div[@class='btn-group']/button[@title='Customer Name, Customer ID, Channel, Tags, Total Session, Total Session Duration, Total Open, Total Closed']
    Capture Page Screenshot
Klik Button Dropdown Channel Customer Summary Detail We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='wrapper-card-dashboard']/div[2]//div[@class='tab-content']/div[2]//div[@class='row']/div[2]/div[4]/div//span[@title='All']
    SeleniumLibrary.Click Element    xpath=//body/div[2]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='Whatsapp']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot

#Settings - Division
Klik Menu Settings We Konnek
    Sleep    1
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/div[@role='menuitem']/span[@class='uncollapsible']
    Capture Page Screenshot
Klik Menu Settings Admin We Konnek
    SeleniumLibrary.Wait Until Page Contains    Channel
    # SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[@role='none']/div[@role='menuitem']/span[@class='uncollapsible']
    Capture Page Screenshot
Klik Menu Division We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[1]//a[@href='/setting/divisions']
    Capture Page Screenshot
Klik Button Klik Create New Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[.='+ Create New Division']
    SeleniumLibrary.Page Should Contain    Division
    Capture Page Screenshot
Input Nama Divisi We Konnek 
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//input[@name='name']    ${format_name_division_weKonnek}${random_number2}
    SeleniumLibrary.Page Should Contain    *Max 20 characters
    Capture Page Screenshot
Klik Button Save Name Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Save']
    Capture Page Screenshot
Klik Button Cancel Name Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[1]/span[.='Cancel']
    Capture Page Screenshot
Klik Button Delete Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[3]/div/button[2]/i[@class='fa fa-trash-alt']
    Capture Page Screenshot
Klik Button Yes, Delete Confirmation Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Yes, Delete']
    Capture Page Screenshot
Klik Button Cancel Delete Confirmation Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[1]/span[.='Cancel']
    Capture Page Screenshot
Klik Button Edit Division We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[3]/div/button[1]/i[@class='fa fa-pencil-alt']
    Capture Page Screenshot
Klik Menu Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[2]//a[@href='/setting/chat_template']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[@class='btn btn-template']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[@class='btn btn-template']
    END
    Capture Page Screenshot
Klik Button Create New Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[@class='btn btn-template']
    Capture Page Screenshot
Input Keyword Chat Template We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//input[@name='name']    test_keyword_template${random_number2}
    Capture Page Screenshot
Input Deskripsi Chat Template We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//textarea[@name='description']    ${format_name_division_weKonnek}${random_number2}
    Capture Page Screenshot
Klik Button Edit Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[4]/div/button[1]/i[@class='fa fa-pencil-alt']
    Capture Page Screenshot
Klik Button Delete Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[4]/div/button[2]/i[@class='fa fa-trash-alt']
    Capture Page Screenshot
#Settings - Category
Klik Menu Category We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[3]//a[@href='/setting/category']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[.='+ Create New Category']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[.='+ Create New Category']
    END
    Capture Page Screenshot
Klik Button Create New Category We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[.='+ Create New Category']
    Capture Page Screenshot
Input Category Name We Konnek
    SeleniumLibrary.Input Text    xpath=/html/body/div[2]/div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//input[@name='name']    ${format_deskripsi_category_10k}
    Capture Page Screenshot
Input Description Text Category We Konnek
    SeleniumLibrary.Input Text    xpath=/html/body/div[2]/div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//textarea[@name='description']    ${format_deskripsi_category_10k}
    Capture Page Screenshot
Klik Button Save Category We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Save']
    Capture Page Screenshot
Klik Button Update Category We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Update']
    Capture Page Screenshot

#Settings - Tags
Klik Menu Tags We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[4]//a[@href='/setting/tags']
    Capture Page Screenshot
Klik Button Create New Tag We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//button[.='+ Create New Tag']
    Capture Page Screenshot
Input Tag Name We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']/div[@class='ant-modal-content']/div[@class='ant-modal-body']//input[@name='name']     ${format_deskripsi_category_10k}
    Capture Page Screenshot
Klik Button Delete Tags We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[3]/div/button[2]/i[@class='fa fa-trash-alt']
    Capture Page Screenshot
Klik Button Cancel Delete Tags We Konnek
    SeleniumLibrary.Click Element   xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[1]/span[.='Cancel']
    Capture Page Screenshot
Klik Button Edit Tags We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//table[@class='table table-borderless']/tbody/tr[1]/td[3]/div/button[1]/i[@class='fa fa-pencil-alt']
    Capture Page Screenshot
Klik Button Cancel Edit Tags We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[1]/span[.='Cancel']
    Capture Page Screenshot
Klik Button Save Edit Tags We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Save']
    Capture Page Screenshot
Klik Menu Greetings We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[8]//a[@href='/setting/greetings']
    SeleniumLibrary.Page Should Contain    Keyword Filter 
    Capture Page Screenshot
Klik Togle ON/OFF Status Keyword We Konnek
    Execute JavaScript    window.scrollTo(321, -100)
    # SeleniumLibrary.Scroll Element Into View    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/table//button[@role='switch']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/table//button[@role='switch']
    Capture Page Screenshot
Klik Togle ON/OFF Status Greetings We Konnek
    # Execute JavaScript    window.scrollTo(0,600)
    # SeleniumLibrary.Scroll Element Into View    xpath= xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[@class='form-group welcome-greeting']/button[@role='switch']/div[@class='ant-switch-handle']
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[@class='form-group welcome-greeting']/button[@role='switch']/div[@class='ant-switch-handle']
    Capture Element Screenshot    locator
Klik Checkbox Add Division Greetings We Konnek 
    Execute JavaScript    window.scrollTo(0,400)
    # SeleniumLibrary.Scroll Element Into View    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='row']/div//form//input[@class='ant-checkbox-input']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='row']/div//form//input[@class='ant-checkbox-input']
    Capture Page Screenshot
Klik Togle ON/OFF Status Queue Greetings We Konnek
    # SeleniumLibrary.Scroll Element Into View    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[@class='form-group queue-greeting']/button[@role='switch']/div[@class='ant-switch-handle']
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[@class='form-group queue-greeting']/button[@role='switch']/div[@class='ant-switch-handle']
    Execute JavaScript    window.scrollTo(327, 865)
    Capture Page Screenshot
Klik Togle ON/OFF Status Assign Greetings We Konnek
    Execute JavaScript    window.scrollTo(757, 1590)
    # SeleniumLibrary.Scroll Element Into View    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[5]/button[@role='switch']/div[@class='ant-switch-handle']
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[5]/button[@role='switch']/div[@class='ant-switch-handle']
Klik Togle ON/OFF Status Close Greetings 
    # Execute JavaScript    window.scrollTo(327, 661)
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form/div[6]/button[@role='switch']/div[@class='ant-switch-handle']
    Capture Page Screenshot
Klik Button Save Greetings 
    Execute JavaScript    window.scrollTo(757, 1590)
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row']/div//form//button[@class='btn btn-apply btn-lg ml-4']
    Capture Page Screenshot
Klik Menu Chats We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//aside[@class='ant-layout-sider ant-layout-sider-dark']/div/ul[@role='menu']/li[2]/div[@role='menuitem']//span[@class='uncollapsible']
    Capture Page Screenshot
Klik Sub Menu Open Chats We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[2]/ul[@role='menu']/li[1]//a[@href='/chat/open']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//input[@name='search_messages']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//input[@name='search_messages']
    END
    SeleniumLibrary.Wait Until Page Contains    Total Chat Room : 
    Sleep    1
    Capture Page Screenshot
Klik Room Chat SPV We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']//div[@class='col-md-10']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[2]/div[1]//form[@class='ant-form ant-form-vertical']//div[@class='row']/div[@class='col-md-11']//textarea[@placeholder='Chat...']
    Capture Page Screenshot
Input Text Keyword Chat Template We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[2]/div[1]//form[@class='ant-form ant-form-vertical']//div[@class='row']/div[@class='col-md-11']//textarea[@placeholder='Chat...']    /
    Capture Page Screenshot
Pilih Keywords Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@class='py-3 row']/div[2]/div[@class='align-items-center row']/div[@class='col-md-2']/button[@type='button']/img[@alt='icon-plus']
    Capture Page Screenshot
Klik Button Kirim Send Chat Template We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[2]/div[1]//form[@class='ant-form ant-form-vertical']//div[@class='row']/div[@class='align-self-center col-md-1']//button[@class='btn btn-send']
    Capture Page Screenshot

#Menu Admin
Klik Menu User Admin We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[@role='none']/ul[@role='menu']/li[1]//a[@href='/setting/users']
     ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//input[@name='search_agent']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//input[@name='search_agent']
    END
    Capture Page Screenshot
Klik Button Filtering Menu User Admin We Konnek
    # SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']/img[@alt='image-filter']
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']/img[@alt='image-filter']
    Capture Page Screenshot
Klik Button Checkmark Division Menu User We Konnek 
    SeleniumLibrary.Click Element    xpath=//input[@value='f5d8d0c5-f861-423f-a33f-cf4e266ace3c']
    Capture Page Screenshot
Klik Button TAB Role Admin We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@role='tablist']/div[2]/a[@role='tab']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/role/new']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/role/new']
    END
    Capture Page Screenshot
Klik Button Edit Role Agent We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//table[@id='table']//a[@href='/setting/users/role/edit/2920378b-b6b8-447a-a7cf-16ef436257b2']
    Execute JavaScript    window.scrollTo(0,800)
    Capture Page Screenshot
Klik Button Add New Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/new']
    Capture Page Screenshot
Klik Button Inactive Status Role Agent We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/table[2]//div[@class='ant-radio-group ant-radio-group-outline']//input[@value='false']
    Capture Page Screenshot
Input New Admin Agent Name We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//input[@name='employee_name']    admin_qa_agent${random_number2}
    Capture Page Screenshot
Input Email Address Admin Agent We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//input[@name='username']    admin_qa${random_number2}@harakirimail.com
    Capture Page Screenshot
Input Division Agent We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//div[@name='division_id']//input[@role='combobox']    QA    RETURN
    # SeleniumLibrary.Click Element    xpath=//body/div[3]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='QA punya']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Input Role Admin Agent We Konnek
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//div[@name='roles_id']//input[@role='combobox']    A+d+m+i+n    RETURN
    # SeleniumLibrary.Click Element    xpath=//body/div[4]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='admin']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Button Apply Filtering Menu User We Konnek 
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    xpath=//button[@class='btn btn-apply']
    Capture Page Screenshot
Klik Button Save New Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@class='btn btn-apply btn-lg ml-4']
    Capture Page Screenshot
#Role User Agent
Klik Hover Role User Agent We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@role='tablist']/div[2]/a[@role='tab']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/role/new']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/role/new']
    END
    Capture Page Screenshot
Klik Button Add New Role User Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/role/new']
    Capture Page Screenshot
Input Role Name User Agent
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//input[@name='username']    Role_QA${random_number2}
    Capture Page Screenshot
Klik Button Dropdown Status Agent User We Konnek
    # SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@name='is_agent']//input[@role='combobox']
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@name='is_agent']//input[@role='combobox']    RETURN
    # SeleniumLibrary.Click Element    xpath=//body/div[3]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='Yes']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Button Dropdown Admin Status We Konnek
    # SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@name='is_admin']//input[@role='combobox']
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@name='is_admin']//input[@role='combobox']    RETURN
    # SeleniumLibrary.Click Element    xpath=//body/div[4]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='Yes']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Access Checkmark We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/div[4]/div[1]/div[1]/label[@class='ant-checkbox-wrapper']//input[@name='roles']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/div[4]/div[2]/div[1]/label[@class='ant-checkbox-wrapper']//input[@name='roles']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/div[4]/div[3]/div[1]/label[@class='ant-checkbox-wrapper']//input[@name='roles']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/div[4]/div[4]/div[1]/label[@class='ant-checkbox-wrapper']//input[@name='roles']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/div[4]/div[5]/div[1]/label[@class='ant-checkbox-wrapper']//input[@name='roles']
# Klik Button Dropdown First Page
    # SeleniumLibrary.Click Element    xpath=/html//table[@id='table']//td/div//input[@role='combobox']
    # SeleniumLibrary.Wait Until Page Contains Element    xpath=//*[@id="table"]/tbody/td/div/div/span[2]
Pilih List Dropdown Statistic First Page
    SeleniumLibrary.Press Keys       xpath=/html//table[@id='table']//td/div//input[@role='combobox']    ALT+ARROW_DOWN    RETURN
    # SeleniumLibrary.Press Keys   xpath=/html//table[@id='table']//td/div//input[@role='combobox']    RETURN
    Capture Page Screenshot
Klik Status Active Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//div[@class='card-body']/table[2]//div[@class='ant-radio-group ant-radio-group-outline']//input[@value='true']
    Capture Page Screenshot
Klik Button Save Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//button[@class='btn btn-apply btn-lg ml-4']
    Capture Page Screenshot
Input Pencarian Data User We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//input[@name='search_agent']    rabil_agent
    Capture Page Screenshot
Input Pencarian Manage User We Konnek 
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//input[@name='search_agent']    rabiltest
    Capture Page Screenshot
Klik Card Agent Manage User We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[3]//p[@class='title-user']
    Capture Page Screenshot
Klik Edit Profile Manage User We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//a[@href='/setting/users/edit/e3a0056e-c4ab-4d05-86a5-650f523e7ebe']
    Capture Page Screenshot
Klik Field Role Agent Manage User We Konnek 
    SeleniumLibrary.Press Keys    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//div[@name='roles_id']//input[@role='combobox']    a+d+m+i+n    RETURN
    Capture Page Screenshot
Klik User Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='row']/div[3]//div[@class='mt-2 wrapper-card-chat-agent']/div[1]/div[@class='ant-card']/div[@class='ant-card-body']/div[@class='card-chat-content container-fluid']/div[@class='row']/div[@class='col-lg-10 col-md-12']/p[@class='title-user']
    Capture Page Screenshot
Klik Button Edit Profile User Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//a[@href='/setting/users/edit/0ddecb75-2ef1-4c7d-9397-68ed51e42304']
    Capture Page Screenshot
Klik Button Add New Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/setting/users/new']
    SeleniumLibrary.Wait Until Page Contains    New Agent
    Capture Page Screenshot
Input Name Agent We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//input[@name='employee_name']    new_agent_qa
    Capture Page Screenshot
Input Email Address We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//input[@name='username']    testingqa@harakirimail.com 
    Capture Page Screenshot
Input Name Division Agent We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//div[@name='division_id']//input[@role='combobox']    QA
    SeleniumLibrary.Click Element    xpath=//body/div[2]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='QA punya']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Input Role Agent We Konnek
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//div[@name='roles_id']//input[@role='combobox']    supervisor
    SeleniumLibrary.Click Element    xpath=//body/div[3]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='supervisor']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Button Save Add New Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@class='btn btn-apply btn-lg ml-4']
    Capture Page Screenshot
#Menu Chat Distribution
Klik Menu Chat Distribution We Konnek
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[6]//a[@href='/setting/chat_limit']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@role='switch']/div[@class='ant-switch-handle']
    WHILE    ${Reload} != ${TRUE}
        Sleep    1
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@role='switch']/div[@class='ant-switch-handle']
    END
    Capture Page Screenshot
Klik Togle ON/OFF Status Auto Assign Chat Distribution We Konnek 
    Execute JavaScript    window.scrollTo(800,0)
    # SeleniumLibrary.Wait Until Element Contains    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@role='switch']/div[@class='ant-switch-handle']    Auto Assign
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div//form//button[@role='switch']/div[@class='ant-switch-handle']
    Capture Page Screenshot
Klik Togle ON/OFF Set Chat Limit Distribution We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div/div[2]//button[@role='switch']
    Capture Page Screenshot
Klik Menu Change Password We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[4]/ul[@role='menu']/li[5]//a[@href='/setting/change-password']
    SeleniumLibrary.Page Should Contain    Change Password
    Capture Page Screenshot
Input Current Password
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//form//input[@name='currentPassword']    Muhammad12
    Capture Page Screenshot
Input New Password
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//form//input[@name='newPassword']    ${SPACE}@Muhammad12
    Capture Page Screenshot
Input Confirm Password
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div//form//input[@name='confirmPassword']    ${SPACE}@Muhammad12
    Capture Page Screenshot

#Menu Super Admin WE Konnek
Klik Menu Company Super Admin We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']//div[@class='ant-row h-100']//ul[@role='menu']/li[2]//a[@href='/company']
    SeleniumLibrary.Page Should Contain    Company
    Capture Page Screenshot
Klik Button Add New Company Super Admin We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']//button[@type='submit']
    SeleniumLibrary.Page Should Contain    Add New Company
    Capture Page Screenshot
Input Company Name We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='company_name']    PT QA Sejahrtera${random_number2}
    Capture Page Screenshot
Input Company ID We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='company_id']    QA_ID
    Capture Page Screenshot
Input Company Email We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='company_email']    qa_email${random_number2}@harakirimail.com
    Capture Page Screenshot
Input Limit Users Company We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='user_limit']        ${random_number2}
    Capture Page Screenshot
Input BO Client Company We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='bo_client_code']    QA_BO_Client${random_number2}
    Capture Page Screenshot
Input BO Division Company We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='bo_div_code']    QA_BO_Division${random_number2}
    Capture Page Screenshot
Input Domain Access Company We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[1]/div[7]//input[@name='domain_access']    https://qa-testing${random_number2}.com
    Execute JavaScript    window.scrollTo(0,800)
    Capture Page Screenshot
Select Date Member Period Company Join
    ${random_number2}    Evaluate    random.randint(1, 15)
    # SeleniumLibrary.Click Element    xpath=/html//input[@id='start_period']
    SeleniumLibrary.Press Keys    xpath=/html//input[@id='start_period']    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//input[@id='start_period']    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//input[@id='start_period']    ENTER
    Capture Page Screenshot
To Date Member Period Company Join
    Execute JavaScript    window.scrollTo(0,800)
    SeleniumLibrary.Click Element    xpath=/html//input[@id='end_period']
    ${random_number2}    Evaluate    random.randint(16, 30)
    SeleniumLibrary.Press Keys    xpath=/html//input[@id='end_period']    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//input[@id='end_period']    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//input[@id='end_period']    ENTER
    Execute JavaScript    window.scrollTo(0,800)
    Capture Page Screenshot
Pilih List Whatsap Channel Company We Konnek
    SeleniumLibrary.Scroll Element Into View    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[4]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_telegram']//input[@role='combobox']
    SeleniumLibrary.Input Text    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[3]/div[1]/div[@name='sdk_whatsapp']//input[@role='combobox']    Whatsapp botika
    SeleniumLibrary.Click Element    xpath=//body[@class='ant-scrolling-effect']/div[3]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@title='Whatsapp botika']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Togle ON/OFF Status Broadcast Message WA Company We Konnek
    SeleniumLibrary.Click Element    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[3]/div[2]//button[@role='switch']
    Capture Page Screenshot

Pilih List Telegram Channel Company We Konnek
    SeleniumLibrary.Scroll Element Into View    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[5]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_facebook']//input[@role='combobox']
    SeleniumLibrary.Input Text        xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[4]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_telegram']//input[@role='combobox']    Telegram
    SeleniumLibrary.Click Element    xpath=//body[@class='ant-scrolling-effect']/div[4]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@title='Telegram']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Pilih Facebook Channel Company We Konnek
    SeleniumLibrary.Input Text    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[5]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_facebook']//input[@role='combobox']    Facebook
    SeleniumLibrary.Click Element    xpath=//body[@class='ant-scrolling-effect']/div[5]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@title='Facebook Messenger']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Pilih Line Channel Company We Konnek
    SeleniumLibrary.Input Text        xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[6]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_line']//input[@role='combobox']    line
    SeleniumLibrary.Click Element     xpath=//body[@class='ant-scrolling-effect']/div[6]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@title='Line']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Pilih Bot Channel Company We Konnek
    SeleniumLibrary.Input Text    xpath=//body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[7]/div[@class='ant-col ant-col-md-12']/div[@name='sdk_bot']//input[@role='combobox']    Bot
    SeleniumLibrary.Click Element    xpath=//body[@class='ant-scrolling-effect']/div[7]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@title='Bot Dummy']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
    Capture Page Screenshot
Klik Button Save New Company We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body[@class='ant-scrolling-effect']//div[@role='dialog']/div[@role='document']//form/div[8]/div/button[2]
    Capture Page Screenshot
Klik Filtering Sort By Ascending We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']/div[1]/button[1]/span[.='Sort By ']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-sort']/div[@class='content-sort']/div[@class='ant-row']//input[@value='ascending']
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-sort']/div[@class='content-sort']/div[@class='ant-row']//input[@value='ascending']
    Capture Page Screenshot
Klik Filtering Sort By Descending We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']/div[1]/button[1]/span[.='Sort By ']
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-sort']/div[@class='content-sort']/div[@class='ant-row']//input[@value='descending']
    Capture Page Screenshot
Klik Filtering Sort By Latest We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']/div[1]/button[1]/span[.='Sort By ']
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-sort']/div[@class='content-sort']/div[@class='ant-row']//input[@value='latest']
    Capture Page Screenshot
Klik Filtering Sort By Oldest We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']/div[1]/button[1]/span[.='Sort By ']
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-sort']/div[@class='content-sort']/div[@class='ant-row']//input[@value='oldest']
    Capture Page Screenshot
Klik Button Apply Filtering We Konnek
    SeleniumLibrary.Click Element    xpath=//button[@type='button']/span[.='Apply']
    Capture Page Screenshot

#Masih Isu Filtering Limit Company
Klik Button Filter Limit We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='root']/div[@class='h-100']//div[@class='ant-row h-100']//div[@class='ant-row section-filter']/div[1]/button[2]
    Capture Page Screenshot
Select Date Filtering Data Create Date
    ${random_number2}    Evaluate    random.randint(1, 15)
    # SeleniumLibrary.Press Keys    xpath=/html//input[@id='start_date']   CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=//input[@id='start_date']    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=//input[@id='start_date']    ENTER
    Capture Page Screenshot
Select To Date Filtering Data Create Date
    # SeleniumLibrary.Click Element    xpath=/html//input[@id='end_period']
    ${random_number2}    Evaluate    random.randint(16, 30)
    # SeleniumLibrary.Press Keys    xpath=/html//input[@id='end_period']    CTRL+a    BACKSPACE
    SeleniumLibrary.Input Text    xpath=/html//input[@id='end_date']    ${random_number2}
    SeleniumLibrary.Press Keys    xpath=/html//input[@id='end_date']    ENTER
    Capture Page Screenshot
Input Filtering User Limit We Konnek
    ${random_number2}    Evaluate    random.randint(100, 1000)
    SeleniumLibrary.Input Text    xpath=/html//input[@id='limit_user_from']    ${random_number2}
    SeleniumLibrary.Input Text    xpath=/html//input[@id='limit_user_to']      ${random_number2}
    Capture Page Screenshot
Klik Filtering Status Active Company We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-filter']/div[@class='content-filter']/div[3]//input[@value='true']
    Capture Page Screenshot
Klik Button Apply Filtering User Limit
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='wrapper-filter']//button[@type='button']
    Capture Page Screenshot
#Menu User Masih Isu

#Menu Agent SPV
Reload Page Menu
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[1]/ul[@role='menu']/li[1]//a[@href='/dashboard/summary']
    WHILE    ${Reload} != ${TRUE}
        Sleep    1
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='root']//div[@class='ant-layout-sider-children']/ul[@role='menu']/li[1]/ul[@role='menu']/li[1]//a[@href='/dashboard/summary']
    END
Klik Menu Agents We Konnek    
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//aside[@class='ant-layout-sider ant-layout-sider-dark']/div/ul[@role='menu']/li[3]//a[@href='/setting/availabilty_agent']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=//div[@id='yield']/section[@class='ant-layout']/section//div[@role='tablist']/div[1]/a[@role='tab']
    WHILE    ${Reload} != ${TRUE}
        Sleep    1
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@role='tablist']/div[1]/a[@role='tab']
    END
    SeleniumLibrary.Page Should Contain    Total Agents :
    Sleep    0.2
    Capture Page Screenshot
#Menu Performance Agent
Klik Menu Hove Performance Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[2]/a[@role='tab']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[@class='container-fluid']/div[@class='row']/div[2]/button[1]
    Capture Page Screenshot
Klik 7 Days Performance Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[@class='container-fluid']/div[@class='row']/div[2]/button[1]
    Capture Page Screenshot
Klik 30 Days Performance Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[@class='container-fluid']/div[@class='row']/div[2]/button[2]
    Capture Page Screenshot
Select Date From Performmance Agent We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div/div[@class='container-fluid']/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    ${random_number2}    Evaluate    random.randint(1, 15)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div/div[@class='container-fluid']/div[@class='row']/div[1]/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}    RETURN
    Capture Page Screenshot
Select Date To Performance Agent We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div/div[@class='container-fluid']/div[@class='row']/div[1]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    ${random_number2}    Evaluate    random.randint(16, 30)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div/div[@class='container-fluid']/div[@class='row']/div[1]/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}    RETURN
    Capture Page Screenshot
Klik Button Apply Performance Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[@class='container-fluid']/div[@class='row']/div[1]/button[@type='primary']
    Capture Page Screenshot
Input Pencarian Agents We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='container-fluid']//input[@name='search_agent']    r+a+b+i+l_a+g+e+n+t
    Sleep    0.3
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='container-fluid']//input[@name='search_agent']    CTRL+a    BACKSPACE
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='container-fluid']//input[@name='search_agent']    r+a+b+i+l_a+g+e+n+t
    SeleniumLibrary.Wait Until Element Contains    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[@class='container-fluid']/div[@class='row']//div[@class='col-lg-8 col-md-12']/p[@class='title-user']    rabil
    Capture Page Screenshot
Klik Button Filter Status Agents We Konnek
    Sleep    0.2
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']/img[@alt='image-filter']
    Capture Page Screenshot
Pilih Status Available Agents We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='content-sort']/div[@class='container']/div[@class='row']//input[@value='available']
    Capture Page Screenshot
Klik Button Apply Status Agents We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div//button[@class='btn btn-apply']
    Capture Page Screenshot
#Role Agent
Klik Filtering Channel Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='align-items-center d-flex mb-4']/button[2]/img[@alt='image-filter']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html/body/div[2]/div/div/div[@class='content-filter']/div[@class='container']//label[@class='ant-checkbox-wrapper']/span[@class='ant-checkbox']/input[@class='ant-checkbox-input']
    Capture Page Screenshot
Klik Button Togle ON/OFF Status Unavailible Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@role='switch']
    SeleniumLibrary.Click Element    xpath=/html//input[@id='rc_select_0']
    SeleniumLibrary.Click Element    xpath=//body/div[3]/div/div//div[@class='rc-virtual-list']/div[@class='rc-virtual-list-holder']//div[@class='rc-virtual-list-holder-inner']/div[@title='Pulang']/div[@class='ant-select-item-option-content']
    Capture Page Screenshot
Klik Button Yes Confirmation Reason Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Yes']
    Capture Page Screenshot
Klik Checkmark Status Channel Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=/html/body/div[2]/div/div/div[@class='content-filter']/div[@class='container']//label[@class='ant-checkbox-wrapper']/span[@class='ant-checkbox']/input[@class='ant-checkbox-input']
    Capture Page Screenshot
Klik Button Apply Filtering Channel Role Agent We Konnek
    SeleniumLibrary.Click Element    xpath=//button[@class='btn btn-apply']
    Capture Page Screenshot
#Menu CSAT
Klik Menu CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='root']//aside[@class='ant-layout-sider ant-layout-sider-dark']/div/ul[@role='menu']/li[5]//a[@href='/csat']
    ${Reload}=  Run Keyword And Return Status  Page Should Contain Element   xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='wrapper-card-dashboard']/div[1]/div[@class='row']/div[1]/div[@role='tablist']/div[2]/a[@role='tab']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='wrapper-card-dashboard']/div[1]/div[@class='row']/div[1]/div[@role='tablist']/div[2]/a[@role='tab']
    END
    Capture Page Screenshot
    # SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main/div[@class='wrapper-card-dashboard']//div[@role='tablist']/div[1]/a[@role='tab']
Refresh Page CSAT 
     ${Reload}=  Run Keyword And Return Status  Page Should Contain Element   xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[1]/a[@role='tab']
    WHILE    ${Reload} != ${TRUE}
        ${Reload}=  Run Keyword And Return Status  Page Should Contain Element  xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@role='tablist']/div[1]/a[@role='tab']
    END
    Capture Page Screenshot
Klik Button Move Row Down Topics We Konnek 
    SeleniumLibrary.Click Element    xpath=//table[@id='table']/tr/tr[2]/td[7]//button[@title='Move row position down']/i[@class='fa fa-caret-down']
    Capture Page Screenshot
Klik Button Save Sorting Topics We Konnek 
    SeleniumLibrary.click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//button[@type='primary']
    Capture Page Screenshot
Klik Tab Inactive Topic CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='py-3 wrapper-chat-division']/div[1]/div[@class='col']/div[@role='tablist']/div[2]/a[@role='tab']
    Capture Page Screenshot
Klik Hover Topic CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=//div[@id='yield']/section[@class='ant-layout']/section/main/div[@class='wrapper-card-dashboard']//div[@role='tablist']/div[2]/a[@role='tab']
    SeleniumLibrary.Page Should Contain    CSAT
    Capture Page Screenshot
Klik Button Togle ON/OFF Status Inactive Topics CSAT We Konnek 
    SeleniumLibrary.Click Element    xpath=//table[@id='table']/tr/tr[2]/td[5]//button[@role='switch']/div[@class='ant-switch-handle']
    Capture Page Screenshot
Klik Button Togle ON/OFF Status Topics CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//table[@id='table']/tr/tr[2]/td[5]//button[@role='switch']
    Capture Page Screenshot
Klik Button Yes Confirmation Togle ON/OFF Status Topics CSAT We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Yes']
    Capture Page Screenshot
Klik Button Add New Topics CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//a[@href='/csat/new']
    Capture Page Screenshot
Input Title Topics CSAT We Konnek
    ${random_number2}    Evaluate    random.randint(1, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@class='row row-cols-lg-4']/div[@type='flex']/div/span/input[@name='namaTopik']    topics_qa${random_number2}
    Capture Page Screenshot
Klik Button Channel Topics CSAT We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[2]/div[@class='row']/div/div[@class='card card-shadow']/div[@class='card-body']/div[2]//button[@title='None selected']
    Capture Page Screenshot
Klik Checkmark Channel WA Topics CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[2]//div[@class='card-body']/div[2]//div[@class='btn-group show']/ul[2]//input[@value='whatsapp']
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[2]/div[@class='row']/div/div[@class='card card-shadow']/div[@class='card-body']/div[2]//button[@title='Whatsapp']/span[.='Whatsapp']
    Capture Page Screenshot
Klik Button Next Topics CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[2]//div[@class='card-body']/div[@type='flex']//button[@class='btn btn-apply btn-sm']
    Capture Page Screenshot
Input Question Topics CSAT We Konnek
    ${random_number2}    Evaluate    random.randint(1, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[3]/div[1]/div/div/div[@class='card card-shadow']/div[@class='card-body']/div[@class='row']/div[1]//input[@name='question']    question_qa${random_number2}
    Capture Page Screenshot
Input Positive Response Question CSAT We Konnek
    ${random_number2}    Evaluate    random.randint(1, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='multiplechoice']/div[1]/div[@type='flex']//input[@name='items']    positive_resp_qa${random_number2}
    Capture Page Screenshot
Input Neutral Response Question CSAT We Konnek
    ${random_number2}    Evaluate    random.randint(1, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='multiplechoice']/div[2]/div[@type='flex']//input[@name='items']    neutral_resp_qa${random_number2}
    Capture Page Screenshot
Input Negative Response Question CSAT We Konnek
    ${random_number2}    Evaluate    random.randint(1, 1000)
    SeleniumLibrary.Input Text    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='multiplechoice']/div[3]/div[@type='flex']//input[@name='items']    negative_resp_qa${random_number2}
    Capture Page Screenshot
Klik Button Add New Option Response CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div[3]//a[.='Add Option']
    Capture Page Screenshot
Klik Button Save Topics CSAT We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='row row-cols-lg-2']/div[2]//button[@class='btn btn-apply btn-sm']
    Capture Page Screenshot
Klik Button Yes Confirmation Save Topics CSAT We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@class='ant-modal-root']/div[2]/div[@role='dialog']//div[@class='ant-modal-footer']/button[2]/span[.='Yes']
    Capture Page Screenshot

# Menu Agent - History 
Klik Hover History Agents We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section//div[@role='tablist']/div[3]/a[@role='tab']
    SeleniumLibrary.Wait Until Page Contains Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='container-fluid']/div[1]/div/div[@role='tablist']/div[3]/div/div/div[@role='tablist']/div[1]/a[@role='tab']
    Capture Page Screenshot
Select Date Period From Request Agents We Konnek
    ${random_number2}    Evaluate    random.randint(1, 15)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input   CTRL+a    BACKSPACE
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input   ${random_number2}    RETURN
    Capture Page Screenshot
Select To Date Period From Request Agents We Konnek
    ${random_number2}    Evaluate    random.randint(16, 30)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input   CTRL+a    BACKSPACE
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input   ${random_number2}    RETURN
    Capture Page Screenshot
Klik Button Submit History Request Agents We Konnek
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='container-fluid']/div[2]/div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Input Pencarian Nama History Agents We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='mt-4 row']/div[1]/div[2]/div[1]/span/input    r+a+b+i+l_a+g+e+n
    Capture Page Screenshot
Klik Button Dropdown Agent Name History Agents We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[3]/div/div[@class='ant-select-selector']/span[@title='All']
    Capture Page Screenshot
Klik Button Dropdown Reason History Agents We Konnek 
    # SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[4]/div/div[@class='ant-select-selector']/span[@title='All']
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[4]/div/div[@class='ant-select-selector']/span[@title='All']    ALT+ARROW_DOWN    RETURN
    Capture Page Screenshot
Klik Button Dropdown Type History Agents We Konnek 
    SeleniumLibrary.Press Keys       xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[5]/div/div[@class='ant-select-selector']/span[@title='All']    ALT+ARROW_DOWN    RETURN
    Capture Page Screenshot
Klik Button Download History Agents We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='container-fluid']/div[2]/div[@class='row']/div[3]/button[2]
    Capture Page Screenshot
Klik Tab Availability Agents We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='container-fluid']/div[1]/div/div[@role='tablist']/div[3]/div/div/div[@role='tablist']/div[2]/a[@role='tab']
    Capture Page Screenshot
Select Date Period From Availability Agents We Konnek 
    ${random_number2}    Evaluate    random.randint(1, 15)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[1]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}    RETURN
    Capture Page Screenshot
Select To Date Period Availability Agents We Konnek
    ${random_number2}    Evaluate    random.randint(16, 30)
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    CTRL+a    BACKSPACE
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[2]/div[@class='react-datepicker-wrapper']/div[@class='react-datepicker__input-container']/input    ${random_number2}    RETURN
    Capture Page Screenshot
Klik Button Submit Availability Agents We Konnek 
    SeleniumLibrary.Click Element    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='container-fluid']/div[2]/div[@class='row']/div[3]/button[1]
    Capture Page Screenshot
Klik Button Dropdown Agent Name Availability We Konnek 
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']//span[@title='All']    ALT+ARROW_DOWN
    Capture Page Screenshot
Input Minimum Availability Duration We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[4]/div[@class='col']/div[1]/div[@class='ant-picker-input']/input    00:00:01    RETURN
    Capture Page Screenshot
Input Maximum Availability Duration We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[4]/div[@class='col']/div[2]/div[@class='ant-picker-input']/input   23:59:01    RETURN
    Capture Page Screenshot
Input Minimum Unavailibility Duration We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[5]/div[@class='col']/div[1]/div[@class='ant-picker-input']/input    00:00:01    RETURN
    Capture Page Screenshot
Input Maximum Unavailibility Duration We Konnek
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']/div/div[@class='container-fluid']/div[2]/div[@class='row']/div[2]/div[@class='row']/div[5]/div[@class='col']/div[2]/div[@class='ant-picker-input']/input    23:59:00    RETURN
    Capture Page Screenshot
Input Pencarian Availability Agent We Konnek 
    SeleniumLibrary.Press Keys    xpath=/html//div[@id='yield']/section[@class='ant-layout']/section/main[@class='ant-layout-content site-layout-background']//div[@class='mt-4 row']/div[1]/div[2]/div[1]/span/input    a+g+e+n+t_r+a+b+i+l    RETURN
    Capture Page Screenshot
#User Chat
Open Browser ChatBot Telegram
    SeleniumLibrary.Open Browser     browserchrome    options=add_argument("--user-data-dir=${profile_path}")
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Go To    ${url_chat_telegram}
    ${cookie_value}    Get Cookie   SESSION