//
//  MainViewModel.swift
//  DataDrivenUI_MVVM
//
//  Created by Nechaev Sergey  on 25.01.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((MainViewDataModel) -> ())? { get set }
    func startFetch()
    func setSuccess()
    func setFailure()
}

final class MainViewModel: MainViewModelProtocol {
    var updateViewData: ((MainViewDataModel) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch() {
        updateViewData?(.loading(MainViewDataModel.DataModel(icon: nil,
                                                             iconColor: nil,
                                                             title: nil,
                                                             description: nil,
                                                             numberPhone: nil)))
    
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.updateViewData?(.success(MainViewDataModel.DataModel(icon: "checkmark.shield.fill",
                                                                       iconColor: "green",
                                                                       title: "Success",
                                                                       description: "Good",
                                                                       numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.failure(MainViewDataModel.DataModel(icon: "xmark.shield",
                                                                       iconColor: "red",
                                                                       title: "Error",
                                                                       description: "Failure",
                                                                       numberPhone: nil)))
        }
    }
    
    func setSuccess() {
        updateViewData?(.success(MainViewDataModel.DataModel(icon: "checkmark.shield.fill",
                                                             iconColor: "green",
                                                             title: "Success",
                                                             description: "Good",
                                                             numberPhone: nil)))
    }
    
    func setFailure() {
        updateViewData?(.failure(MainViewDataModel.DataModel(icon: "xmark.shield",
                                                             iconColor: "red",
                                                             title: "Error",
                                                             description: "Failure",
                                                             numberPhone: nil)))
    }
}
