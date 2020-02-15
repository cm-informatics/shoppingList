# Setup javascript Automation Testing for Android and IOS

## Prerequisites
- git
- Nodejs
- yarn

* All Tests are written with wd Package dependecies

> **Check it by entering `git -v` or `node -v` or `yarn -v`**

## 1. Step: GIT Clone
Please clone the project from [OnSiteTestAutomationJS](https://gitlab.hce.heidelbergcement.com/HCEmbrace/onsitetestautomationjs)

## 2: Installation of dependencies
```yarn install```

* at the root of the project

## 3: Run Appium and Android Simulator from docker container 
```docker-compose up```

* at the root of the project

## 4: run tests
```yarn test:cu```


> **Do not override the apk files if not intended**
