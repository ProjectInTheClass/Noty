//
//  Diary.swift
//  Noty
//
//  Created by CAUAD21 on 2018. 8. 6..
//  Copyright © 2018년 CAUAD20. All rights reserved.
//

import Foundation
import UIKit


class Diary{
    var name:String
    var coverImage:UIImage?

    init(name:String, coverImage:UIImage?) {
        self.name = name
        self.coverImage = coverImage
    }
}


//먼저 메인화면이 뜨면서 콜렉션뷰에 더미로 넣을 데이터
func diaryFunc() -> [Diary] {
    let diary01 = Diary(name: "Monthly Diary", coverImage: UIImage(named: "Monthly"))
    let diary02 = Diary(name: "Yearly Diary", coverImage: UIImage(named:"Yearly"))
    let diary03 = Diary(name: "Travel Diary", coverImage: UIImage(named:"Travel"))
    
    return [diary01, diary02, diary03]
}

//추가버튼을 누르면 예시로 추가할 다이어리

var diaryData:[Diary] = diaryFunc()
