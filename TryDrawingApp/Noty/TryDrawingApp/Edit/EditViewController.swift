//
//  ViewController.swift
//  TryDrawingApp
//
//  Created by CAUAD20 on 2018. 8. 9..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit


class EditViewController: UIViewController {

    
    //다이어리를 그리기 위한 이미지뷰(캔버스역할)
    @IBOutlet var imageView: UIImageView!
    
    //지우개 버튼, 지우개 팝업과는 별도
    @IBOutlet var eraserIcon: UIBarButtonItem!
    
    var lastPoint = CGPoint.zero
    var swiped = false
    
    //context?.setStrokeColor 설정 및 PenPopup에서 색상 선택을 위한 변수 선언
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    var pencilSize:CGFloat = 5.0
    var pencilOpac:CGFloat = 1.0
    
    //지우개툴을 위한 변수, 펜으로 쓰고 있는 상태인지 or 지우개로 지우고 있는 상태인지 구분
    var isDrawing = true
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //화면이 시작되면 펜 아이콘을 띄우고 펜으로 쓰고 있는 상태임을 알린다
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(pencilSize)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: pencilOpac).cgColor)
        
        context?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
        
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        }
        
    @IBAction func resetButton(_ sender: Any) {
        self.imageView.image = nil
    }
    
    @IBAction func saveButton(_ sender: Any) {
        //저장을 누르면 사진첩에 이미지로 저장
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    @IBAction func imageAddButton(_ sender: UIBarButtonItem) {
 
         // 이미지 추가 버튼을 누르면 Alert창을 통해 선택 사항들을 보여준다, 앨범에서의 이미지 선택 외에 어플 자체에 있는 속지 선택 기능 추가
        let actionSheet = UIAlertController(title: "속지 추가", message: "", preferredStyle: .alert)

        actionSheet.addAction(UIAlertAction(title: "이미지 선택", style: .default, handler: { (_) in
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self

            self.present(imagePicker, animated: true, completion: nil)
        } ))

        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .default, handler: nil))

        present(actionSheet, animated: true, completion: nil)
 
        
    }
    
    
    
    
    //펜, 지우개, 스티커, 테이프 팝업창
    @IBAction func showPenPopup(_ sender: Any) {
        let penPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "penPopUpID") as! PenPopupViewController
//        self.addChildViewController(penPopOverVC)
        penPopOverVC.view.frame = self.view.frame
        self.view.addSubview(penPopOverVC.view)
//        penPopOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showEraserPopup(_ sender: Any) {
        let eraserPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "eraserPopUpID") as! EraserPopupViewController
//        self.addChildViewController(eraserPopOverVC)
        eraserPopOverVC.view.frame = self.view.frame
        self.view.addSubview(eraserPopOverVC.view)
//        eraserPopOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showStickerPopup(_ sender: Any) {
        let stickerPopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "stickerPopUpID") as! StickerPopupViewController
//        self.addChildViewController(stickerPopOverVC)
        stickerPopOverVC.view.frame = self.view.frame
        self.view.addSubview(stickerPopOverVC.view)
//        stickerPopOverVC.didMove(toParentViewController: self)
    }
    
    @IBAction func showTapePopup(_ sender: Any) {
        let tapePopOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tapePopUpID") as! TapePopupViewController
//        self.addChildViewController(tapePopOverVC)
        tapePopOverVC.view.frame = self.view.frame
        self.view.addSubview(tapePopOverVC.view)
//        tapePopOverVC.didMove(toParentViewController: self)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    @IBAction func unwindToEditVC(segue:UIStoryboardSegue) {
//
//    }
    

    //지금 코드는 펜,지우개 팝업창으로 넘어가기 위한 값만 설정되있다, 펜,지우개,스티커,테이프,캘린더는 따로 설정 필요
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        //조건문으로 펜,지우개,스티커,테이프를 따로 설정해야 된다
        
        if let penPopupVC = segue.destination as? PenPopupViewController {
            penPopupVC.delegate = self
            penPopupVC.red = red
            penPopupVC.green = green
            penPopupVC.blue = blue
            penPopupVC.pencilSize = pencilSize
            penPopupVC.pencilOpac = pencilOpac
        }
        
        if let eraserPopupVC = segue.destination as? EraserPopupViewController {
            eraserPopupVC.delegate = self
        }
    }
    
    
}
 









//이미지 추가 버튼을 누르고 이미지를 선택하기 위한 Alert창, 추가와 취소 버튼이 있다, imageAddButton
extension EditViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate, PenPopupVCDelegate, EraserPopupVCDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            //여기서 우리는 유저의 이미지를 얻는다, 이미지 추가버튼으로 속지 바꾸는 역할
            self.selectedImage = imagePicked
            self.imageView.image = selectedImage
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    func penPopupViewControllerDidFinish(_ penPopupVC: PenPopupViewController) {
        self.red = penPopupVC.red
        self.green = penPopupVC.green
        self.blue = penPopupVC.blue
        self.pencilSize = penPopupVC.pencilSize
        self.pencilOpac = penPopupVC.pencilOpac
    }
    
    func eraserPopupViewControllerDidFinish(_ eraserPopupVC: EraserPopupViewController) {
     
    }
    
    
}


