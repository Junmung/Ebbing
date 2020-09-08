//
//  SettingVC.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/09/07.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import ReactorKit

class SettingVC: BaseVC, View {
    var settingView: SettingView { view as! SettingView }
    
    override func loadView() {
        view = SettingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bind(reactor: SettingReactor) {
        reactor.state
            .map { $0.title }
            .bind(to: settingView.label.rx.text)
            .disposed(by: disposeBag)
    }

}
