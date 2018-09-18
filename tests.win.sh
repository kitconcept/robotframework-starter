#!/bin/bash
# Windows way to execute robot framework test
# assume python/pip is already installed

# config
CHROMEDRIVER_FILE=chromedriver_win32.zip
CHROMEDRIVER_BIN=chromedriver.exe
REQUIREMENT_CHECK=.requirements_checked

if [ -f ${REQUIREMENT_CHECK} ]; then
  echo " * Requirement OK (remove ${REQUIREMENT_CHECK} to enforce check step)"
else
  echo " * Requirement Chromedriver"
  if [ ! -f ${CHROMEDRIVER_FILE} ]; then
    echo "Download $CHROMEDRIVER_FILE"
    curl https://chromedriver.storage.googleapis.com/2.42/chromedriver_win32.zip --output chromedriver_win32.zip
    if [ ! -f ${CHROMEDRIVER_BIN} ]; then
      unzip ${CHROMEDRIVER_FILE}
    fi
  fi

  echo " * Requirement pip"
  pip install --upgrade pip
  pip -V
  pip install -r requirements.txt
  touch ${REQUIREMENT_CHECK}
fi

echo " * Execute robot framework tests"
pybot.bat acceptance/test_welcome.robot