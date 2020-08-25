//
//  AppFlow.swift
//  Ebbing
//
//  Created by 준멍 on 2020/08/18.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

final class AppFlow: Flow {

    var root: Presentable {
        return self.rootWindow
    }

    private let rootWindow: UIWindow
    private let services: AppServices

    init(withWindow window: UIWindow, andServices services: AppServices) {
        self.rootWindow = window
        self.services = services
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? EbbingStep else { return .none }

        switch step {
        case .mainIsRequired:
            return navigationToMainScreen()
        default:
            return .none
        }
    }

    private func navigationToMainScreen() -> FlowContributors {
        let mainFlow = MainFlow(withServices: self.services)
        Flows.use(mainFlow, when: .ready) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: EbbingStep.mainIsRequired)))
    }

}

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let appServices: AppServices
    private let disposeBag = DisposeBag()
    var initialStep: Step { EbbingStep.mainIsRequired }

    init(withServices services: AppServices) {
        self.appServices = services
    }
}
