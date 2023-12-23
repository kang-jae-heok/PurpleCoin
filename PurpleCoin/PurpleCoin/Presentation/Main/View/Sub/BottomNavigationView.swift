//
//  BottomNavigationView.swift
//  PurpleCoin
//
//  Created by 강재혁 on 2023/12/23.
//

import UIKit

class BottomNavigationView: UIView {
    
    let navigationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var homeButtonView: UIView = {
        let view = UIView()
        [homeImageView, homeTitleLabel, homeControl].forEach {
            view.addSubview($0)
        }
        homeImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY).offset(-2 * ScreenFigure.VRatioValue)
            $0.width.height.equalTo(18 * ScreenFigure.VRatioValue)
        }
        homeTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.centerY).offset(2 * ScreenFigure.VRatioValue)
        }
        homeControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        return imageView
    }()
    let homeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "거래소"
        label.font = PurpleCoinFont.font(type: .bold, size: 13)
        label.textColor = .white
        return label
    }()
    let homeControl = UIControl()
    
    lazy var assetButtonView: UIView = {
        let view = UIView()
        [assetImageView, assetTitleLabel, assetControl].forEach {
            view.addSubview($0)
        }
        assetImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY).offset(-2 * ScreenFigure.VRatioValue)
            $0.width.height.equalTo(18 * ScreenFigure.VRatioValue)
        }
        assetTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.centerY).offset(2 * ScreenFigure.VRatioValue)
        }
        assetControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    let assetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "asset")
        return imageView
    }()
    let assetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "보유자산"
        label.font = PurpleCoinFont.font(type: .bold, size: 13)
        label.textColor = .white
        return label
    }()
    let assetControl = UIControl()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = PurpleCoinColor.pointColor
        [homeButtonView, assetButtonView].forEach {
            navigationStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalTo(ScreenFigure.bounds.width/2)
            }
        }
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        addSubview(navigationStackView)
        navigationStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
