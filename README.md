# Setup javascript Automation Testing for Android and IOS

## Prerequisites
- Homebrew
- git
- Nodejs
- react-native
- yarn
- cucumber
- Appium Server
- Android Studio
- IDE (e.g. VSCode)

### Optional
- Appium Desktop

### Please note: All Tests are written with wd Package dependecies

> **Check the version by entering `git -version` or `node -v` or `yarn -v` or `appium -v`**

# Installation Guideline
### For macOS

## 1. Step: Install Homebrew
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## 2. Step: Install git
#### Git is pre-installed on most macOS systems
`brew install git`

## 3. Step: Install Node JS
`brew install node`

## 4. Step: Install react-native
`npm install -g react-native-cli`

## 5. Step: Install yarn
`brew install yarn`

## 6. Step: Install cucumber
`npm install cucumber`

## 7. Step: Install Appium
Appium can be installed in one of two ways: via NPM or by downloading Appium Desktop, which is a graphical, desktop-based way to launch the Appium server.

Appium server: `npm install -g appium`

## 8. Step: Install Android Studio
Visit: https://developer.android.com/studio/

## 9. Step: Install VSCode
Visit: https://code.visualstudio.com/docs/setup/mac


# Setup Guide

## 1. Step: GIT Clone
Please clone the project from [OnSiteTestAutomationJS](https://gitlab.hce.heidelbergcement.com/HCEmbrace/onsitetestautomationjs)

## 2. Installation of dependencies
```yarn install```

* at the root of the project folder

## 3. Run Appium and Android Simulator from docker container 

#### Start appium server
* Open a terminal and type `appium`

#### Start Android Simulator
* Open Android Studio, create a device, and run it.

### When using a docker image
```docker-compose up```

* at the root of the project folder

## 4: run tests
```yarn test:cu```


> **Do not override the apk files if not intended**
