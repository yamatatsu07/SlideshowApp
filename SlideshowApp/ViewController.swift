//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 山崎 達也 on 2018/04/22.
//  Copyright © 2018年 tatsuya.yamasaki2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextSlide: UIButton!
    @IBOutlet weak var backSlide: UIButton!
    @IBOutlet weak var playBack: UIButton!
    
    var image1: UIImage!
    var image2: UIImage!
    var image3: UIImage!
    var timer: Timer!
    var dispImageNo = 0
    var button: UIButton!
    
    let imageNameArray = [
        "86410136.jpg",
        "192287960.jpg",
        "105549951.jpg"
    ]
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // バンドルした画像ファイルを読み込み
        image1 = UIImage(named: "86410136.jpg")
        image2 = UIImage(named: "192287960.jpg")
        image3 = UIImage(named: "105549951.jpg")
        
        // Image Viewに画像を設定
        imageView.image = image1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextSlide(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    @IBAction func backSlide(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    
    @IBAction func playBack(_ sender: Any) {
        // 自動送りを設定
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.onTimer(timer:)), userInfo: nil, repeats: true)
            playBack.setTitle("停止", for: .normal)
            nextSlide.isEnabled = false // ボタン無効
            backSlide.isEnabled = false // ボタン無効
        } else if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil
            playBack.setTitle("再生", for: .normal)
            nextSlide.isEnabled = true // ボタン有効
            backSlide.isEnabled = true // ボタン有効
        }
        
    }
    // Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = image
    }
    
    @IBAction func onTapImage(_ sender: Any) {
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: image)
        
        self.timer.invalidate()
    }
}

