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
    let button = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(label)
        addSubview(button)
        
        label.textColor = .black
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        button.backgroundColor = .blue
        button.setTitle("디테일 이동", for: .normal)
        button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
