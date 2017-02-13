# GameCenterInSwift

## 使用源由
  1. 練習在swift使用GameCenter
  2. 因為Unity似乎沒有提供在iCloud儲存遊戲進度的功能，所以只能自己寫了

---

## 功能解說
  - ![Imgur](http://i.imgur.com/P01QNc8.png)
  - name和money是玩家資料用來測試儲存的資料
  - AddMoney功能是讓玩家money數值變動，方便觀察數值變化
  - Login 登入GameCenter功能，所有功能都要在登入GameCenter之後才能使用
  - Save 把玩家資料存到iCloud
  - Load 把玩家資料從iCloud取出
  - Delete 把存在iCloud上的儲存資料刪除

---

## Xcode 設定
  - 開啟新專案 選擇Single View Application
    - ![Imgur](http://i.imgur.com/3zCiWmg.png)
  - 到"Capabilities"把iCloud和Game Center開啟 iCloud要把"key-value storage"和"iCoud Documents"打勾
    - ![Imgur](http://i.imgur.com/CmQPAvg.png)
  - 設定完"Capabilities"後會在資料夾發現"[專案名稱].entitlements"，之後Unity要接GameCenter的iCloud的時候也會需要這個檔案
    - ![Imgur](http://i.imgur.com/qRPD6fg.png)
  - Info.plist的資訊也不用動，不過要注意Required device capabilities底下的兩個Item:"armv7"和"gamekit"，之後再Unity設定也會用到
    - ![Imgur](http://i.imgur.com/gnGXzbS.png)
