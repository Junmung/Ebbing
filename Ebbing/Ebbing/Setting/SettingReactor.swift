//
//  SettingReactor.swift
//  Ebbing
//
//  Created by LeeJunSung on 2020/09/07.
//  Copyright © 2020 Junsung. All rights reserved.
//

import ReactorKit

class SettingReactor: Reactor {
    enum Action {
        case loadSubjects
        case addSubjectClicked
    }
    
    enum Mutation {
        case setSubjects
    }
    
    struct State {
        var title: String
    }
    
    var initialState: State
    
    init(_ title: String) {
        initialState = .init(title: title)
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .loadSubjects:
            return .just(.setSubjects)
        case .addSubjectClicked:
            return .just(.setSubjects)
            
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case .setSubjects:
            print("set Subjects")
        }
        return state
    }
    
}


