//
//  BaseVC.swift
//  Ebbing
//
//  Created by 준멍 on 2020/08/18.
//  Copyright © 2020 Junsung. All rights reserved.
//

import UIKit
import RxSwift

class BaseVC: UIViewController {
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    static var id: String { String(describing: self) }

    var disposeBag = DisposeBag()
}

extension UIStoryboard {
    func instantiate<A: UIViewController>(_ type: A.Type) -> A {
        guard let vc = self.instantiateViewController(withIdentifier: String(describing: type.self)) as? A else {
            fatalError("Could not instantiate view controller \(A.self)") }
        return vc
    }
}
