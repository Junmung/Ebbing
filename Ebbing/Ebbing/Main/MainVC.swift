//
//  MainVC.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/08/23.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxFlow

class MainVC: BaseVC, View, Stepper {
    var mainView: MainView { view as! MainView }
    let steps = PublishRelay<Step>()
    
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
        
        reactor.state
            .map { $0.step }
            .debug()
            .bind(to: self.steps)
            .disposed(by: disposeBag)
        
        mainView.button.rx.tap.asDriver()
            .map { .clickSetting }
            .debug()
            .drive(reactor.action)
            .disposed(by: disposeBag)
        
    }
    
}
