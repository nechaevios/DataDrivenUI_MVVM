//
//  ViewData.swift
//  DataDrivenUI_MVVM
//
//  Created by Nechaev Sergey  on 25.01.2022.
//

import Foundation

enum MainViewDataModel {
    case initial
    case loading(DataModel)
    case success(DataModel)
    case failure(DataModel)
    
    struct DataModel {
        let icon: String?
        let iconColor: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
