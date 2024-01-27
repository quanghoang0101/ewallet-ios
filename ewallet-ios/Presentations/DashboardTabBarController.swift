//
//  DashboardTabBarController.swift
//  ewallet-ios
//
//  Created by hoang phan on 26/01/2024.
//

import Foundation
import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let home = BaseNavigationController(rootViewController: HomeViewController())
        let homeIc = UITabBarItem(title: "", image: UIImage(named: "ic-home.png"), selectedImage: UIImage(named: "ic-home.png"))
        home.tabBarItem = homeIc
        
        let wallet = BaseNavigationController(rootViewController: WalletViewController())
        let walletIc = UITabBarItem(title: "", image: UIImage(named: "ic-wallet.png"), selectedImage: UIImage(named: "ic-wallet.png"))
        wallet.tabBarItem = walletIc
        
        let statistics = BaseNavigationController(rootViewController: StatisticsViewController())
        let statisticsIc = UITabBarItem(title: "", image: UIImage(named: "ic-statistics.png"), selectedImage: UIImage(named: "ic-statistics.png"))
        statistics.tabBarItem = statisticsIc
        
        let voucher = BaseNavigationController(rootViewController: VoucherViewController())
        let voucherIc = UITabBarItem(title: "", image: UIImage(named: "ic-voucher.png"), selectedImage: UIImage(named: "ic-voucher.png"))
        voucher.tabBarItem = voucherIc
        
        let controllers = [home, wallet, statistics, voucher]
        self.viewControllers = controllers
        self.tabBar.tintColor = UIColor(hex: "#0C41E1")
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
