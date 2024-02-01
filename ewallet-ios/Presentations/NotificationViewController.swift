//
//  NotificationViewController.swift
//  ewallet-ios
//
//  Created by hoang phan on 01/02/2024.
//

import UIKit
import ElectrodeContainer

class NotificationViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let miniapp = ElectrodeReactNative.sharedInstance().miniApp(withName: "NotificationMiniapp", properties: nil, overlay: false, sizeFlexibility: 0, delegate: nil)
        miniapp.view.frame = UIScreen.main.bounds
        view.addSubview(miniapp.view)
        self.edgesForExtendedLayout = []
    }
}
