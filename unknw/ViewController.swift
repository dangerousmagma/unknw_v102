//
//  ViewController.swift
//  unknw
//
//  Created by Dangerousmagma on 2018/07/01.
//  Copyright © 2018年 sanda-genki. All rights reserved.
//

import UIKit

let tkn:String = "xo2064-c2d792767449b97348ea5f52b346cb8f" //トークン
let hook:String = "https://hooks.slack.com/services/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"//ボットチャンネル

var ch:String = "うんこなうpostテスト"
var usr:String = "うんこなうbot"


//UI描画
class ViewController: UIViewController {
    @IBAction func mytap(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    //イメージセレクター
    @IBOutlet weak var imgchr: UIImageView!
    @IBOutlet weak var imgsel: UIPickerView!
    @IBOutlet weak var chrsel: UITextField!
    
    private var datasouce = ["まさる","たけし","アリヲ","雷"]
    
    @IBOutlet weak var postprogress: UIProgressView!
    
    //投稿ボタン処理
    @IBAction func slackpost(_ sender: UIButton) {
        
        //投稿内容の構築
        let posttime = Utility.nowTimeGet() //時間の取得
        let posttxt:String = ":うんこなう:うんこなうてすと"//本文
        let postall:String = "\(posttime)\n\(posttxt)"//投稿内容の整形
        //投稿準備
        //        let chrselString = ""
        let chrselString:String = chrsel.text!
        let payload:String = "payload={\"channel\":\"#\(ch)\",\"username\": \"\(chrselString)\",\"text\": \"\(postall)\"}" //slackのコマンドpayload
        let data = payload.data(using: .utf8)!
        //投稿
        if let url = NSURL(string:hook)
        {
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.httpBody = data
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest){
                (data, response, error) -> Void in
                if error != nil {
                    print("error")
                }
                else if data != nil {
                    if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                        print("\(str)")
                    }
                    else {
                        print("error")
                    }
                }
            }
            task.resume()
        }
        else {
            print("url invalid")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //detaSouceとdelegateの設定
        imgsel.dataSource = self
        imgsel.delegate = self

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//PickerView処理
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //選択個数
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datasouce.count //並べるリストの数
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //実行
        if datasouce[row] == "まさる" {
            let myimg = UIImage(named: "masaru.jpg")
            imgchr.image = myimg
        }
        else if datasouce[row] == "たけし" {
            let myimg = UIImage(named: "takeshi.jpg")
            imgchr.image = myimg
        }
        else if datasouce[row] == "アリヲ" {
            let myimg = UIImage(named: "arioka.jpg")
            imgchr.image = myimg
        }
        else if datasouce[row] == "雷" {
            let myimg = UIImage(named: "rai.jpg")
            imgchr.image = myimg
        }
        else {
            //特に処理なし
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datasouce[row]
    }
    
    
}

