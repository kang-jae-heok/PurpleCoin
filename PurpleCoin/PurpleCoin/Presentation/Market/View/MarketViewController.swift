//
//  MarketViewController.swift
//  PurpleCoin
//
//  Created by notegg_003 on 2023/12/22.
//

import UIKit

class MarketViewController: UIViewController {
    
    let marketView = MarketView()
    
    override func loadView() {
        view = marketView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
