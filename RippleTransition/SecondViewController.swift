//
//  SecondViewController.swift
//  RippleTransition
//
//  Created by ming on 2018/01/29.
// Copyright (c) 2016 Rimh(Ming) To (https://github.com/rimh/)
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToPreviousScene(_ sender:AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
