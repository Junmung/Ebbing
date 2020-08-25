//
//  MainView.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/08/23.
//  Copyright © 2020 Junsung. All rights reserved.
//

import SnapKit
import UIKit

class MainView: UIView {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(label)
        label.textColor = .black
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
