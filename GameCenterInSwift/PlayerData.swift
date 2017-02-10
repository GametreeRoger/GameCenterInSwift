//
//  PlayerData.swift
//  GameCenterInSwift
//
//  Created by nasa8f on 2017/2/10.
//  Copyright © 2017年 nasa8f. All rights reserved.
//

import Foundation

public class PlayerData {
    private var mName: String
    private var mMoney: Int

    init(name: String, money: Int) {
        mName = name
        mMoney = money
    }
    
    public func toJson() -> [String: Any] {
        let json = [
            "Name": mName,
            "Money": mMoney
            ] as [String : Any]
        return json
    }
    
    public func fromJson(json: Dictionary<String, Any>) {
        mName = json["Name"] as! String
        mMoney = json["Money"] as! Int
    }
    
    public var Name: String {
        return "Name: \(mName)"
    }
    
    public var Money: String {
        return "Money: \(mMoney)"
    }
    
    public func AddMoney(_ money: Int) {
        mMoney += money
    }
    
}
