//
//  ViewController.swift
//  RippleTransition
//
//  Created by Ming on 5/9/16.
// Copyright (c) 2016 Rimh(Ming) To (https://github.com/rimh/)
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let transition = RippleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // custom animation duration
        transition.transitionTimeInterval = 1.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self
    }
}
