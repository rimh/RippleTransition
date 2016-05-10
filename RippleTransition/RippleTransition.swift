//
//  RippleTransition.swift
//  RippleTransition
//
//  Created by Ming on 5/9/16.
//  Copyright © 2016 Sleepy Sheep - Ming. All rights reserved.
//

import Foundation
import UIKit

class RippleTransition : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 4.0
    }
    
    weak var transitionContext:UIViewControllerContextTransitioning?
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        guard let containerView = transitionContext.containerView() else { return }
        guard let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) else { return }
        guard let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else { return }
        
        containerView.addSubview(toViewController.view)
        containerView.bringSubviewToFront(fromViewController.view)
        
        CATransaction.begin()
        rippleAnimation(fromViewController.view)
        fadeOutAnimation(fromViewController.view)
        CATransaction.commit()
    }
    
    private func rippleAnimation(view:UIView)
    {
        let animation = CATransition()
        animation.delegate = self
        animation.duration = self.transitionDuration(transitionContext)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.type = "rippleEffect"
        animation.beginTime = 0
        view.layer.addAnimation(animation, forKey: nil)
    }
    
    private func fadeOutAnimation(view:UIView)
    {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "opacity");
        animation.fromValue = 1
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.duration = self.transitionDuration(transitionContext)/2
        animation.beginTime = self.transitionDuration(transitionContext)/2
        view.layer.addAnimation(animation, forKey: nil)
    }

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        guard let transitionContext = self.transitionContext else { return }
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
    }
}