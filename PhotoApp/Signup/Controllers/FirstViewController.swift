//
//  FirstViewController.swift
//  PhotoApp
//
//  Created by Nazmi Yavuz on 16.04.2022.
//  Copyright © 2022 Nazmi Yavuz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var nextViewButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextViewButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let secondVC = storyboard.instantiateViewController(
            identifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }

}
