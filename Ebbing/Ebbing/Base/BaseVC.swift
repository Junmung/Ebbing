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

    var disposeBag = DisposeBag()
}
