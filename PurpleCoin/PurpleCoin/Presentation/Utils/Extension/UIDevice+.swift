//
//  UIDevice+.swift
//  PurpleCoin
//
//  Created by 강재혁 on 2023/12/23.
//

import UIKit

extension UIDevice {
    var isNotch: Bool {
        return UIApplication.shared.windows[0].safeAreaInsets.top > 20
    }
}

