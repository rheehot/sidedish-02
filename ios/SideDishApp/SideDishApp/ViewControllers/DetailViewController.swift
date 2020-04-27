//
//  DetailViewController.swift
//  SideDishApp
//
//  Created by Cory Kim on 2020/04/23.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    static let identifier = "DetailViewController"
    
    @IBOutlet weak var gradientLayerContainerView: UIView!
    
    private let backButtonColor: UIColor? = UIColor(named: "darkGray-white")
    private let defaultBackgroundColor: UIColor? = UIColor(named: "default-bg")
    private let clearColor: UIColor? = UIColor(named: "detail-clear")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureGradientBackgroundView()
    }
    
    private func configureGradientBackgroundView() {
        let gradientLayer = CAGradientLayer()
        gradientLayerContainerView.backgroundColor = .clear
        gradientLayer.colors = [clearColor!.cgColor, defaultBackgroundColor!.cgColor, defaultBackgroundColor!.cgColor]
        gradientLayer.locations = [0, 0.4, 1]
        gradientLayer.frame = gradientLayerContainerView.bounds
        gradientLayerContainerView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK:- NavigationBar Configuration
    
    private func configureNavigationBar() {
        let backButtonImage = UIImage(named: "back.button")
        let backButtonItem = UIBarButtonItem.init(image: backButtonImage, style: .plain, target: self, action: #selector(handleBack))
        backButtonItem.tintColor = backButtonColor
        self.navigationItem.setLeftBarButton(backButtonItem, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    @objc private func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
