//
//  MainCollectionViewController.swift
//  Noty
//
//  Created by CAUAD20 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import UIKit

private let reuseIdentidier = "Cell"

class CollectionViewCell: UICollectionViewCell {
    
    var diaryCell:Diary? { didSet {
        self.diaryImageView?.image = diaryCell!.coverImage
        self.diaryNameLabel?.text = diaryCell!.name
        
        //평소에는 delete 버튼이 안보이게
        deleteBtn.isHidden = !isEditing
        
        }}
    
    //delete 버튼 누르면 각 셀에 삭제 버튼이 생성
    var isEditing : Bool = false{
        didSet{
         deleteBtn.isHidden = !isEditing
        }
    }

    @IBOutlet weak var diaryImageView: UIImageView?
    @IBOutlet weak var diaryNameLabel: UILabel?
    
}





class MainCollectionViewController: UICollectionViewController {

    //var diary:[Diary]
    
    @IBOutlet weak var deleteBtn: UIBarButtonItem!
    
    func dummyData() -> [Diary] {
        let diary01 = Diary(name: "2018다이어리", type:.yearlyDiary, coverImageName:"cover03")
        let diary02 = Diary(name: "7월_앱개발", type:.monthlyDiary, coverImageName:"cover01")
        let diary03 = Diary(name: "미국여행", type:.travelDiary, coverImageName:"cover04")
        let diary04 = Diary(name: "중국여행", type:.travelDiary, coverImageName:"")
        let diary05 = Diary(name: "일본여행", type:.travelDiary, coverImageName:"")
        
        return [diary01, diary02, diary03, diary04, diary05]
        
        
        //앞으로 해야할 부분 : 추가버튼 누른 후, 다이어리 종류 골라서 dummydata안에 하나씩 넣을 수 있게
        //사용자가 이름 바꿀수 있게 수정버튼 누르면 라벨에서 텍스트 입력창으로 넘어갔다가 이름 변경 후, 다시 저장
    }
    
    var diaryExample:[Diary] = []
    
    @IBAction func clickAdd(_ sender: UIBarButtonItem) {
        var diaryEx:Diary = Diary2(name: "hiEx", type: .monthlyDiary, coverImageName: "cover02")
        
        diaryExample.append(diaryEx)
        collectionView?.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        diaryExample = dummyData()

        
       // navigationItem.rightBarButtonItem = deleteButtonitem
        /* 네비게이션바 아이템에 추가, 삭제 버튼 생성
         
        navigationItem.leftBarButtonItem = addButtonitem
        
 
 */
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    func indexPathForView(view: AnyObject) -> IndexPath? {
            let maincollectionView = self.convert(CGPoint.zero, from: (view as! UICollectionView))
            return self.indexPathForItem(at: maincollectionView) as IndexPath?
        }
    
    func deleteCell(sender:UIButton){
        var indexPath:IndexPath? = nil
        indexPath = self.collectionView.indexPathForView(view: sender)
        print("index path: \(indexPath)")
    }
 
 */

    //delete버튼 누르면

    @IBAction func clickButton(_ sender: UIBarButtonItem) {
        
        
        //CollectionViewCell.index(ofAccessibilityElement: <#T##Any#>)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let startPoint = touch.location(in: self.view)
        let visibleIndexPath = collectionView?.indexPathForItem(at: startPoint)
        //visibleIndexPath.
        
    }
    //다이어리 추가하는 창에서 pickcoverimage 변수에 선택한 커버 이미지 이름을 저장
    
    //새로운 다이어리를 추가하게 되면 셀 추가
    /*@IBAction func addNewDiary(_ sender = Any){
        // 1- get a coverimage, add the new image into data
     
     coverImagename.append(pickcoverImage)
     
        
    }
 */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let paintingViewController = segue.destination as? PaintingViewController
        
        let selectedIndexPath = self.collectionView?.indexPathsForSelectedItems
     
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
 
     }
 */
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return diaryExample.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let currentDiary = diaryExample[indexPath.row]
        
        cell.diaryImageView?.image = currentDiary.coverImage
        cell.diaryNameLabel?.text = currentDiary.name
        
        // Configure the cell
        //cell.diaryCell = currentDiary
        
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    // Mark: delete items 선택한 셀 삭제
    /*
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        deleteButtonitem.isEnabled = !editing
        if let indexPaths = collectionView?.indexPathsForVisibleItems{
            for indexPath in indexPaths{
                if let cell = collectionView?.cellForItem(at: indexPath) as? CollectionViewCell{
                    
                    cell.isEditing = editing
                }
            }
        }
     }
    */
    
}
