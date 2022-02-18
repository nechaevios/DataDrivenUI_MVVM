//
//  ViewController.swift
//  DataDrivenUI_MVVM
//
//  Created by Nechaev Sergey  on 25.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: MainViewModelProtocol!
    private var mainView: MainView!

    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        createView()
        updateView()
    }
    
    private func createView() {
        mainView = MainView()
        mainView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        mainView.center = view.center
        view.addSubview(mainView)
    }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.mainView.viewData = viewData
        }
    }
    
    
    @IBAction func startAction(_ sender: Any) {
        viewModel.startFetch()
    }
    
    @IBAction func setSuccess(_ sender: Any) {
        viewModel.setSuccess()
    }
    
    @IBAction func setFailure(_ sender: Any) {
        viewModel.setFailure()
    }
    
    
}

