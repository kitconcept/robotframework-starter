*** Settings ***

Library         SeleniumLibrary  timeout=10  implicit_wait=0
Resource        functions/FunctionsGlobal.txt
Test Teardown   Close Browser


*** Test Cases ***

Scenario: Geokrety Welcome page (EN)
  !Go To GeoKrety
  Wait Until Page Contains  Welcome
  Should Show Welcome Geokrety
  Should Show News
  Should Show RecentLogs



*** Keywords ***

Should Show Welcome Geokrety
  Page should contain  Welcome to GeoKrety.org!
Should Show News
  Page should contain  News
  Page should contain  Comments
Should Show RecentLogs
  Page should contain  Recent logs
  Page should contain  Recent logs on the map
