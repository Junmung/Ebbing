//
//  SettingFlow.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/09/08.
//  Copyright © 2020 Junsung. All rights reserved.
//

import RxFlow
import UIKit

final class SettingFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }

    let rootViewController = UINavigationController()
    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? EbbingStep else { return .none }

        switch step {
            
        case .settingIsRequired:
            return navigateToSetting()
            
        default:
            return .none
        }
    }
    
    private func navigateToSetting() -> FlowContributors {
        let settingVC = UIStoryboard(name: SettingVC.id, bundle: nil).instantiate(SettingVC.self)
        
        settingVC.reactor = SettingReactor("세팅 타이틀")
        settingVC.title = "세팅"
        self.rootViewController.pushViewController(settingVC, animated: true)
        
        return .one(flowContributor: .contribute(withNextPresentable: settingVC, withNextStepper: OneStepper(withSingleStep: EbbingStep.settingIsRequired), allowStepWhenNotPresented: false))
    }
}

