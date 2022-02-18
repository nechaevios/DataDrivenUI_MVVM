//
//  MainView.swift
//  DataDrivenUI_MVVM
//
//  Created by Nechaev Sergey  on 25.01.2022.
//

import UIKit

class MainView: UIView {
    
    var viewData: MainViewDataModel = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true)
            setActivityIndicator()
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
            setActivityIndicator(isHidden: false, animating: true)
        case .success(let success):
            update(viewData: success, isHidden: false)
            setActivityIndicator()
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
            setActivityIndicator()
        }
    }
    
    private func update(viewData: MainViewDataModel.DataModel?, isHidden: Bool) {
        let config = UIImage.SymbolConfiguration(pointSize: 150)
        imageView.image = UIImage(systemName: viewData?.icon ?? "", withConfiguration: config)
        guard let color = stringColor(rawValue: viewData?.iconColor ?? "red") else { return }
        imageView.tintColor = color.create
        
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
    }
    
    private func setActivityIndicator(isHidden: Bool = true, animating: Bool = false) {
        activityIndicator.isHidden = isHidden
        animating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
}

extension MainView {
    enum stringColor: String {
        case red
        case blue
        case green
        
        var create: UIColor {
            switch self {
            case .red:
                return UIColor.red
            case .blue:
                return UIColor.blue
            case .green:
                return UIColor.green
            }
        }
    }
    
    
}
