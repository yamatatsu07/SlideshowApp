//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 山崎 達也 on 2018/04/24.
//  Copyright © 2018年 tatsuya.yamasaki2. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 前の画面から渡ってきた image を imageView に表示する
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
