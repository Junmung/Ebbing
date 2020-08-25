//
//  MainFlow.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/08/23.
//  Copyright © 2020 Junsung. All rights reserved.
//

import RxFlow
import UIKit

final class MainFlow: Flow {
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
        case .mainIsRequired:
            return navigateToMain()
            
        default:
            return .none
        }
    }

    private func navigateToMain() -> FlowContributors {
        let mainVC = UIStoryboard(name: MainVC.id, bundle: nil).instantiate(MainVC.self)
        
        mainVC.reactor = MainReactor("메인 타이틀")
        mainVC.title = "메인"
        self.rootViewController.pushViewController(mainVC, animated: true)

        return .one(flowContributor: .contribute(withNextPresentable: mainVC, withNextStepper: OneStepper(withSingleStep: EbbingStep.mainIsRequired), allowStepWhenNotPresented: false))
        }
}
