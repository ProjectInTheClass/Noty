//
//  CalendarViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD20 on 2018. 8. 15..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet var calendarImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.view.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        self.preferredContentSize = CGSize(width: 300, height: 440)
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
