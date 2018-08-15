//
//  MainCollectionViewController.swift
//  Noty
//
//  Created by CAUAD20 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//
// 메인화면은 켈렉션뷰, 각 셀에 다이어리 표지 및 제목
// 네비게이션 창에 다이어리 추가버튼과 잠금기능
// 설정창은 생략?

import UIKit

private let reuseIdentidier = "MainCell"

class CollectionViewCell: UICollectionViewCell {
    //메인화면에서 셀에 나타날 다이어리 표지 및 제목
    @IBOutlet weak var diaryImageView: UIImageView!
    @IBOutlet weak var diaryNameLabel: UILabel!
    
    
    var diaryCell:Diary? {
        //didSet, willSet의 역할은 프로퍼티의 값이 변경되기 직전, 직후를 감지하는 프로퍼티 옵저버 역할
        didSet {
            self.diaryImageView?.image = diaryCell!.coverImage
            self.diaryNameLabel?.text = diaryCell!.name
            
        }
    }
}




class MainCollectionViewController: UICollectionViewController {
    
    let delegateToPopoverViewController = PopoverViewController()
    
    @IBOutlet var mainCollecView: UICollectionView!
    
    
    
    @IBAction func addDiaryButton(_ sender: Any) {
        
    }
    
    //먼저 메인화면이 뜨면서 콜렉션뷰에 더미로 넣을 데이터
    func diaryFunc() -> [Diary] {
        let diary01 = Diary(name: "Monthly Diary", coverImage: UIImage(named: "Monthly"))
        let diary02 = Diary(name: "Yearly Diary", coverImage: UIImage(named:"Yearly"))
        let diary03 = Diary(name: "Travel Diary", coverImage: UIImage(named:"Travel"))
        
        return [diary01, diary02, diary03]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainCollecView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryData = diaryFunc()
        mainCollecView.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
      //MARK: - Navigation
    
      //In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

//        let popoverVC = segue.destination as? PopoverViewController
//        popoverVC?.delegate = self
     
     }
 
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return diaryData.count
    }
    
    //각 셀에 뿌릴 데이터들
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! CollectionViewCell
        let currentDiary = diaryData[indexPath.row]
        
        cell.diaryImageView?.image = currentDiary.coverImage
        cell.diaryNameLabel?.text = currentDiary.name
        print(currentDiary.name)
        
        // Configure the cell

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
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
    
        }

