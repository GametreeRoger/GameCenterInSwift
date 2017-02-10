//
//  GameCenterManager.swift
//  GameCenterInSwift
//
//  Created by nasa8f on 2017/2/10.
//  Copyright © 2017年 nasa8f. All rights reserved.
//

import Foundation

import GameKit

public class GameCenterManager {
    
    static let FILENAME = "SaveGame";
    
    public static func Login() {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(viewController : UIViewController?, error : Error?) -> Void in
            print((GKLocalPlayer.localPlayer().isAuthenticated))
        }
    }
    
    public static func Save(saveData: String) {
        print("save data: \(saveData)")
        guard let data = saveData.data(using: String.Encoding.utf8) else {
            return
        }
        
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.saveGameData(data, withName: FILENAME){
            (saveGame: GKSavedGame?, error: Error?) -> Void in
            if error != nil {
                print("Error saving: \(error)")
            } else {
                print("Save game success!")
            }
        }
    }
    
    public static func Load(succeed: @escaping (_ dataString: String) -> Void, failed: @escaping (_ error: String) -> Void) {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.fetchSavedGames() {
            (saveGames: [GKSavedGame]?, error: Error?) -> Void in
            if error != nil {
                print("fetch saving error: \(error)")
                failed("fetch saving error: \(error)")
            } else {
                print("game save lenth: \(saveGames?.count)")
                guard (saveGames?.count)! > 0 else {
                    failed("No save game data.")
                    return
                }
                let save = saveGames?.first
                save?.loadData() {
                    (data: Data?, error: Error?) -> Void in
                    if error != nil {
                        print("Error load data: \(error)")
                        failed("Error load data: \(error)")
                    } else {
                        guard let dataString = String(data: data!, encoding: .utf8) else {
                            failed("Error decode")
                            return
                        }
                        print("base64Str: \(dataString)")
                        
                        succeed(dataString)
                    }
                }
            }
        }
    }
    
    public static func Delete() {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.deleteSavedGames(withName: FILENAME) {
            (error: Error?) -> Void in
            if error != nil {
                print("Can not delete save game.")
            } else {
                print("Delete save game succeed.")
            }
        }
    }
}
