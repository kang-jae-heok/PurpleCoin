//
//  MainViewController.swift
//  PurpleCoin
//
//  Created by notegg_003 on 2023/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    enum BottomMenu: Int {
        case market
        case asset
    }
    var displayMenu: BottomMenu = .market
    let childVCFrame = CGRect(x: 0,
                              y: 0,
                              width: ScreenFigure.bounds.width,
                              height: ScreenFigure.bounds.height
    )
    
    
    let mainView = MainView()
    
    lazy var marketViewController: MarketViewController = {
        let vc = MarketViewController()
        vc.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: ScreenFigure.bottomNavigationViewHeight(), right: 0)
        vc.view.frame = childVCFrame
        return vc
    }()
    lazy var assetViewController: AssetViewController = {
        let vc = AssetViewController()
        vc.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: ScreenFigure.bottomNavigationViewHeight(), right: 0)
        vc.view.frame = childVCFrame
        return vc
    }()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindAction()
        changeDisplayingVC()
    }
    
    func bindAction() {
        mainView.bottomNavigationView.navigationControls.forEach {
            $0.addTarget(self, action: #selector(bottomNavigationControlTapped(_ :)), for: .touchUpInside)
        }
    }
    
    func changeDisplayingVC() {
        [marketViewController, assetViewController].forEach {
            $0.removeFromParent()
            $0.view.removeFromSuperview()
        }
        switch displayMenu {
        case .market:
            addChild(marketViewController)
            view.addSubview(marketViewController.view)
        case .asset:
            addChild(assetViewController)
            view.addSubview(assetViewController.view)
        }
        view.bringSubviewToFront(mainView.bottomNavigationView)
    }
    
    @objc func bottomNavigationControlTapped(_ sender: UIControl) {
        let tag = sender.tag
        displayMenu = BottomMenu(rawValue: tag) ?? .market
        changeDisplayingVC()
    }
}
