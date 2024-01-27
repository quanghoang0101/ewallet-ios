//
//  ViewController.swift
//  ewallet-ios
//
//  Created by hoang phan on 24/01/2024.
//

import UIKit
import ElectrodeContainer

class AuthViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let miniapp = ElectrodeReactNative.sharedInstance().miniApp(withName: "AuthMiniapp", properties: nil, overlay: false, sizeFlexibility: 0, delegate: nil)
        miniapp.view.frame = UIScreen.main.bounds
        view.addSubview(miniapp.view)
        
        ElectrodeBridgeHolder.addEventListener(withName: "auth.event.done") { data in
            let allScenes = UIApplication.shared.connectedScenes
            let scene = allScenes.first { $0.activationState == .foregroundActive }
                                    
            if let windowScene = scene as? UIWindowScene {
                windowScene.keyWindow?.rootViewController = DashboardTabBarController()
            }
        }
    }


}

