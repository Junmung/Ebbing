//
//  MainVC.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/08/23.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import ReactorKit

class MainVC: BaseVC, View {
    var mainView: MainView { view as! MainView }
    
    override func loadView() {
        view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func bind(reactor: MainReactor) {
        reactor.state
            .map { $0.mainTitle }
            .bind(to: mainView.label.rx.text)
            .disposed(by: disposeBag)
    }
    
}
