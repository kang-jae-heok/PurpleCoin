//
//  MainView.swift
//  PurpleCoin
//
//  Created by notegg_003 on 2023/12/22.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let bottomNavigationView = BottomNavigationView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        [bottomNavigationView].forEach {
            addSubview($0)
        }
        bottomNavigationView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(ScreenFigure.bottomNavigationViewHeight())
        }
    }
}
