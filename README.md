# RippleTransition
[![Version](https://img.shields.io/cocoapods/v/RippleTransition.svg?style=flat)](http://cocoapods.org/pods/RippleTransition)
[![License](https://img.shields.io/cocoapods/l/RippleTransition.svg?style=flat)](http://cocoapods.org/pods/RippleTransition)
[![Platform](https://img.shields.io/cocoapods/p/RippleTransition.svg?style=flat)](http://cocoapods.org/pods/RippleTransition)

A simple transition with native ripple effect which is a combination between ripple and fade-out effect.

## Requirement
Xcode 9, Swift 4, iOS 8 or above

## Demo
![ripple](https://user-images.githubusercontent.com/19208995/33179797-00a78948-d0ae-11e7-82a7-5c977ea61c5d.gif)

## Installation

RippleTransition is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RippleTransition'
```

## Usage
First, you need to import the module.
```swift
import RippleTransition
```
```swift
class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    let transition = RippleTransition()

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self
    }
}
```
Custom animation duration by 
```swift
transition.transitionTimeInterval = 1.0
```
## License

RippleTransition is available under the MIT license. See the LICENSE file for more info.
