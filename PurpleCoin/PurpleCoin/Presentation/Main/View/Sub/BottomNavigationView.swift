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
    lazy var navigationControls: [UIControl] = [marketControl, assetControl]
    
    lazy var marketButtonView: UIView = {
        let view = UIView()
        [marketImageView, marketTitleLabel, marketControl].forEach {
            view.addSubview($0)
        }
        marketImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY).offset(-2 * ScreenFigure.VRatioValue)
            $0.width.height.equalTo(18 * ScreenFigure.VRatioValue)
        }
        marketTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.centerY).offset(2 * ScreenFigure.VRatioValue)
        }
        marketControl.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }()
    let marketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        return imageView
    }()
    let marketTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "거래소"
        label.font = PurpleCoinFont.font(type: .bold, size: 13)
        label.textColor = .white
        return label
    }()
    let marketControl: UIControl = {
        let control = UIControl()
        control.tag = 0
        return control
    }()
    
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
    let assetControl: UIControl = {
        let control = UIControl()
        control.tag = 1
        return control
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = PurpleCoinColor.pointColor
        bindAction()
        setLayout()
        navigationControlTapped(marketControl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout() {
        [marketButtonView, assetButtonView].forEach {
            navigationStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalTo(ScreenFigure.bounds.width/2)
            }
        }
        
        addSubview(navigationStackView)
        navigationStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bindAction() {
        navigationControls.forEach {
            $0.addTarget(self, action: #selector(navigationControlTapped), for: .touchUpInside)
        }
    }
    
    @objc func navigationControlTapped(_ sender: UIControl) {
        marketImageView.image = UIImage(named: "home")
        marketTitleLabel.textColor = .white
        assetImageView.image = UIImage(named: "asset")
        assetTitleLabel.textColor = .white
        switch sender.tag {
        case 0:
            marketImageView.image = UIImage(named: "home")?.withTintColor(PurpleCoinColor.selectColor)
            marketTitleLabel.textColor = PurpleCoinColor.selectColor
        case 1:
            assetImageView.image = UIImage(named: "asset")?.withTintColor(PurpleCoinColor.selectColor)
            assetTitleLabel.textColor = PurpleCoinColor.selectColor
        default:
            break
        }
    }
}
