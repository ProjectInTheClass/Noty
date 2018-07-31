//
//  ViewController.swift
//  grim
//
//  Created by CAUAD19 on 2018. 7. 30..
//  Copyright © 2018년 CAUAD19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //스케치 관련 변수 선언
    var lastPoint : CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor //선의 색상
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //클리어 클릭 했을 때
    
    
    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    
    // --- 터치와 관련된 부모 클래스 오버라이드 후 재정의 하기 --
    //터치가 시작될 때 호출이 된다.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first! as UITouch   //현재 발생한 이벤트를 가지고 옵니다.
        lastPoint = touch.location(in: imgView)  //터치된 위치를 lastPoint라는 변수에 저장한다.
        
    }
    
    //터치된 손가락이 움직였을 때 호출 된다.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) // 라인의 끝모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        
        let touch = touches.first! as UITouch   //현재발생한 터치 이벤트를 가지고 온다.
        let currPoint = touch.location(in: imgView) //터치된 위치를 currPoint로 가지고 온다.
        
        //현재 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그린다.
        imgView.image?.draw(in: CGRect(x:0, y:0, width: imgView.frame.size.width, height:imgView.frame.size.height))
        
        //이전에 이동위치인 lastPoint로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        //lastPoint에서 현재 위치인 currPoint까지 선을 추가한다.
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x:currPoint.x, y:currPoint.y))
        
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //현재 터치된 위치를 lastPoint라는 변수에 할당
        lastPoint = currPoint
        
    }
    
    //화면에서 손가락이 떼었을 때 호출
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) // 라인의 끝모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        //현재 이미지 뷰에 있는 이미지를 이미지 뷰의 크기로 그린다.
        imgView.image?.draw(in: CGRect(x:0, y:0, width: imgView.frame.size.width, height:imgView.frame.size.height))
        
        //이전에 이동위치인 lastPoint로 시작 위치를 이동시킨다.
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x:lastPoint.x, y:lastPoint.y))
        
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    //사용자가 기기를 흔들었을 때 이미지 뷰 위에 그렸던 스케치가 지워지도록
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            imgView.image = nil
        }
    }
    
    
}

