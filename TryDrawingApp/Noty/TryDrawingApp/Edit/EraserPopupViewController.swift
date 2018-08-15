//
//  EraserPopupViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD20 on 2018. 8. 9..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit


protocol EraserPopupVCDelegate:class {
    func eraserPopupViewControllerDidFinish (_ eraserPopupVC:EraserPopupViewController)
}


class EraserPopupViewController: UIViewController {

    @IBOutlet var eraserSlider: UISlider!
    
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    
    var delegate:EraserPopupVCDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.view.layer.cornerRadius = 10
        self.preferredContentSize = CGSize(width: 250, height: 200)
        
        // Do any additional setup after loading the view.
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
    
    @IBAction func doneEraseButton(_ sender: Any) {
        if delegate != nil {
            delegate?.eraserPopupViewControllerDidFinish(self)
        }
        
        self.dismiss(animated: true, completion: nil)
    }


}
