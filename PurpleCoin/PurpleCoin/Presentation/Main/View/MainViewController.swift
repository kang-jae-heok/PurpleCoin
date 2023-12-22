//
//  MainViewController.swift
//  PurpleCoin
//
//  Created by notegg_003 on 2023/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
