*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0

Test Setup      Test Setup
Test Teardown   Close Browser


*** Test Cases ***

Scenario: Open Headless Browser
  Go To  https://google.com
  Wait until page contains  Google
  Page should contain  Google


*** Keywords ***

Test Setup
  Open browser  browser=headlesschrome  url=https://google.com
