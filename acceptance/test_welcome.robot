*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0

Test Setup      Test Setup
Test Teardown   Close Browser


*** Test Cases ***

Scenario: Should Show Geokrety English Welcome page
  Go To  https://rec.geokrety.org
  Wait Until Page Contains  Welcome
  Should Show Welcome Geokrety
  Should Show News
  Should Show RecentLogs



*** Keywords ***

Test Setup
  Open browser  browser=headlesschrome  url=https://google.com
Should Show Welcome Geokrety
  Page should contain  Welcome to GeoKrety.org!
Should Show News
  Page should contain  News
  Page should contain  Comments
Should Show RecentLogs
  Page should contain  Recent logs
  Page should contain  Recent logs on the map
