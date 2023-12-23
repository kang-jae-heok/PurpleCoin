//
//  BottomNavigationView.swift
//  PurpleCoin
//
//  Created by 강재혁 on 2023/12/23.
//

import UIKit

class BottomNavigationView: UIView {
    
    var navigationButtons = [UIButton]()
    
    let navigationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = PurpleCoinColor.pointColor
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        
    }
}
