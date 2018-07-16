//
//  nowtime.swift
//  unknw
//
//  Created by Dangerousmagma on 2018/07/01.
//  Copyright © 2018年 sanda-genki. All rights reserved.
//

import Foundation

class Utility {
    // 現在時刻を"yyyy/MM/dd HH:mm:ss"のString型で返すクラスメソッド
    class func nowTimeGet() -> String {
        // 現在時刻を取得
        let now = NSDate()
        let formatter = DateFormatter()
        // 好きなフォーマットを設定する
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let str = formatter.string(from: now as Date)
        return str
    }
}
