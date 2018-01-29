//
// RippleTransition.swift
// RippleTransition
//
// Created by Ming on 5/9/16.
// The MIT License (MIT)
//
// Copyright (c) 2016 Rimh(Ming) To (https://github.com/rimh/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

public class RippleTransition : NSObject, UIViewControllerAnimatedTransitioning, CAAnimationDelegate {
    
    public var transitionTimeInterval:TimeInterval = 5.0
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionTimeInterval
    }
    
    weak var transitionContext:UIViewControllerContextTransitioning?
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        let containerView = transitionContext.containerView
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        
        containerView.addSubview(toViewController.view)
        containerView.bringSubview(toFront: fromViewController.view)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            toViewController.view.layer.removeAllAnimations()
            fromViewController.view.layer.removeAllAnimations()
        })
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
        let animation = CABasicAnimation(keyPath: "opacity");
        animation.fromValue = 1
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.duration = self.transitionDuration(using: transitionContext)/2.5
        animation.beginTime = 0
        view.layer.add(animation, forKey: nil)
        
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let transitionContext = self.transitionContext else { return }
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    }
}
