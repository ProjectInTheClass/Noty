//
//  PopoverViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD19 on 2018. 8. 13..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit


class PopoverViewController: UIViewController {
    
    @IBOutlet weak var inputDiaryName: UITextField!
    @IBOutlet var pickCoverButton: UIButton!
    
    
    var delegate: MainCollectionViewController?
    
    var selectedDiary:[Diary]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickCoverButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickPickBtn(_ sender: Any) {
        
        diaryData.append(Diary(name: "나의 다이어리", coverImage: UIImage(named: "cover05")))
        self.dismiss(animated: true, completion: nil)
    }
    

}
