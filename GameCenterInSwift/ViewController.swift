//
//  ViewController.swift
//  GameCenterInSwift
//
//  Created by nasa8f on 2017/2/10.
//  Copyright © 2017年 nasa8f. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Name: UILabel!

    @IBOutlet weak var Money: UILabel!
    
    private var mPlayer = PlayerData(name: "Roger", money: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Name.text = mPlayer.Name
        Money.text = mPlayer.Money
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnAddMoney() {
        mPlayer.AddMoney(100)
        Money.text = mPlayer.Money
    }
    
    @IBAction func OnLogin() {
        GameCenterManager.Login()
    }
    
    @IBAction func OnSave() {
        let any: Any = mPlayer.toJson()
        print(any)
        let jsondata = try? JSONSerialization.data(withJSONObject: any, options: [])
        guard let jsonstring = jsondata?.base64EncodedString() else {
            return
        }
        GameCenterManager.Save(saveData: jsonstring)
    }

    @IBAction func OnLoad() {
        GameCenterManager.Load(succeed: loadSucceed, failed: loadFailed)
    }
    
    @IBAction func OnDelete() {
        GameCenterManager.Delete()
    }
    
    func loadSucceed(dataString: String) {
        guard let decodeData = Data(base64Encoded: dataString, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            print("Error: decode failed.")
            return
        }
        
        print("decode data: \(decodeData)")
        
        do{
            let dejson = try JSONSerialization.jsonObject(with: decodeData)
            let dic = dejson as! Dictionary<String, Any>
            self.mPlayer.fromJson(json: dic)
            self.Money.text = self.mPlayer.Money
        }
        catch {
            print("Deserialization error message: \(error.localizedDescription)")
        }
        
        
    }
    
    func loadFailed(error: String) {
        print("Error Msg: \(error)")
    }

}

