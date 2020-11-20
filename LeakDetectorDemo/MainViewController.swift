//
// Copyright © 2020 An Tran. All rights reserved.
//

import Combine
import LeakDetector
import UIKit

class MainViewController: LeakDetectableTableViewController {
            
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 4:
                let storyboard = UIStoryboard(name: "Closure", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController()!
                weakViewController = viewController
                navigationController?.present(viewController, animated: true, completion: nil)
            case 5:
                let storyboard = UIStoryboard(name: "DispatchQueue", bundle: nil)
                let viewController = storyboard.instantiateInitialViewController()!
                weakViewController = viewController
                navigationController?.present(viewController, animated: true, completion: nil)
            case 6:
                let viewController = TimerRootViewController()
                let navController = UINavigationController(rootViewController: viewController)
                weakViewController = navController
                navigationController?.present(navController, animated: true, completion: nil)
            case 7:
                let viewController = AnimateRootViewController()
                let navController = UINavigationController(rootViewController: viewController)
                weakViewController = navController
                navigationController?.present(navController, animated: true, completion: nil)
            case 8:
                let viewController = NestedClosuresRootViewController()
                let navController = UINavigationController(rootViewController: viewController)
                weakViewController = navController
                navigationController?.present(navController, animated: true, completion: nil)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 3:
                let viewController = NoLeakHighOrderFunctionViewController()
                weakViewController = viewController
                navigationController?.pushViewController(viewController, animated: true)
            default:
                break
            }
        default:
            fatalError("unknown section")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let weakViewController = weakViewController {
            executeLeakDetector(for: weakViewController)
        }
    }
}