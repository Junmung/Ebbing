//
//  MainReactor.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/08/23.
//  Copyright © 2020 Junsung. All rights reserved.
//

import ReactorKit
import RxFlow

class MainReactor: Reactor {
    enum Action {
        case loadSubjects
        case addSubjectClicked
        case clickSetting
    }
    
    enum Mutation {
        case setSubjects
        case moveSetting
    }
    
    struct State {
        var mainTitle: String
        var step: Step = EbbingStep.mainIsRequired
    }
    
    var initialState: State
    
    init(_ title: String) {
        initialState = .init(mainTitle: title)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadSubjects:
            return .just(.setSubjects)
        case .addSubjectClicked:
            return .just(.setSubjects)
        case .clickSetting:
            return .just(.moveSetting)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setSubjects:
            print("set Subjects")
            
        case .moveSetting:
            state.step = EbbingStep.settingIsRequired
            
        }
        return state
    }
    
}

