//
//  RippleTransition.swift
//  RippleTransition
//
//  Created by Ming on 5/9/16.
//  Copyright © 2016 Sleepy Sheep - Ming. All rights reserved.
//

import Foundation
import UIKit

class RippleTransition : NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5.0
    }
    
    weak var transitionContext:UIViewControllerContextTransitioning?
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        containerView.addSubview(toViewController.view)
        containerView.bringSubview(toFront: fromViewController.view)
        
        CATransaction.begin()
        rippleAnimation(fromViewController.view)
        fadeOutAnimation(fromViewController.view)
        CATransaction.commit()
    }
    
    fileprivate func rippleAnimation(_ view:UIView)
    {
        let animation = CATransition()
        animation.delegate = self
        animation.duration = self.transitionDuration(using: transitionContext)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.type = "rippleEffect"
        animation.beginTime = 0
        view.layer.add(animation, forKey: nil)
    }
    
    fileprivate func fadeOutAnimation(_ view:UIView)
    {
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "opacity");
        animation.fromValue = 1
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.duration = self.transitionDuration(using: transitionContext)/2
        animation.beginTime = self.transitionDuration(using: transitionContext)/2
        view.layer.add(animation, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let transitionContext = self.transitionContext else { return }
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
}
