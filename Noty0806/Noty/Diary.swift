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
    let name:String
    let type:DiaryType
    var coverImageName:String?
    var coverImage:UIImage?
    var content:[String] = []
    
    init(name:String, type:DiaryType, coverImageName:String) {
        self.name = name
        self.type = type
        self.coverImageName = coverImageName
        self.coverImage = UIImage(named: coverImageName)
    }
    
    enum DiaryType {
        case monthlyDiary
        case yearlyDiary
        case travelDiary
    }

}
