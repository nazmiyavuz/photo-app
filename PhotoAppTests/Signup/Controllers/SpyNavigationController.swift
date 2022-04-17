//
//  SpyNavigationController.swift
//  PhotoAppTests
//
//  Created by Nazmi Yavuz on 16.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import UIKit

class SpyNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        pushedViewController = viewController
    }
}
