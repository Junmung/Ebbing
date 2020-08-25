//
//  SceneDelegate.swift
//  Ebbing
//
//  Created by 준멍 on 2020/08/17.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import RxSwift
import RxFlow
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let disposeBag = DisposeBag()
    var coordinator = FlowCoordinator()
    var appFlow: AppFlow!
    lazy var appServices = {
        return AppServices(preferencesService: PreferencesService())
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            self.window?.makeKeyAndVisible()
            coordinator.rx.willNavigate.subscribe(onNext: { flow, step in
                print("will navigate to flow = \(flow) and step = \(step)")
            }).disposed(by: self.disposeBag)
            
            coordinator.rx.didNavigate.subscribe(onNext: { flow, step in
                print("did navigate to flow = \(flow) and step = \(step)")
            }).disposed(by: disposeBag)
            
            self.appFlow = AppFlow(withWindow: window!, andServices: self.appServices)

            coordinator.coordinate(
                flow: self.appFlow,
                with: AppStepper(withServices: self.appServices)
            )
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

struct AppServices: HasPreferencesService {
    let preferencesService: PreferencesService
}
