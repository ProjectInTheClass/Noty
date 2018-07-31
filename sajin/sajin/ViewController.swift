

//카메라 포토 라이브러리를 사용하기 위해서 imagePickerController와
//이 컨트롤러를 사용하기 위한 델리게이트 프로토콜이 필요하다.
//그리고 미디어 타입이 정의된 헤더 파일이 있어야 한다.

//import는 다른 파일이나 클래스를 추가하는 역할(이미 만들어진 객체를 사용하기 위해서 import 해줘야 한다.)
import UIKit
import  MobileCoreServices //다양한 타입들을 정의해 놓은 헤더 파일


class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    //인스턴스 변수 생성
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    //촬영하거나 포토라이브러리에서 불러온 이미지 저장하는 변수
    var captureImage: UIImage!
  
    //이미지 저장 여부를 나타낼 변수
    var flagImageSave = false
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    //사용자가 저장하지 않고 취소할 때
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //이때는 다시 처음의 뷰 상태로 돌아가야 하므로 현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰를 보여줘야 한다
        self.dismiss(animated: true, completion: nil)
    }
    
    // 사진이나 비디오 촬영을 하거나 포토 라이브러리에서 선택이 끝났을 때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //미디어 종류 확인
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        
        //미디어 종류가 사진일 경우
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            
            //사진을 가져와 captureimage에 저장
            captureImage =  info[UIImagePickerControllerOriginalImage] as! UIImage
            
            //flagImageSave가 참이면 가져온 사진을 포토 라이브러리에 저장 한다.
            if flagImageSave {
                
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
            
            //미디어 종류가 비디오일 경우
        }else if mediaType.isEqual(to: kUTTypeMovie as NSString as String){
            
          
            
        }
        //현재의 뷰 컨트롤러 제거. 즉, 뷰에서 이미지 피커 화면을 제거하여 초기 뷰를 보여준다.
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //경고 표시용 메서드 작성하기
    func myAlert(_ title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let action=UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //사진촬영 버튼
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        
        //카메라의 사용가능 여부를 확인
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            //이미지 저장 허용
            flagImageSave = true
            
            imagePicker.delegate = self
            //이미지 피커의 소스 타입을 camera로 설정
            imagePicker.sourceType = .camera
            //미디어 타입설정
            imagePicker.mediaTypes = [kUTTypeImage as String]
            //편집 사용 안함
            imagePicker.allowsEditing = false
            //뷰 컨트롤러를 imagePicker로 대채
            present(imagePicker,animated: true, completion: nil)
        }else{
            
            myAlert("camera inaccessable", message: "application cannot access the camera.")
            
        }
        
    }
    
    //사진불러오기 버튼
    @IBAction func btnLoadImageFromLibray(_ sender: UIButton) {
        
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            
            flagImageSave = false
            
            imagePicker.delegate = self
            
            imagePicker.sourceType = .photoLibrary
            
            imagePicker.mediaTypes = [kUTTypeImage as String]
            
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
            
            
        }else{
            
            myAlert("photo album inaccessable", message: "application cannot access the photo album")
            
        }
        
    }
}
