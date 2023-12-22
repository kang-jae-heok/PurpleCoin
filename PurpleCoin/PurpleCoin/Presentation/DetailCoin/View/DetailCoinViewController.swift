//
//  DetailCoinViewController.swift
//  PurpleCoin
//
//  Created by notegg_003 on 2023/12/22.
//

import UIKit

class DetailCoinViewController: UIViewController {
    
    let detailCoinView = DetailCoinView()
    
    override func loadView() {
        super.loadView()
        view = detailCoinView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
