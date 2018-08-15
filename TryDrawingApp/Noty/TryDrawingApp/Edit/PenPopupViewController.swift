//
//  PenPopupViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD20 on 2018. 8. 9..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit


protocol PenPopupVCDelegate:class {
    func penPopupViewControllerDidFinish (_ penPopupVC:PenPopupViewController)
}


class PenPopupViewController: UIViewController {


    @IBOutlet var imageView: UIImageView!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var opacityLabel: UILabel!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var pencilSize:CGFloat = 5.0
    var pencilOpac:CGFloat = 1.0
    
    var delegate:PenPopupVCDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawPreview(red: red, green: green, blue: blue)
        
        redSlider.value = Float(red)
        redLabel.text = String(Int(redSlider.value * 255))
        
        greenSlider.value = Float(green)
        greenLabel.text = String(Int(greenSlider.value * 255))
        
        blueSlider.value = Float(blue)
        blueLabel.text = String(Int(blueSlider.value * 255))

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        self.view.layer.cornerRadius = 10
        
        self.preferredContentSize = CGSize(width: 336, height: 485)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func colorsPicked(_ sender: AnyObject) {
        if sender.tag == 0 {
            (red,green,blue) = (1,0,0)
        } else if sender.tag == 1 {
            (red,green,blue) = (0,1,0)
        } else if sender.tag == 2 {
            (red,green,blue) = (0,0,1)
        } else if sender.tag == 3 {
            (red,green,blue) = (1,0,1)
        } else if sender.tag == 4 {
            (red,green,blue) = (1,1,0)
        } else if sender.tag == 5 {
            (red,green,blue) = (0,1,1)
        } else if sender.tag == 6 {
            (red,green,blue) = (1,1,1)
        } else if sender.tag == 7 {
            (red,green,blue) = (0,0,0)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
 
    

    @IBAction func pensizeChanged(_ sender: Any) {
        let slider = sender as! UISlider
        pencilSize = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
    }
    
    @IBAction func opacityChanged(_ sender: Any) {
        let slider = sender as! UISlider
        pencilOpac = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
    }
    
    @IBAction func redSliderChanged(_ sender: Any) {
        let slider = sender as! UISlider
        red = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        redLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func greenSliderChanged(_ sender: Any) {
        
        let slider = sender as! UISlider
        green = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        greenLabel.text = "\(Int(slider.value * 255))"
    }
    
    @IBAction func blueSliderChanged(_ sender: Any) {
        
        let slider = sender as! UISlider
        blue = CGFloat(slider.value)
        drawPreview(red: red, green: green, blue: blue)
        blueLabel.text = "\(Int(slider.value * 255))"
    }
    
    //펜팝업창에서 설정한 크기와 색상 등을 확인할 수 있는 이미지
    func drawPreview(red:CGFloat, green:CGFloat, blue:CGFloat) {
        imageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        UIGraphicsBeginImageContext(imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: pencilOpac).cgColor)
        context?.setLineWidth(pencilSize)
        context?.setLineCap(CGLineCap.round)
        
        context?.move(to: CGPoint(x:70, y:70))
        context?.addLine(to: CGPoint(x: 7, y: 70))
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    
    @IBAction func clickDoneButton(_ sender: Any) {
        if delegate != nil {
            delegate?.penPopupViewControllerDidFinish(self)
        }
        
        self.dismiss(animated: true, completion: nil)
    }


}
