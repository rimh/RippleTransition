# RippleTransition

Combine Ripple Effect and Fade Out to make animation transition.

## Requirement
Xcode 9, Swift 4, iOS 8 or above

## Demo
![ripple](https://user-images.githubusercontent.com/19208995/33179797-00a78948-d0ae-11e7-82a7-5c977ea61c5d.gif)

## Usage
```swift
import UIKit

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
## License

RippleTransition is available under the MIT license. See the LICENSE file for more info.
