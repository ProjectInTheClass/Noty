//
//  StickerPopupViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD20 on 2018. 8. 9..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit

class StickerPopupViewController: UIViewController {
    
    var stickerPackArray:[UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.view.layer.cornerRadius = 10
        self.preferredContentSize = CGSize(width: 345, height: 400)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //버튼 함수를 만든 다음
    //
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeStickerPopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
