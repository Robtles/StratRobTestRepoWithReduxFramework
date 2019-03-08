//
//  ShapeControllersUtilityBase.swift
//  StratRobTestRepoWithReduxFramework
//
//  Created by Rob on 08/03/2019.
//  Copyright © 2019 com.rob. All rights reserved.
//

open class ShapeControllersUtilityBase: ShapeControllersFeature {
    
    // MARK: Instance Properties
    
    open var isDismissingByBottom: Bool = false
    
    // MARK: View Properties
    
    @IBOutlet open weak var alertView: UIView?
    
    @IBOutlet open weak var overlayView: UIView?
    
}

// MARK: - UIViewControllerTransitioningDelegate

extension ShapeControllersUtilityBase: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentOverlayedModalViewAnimationController()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissOverlayedModalViewAnimationController()
    }
    
}

// MARK: - UIViewControllerAnimatedTransitioning

private final class PresentOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController: ShapeControllersUtilityBase = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ShapeControllersUtilityBase
        let duration = self.transitionDuration(using: transitionContext)
        let containerView = transitionContext.containerView
        toViewController.view.frame = containerView.frame
        containerView.addSubview(toViewController.view)
        toViewController.overlayView?.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            toViewController.overlayView?.alpha = 0.6
        })
        let finishFrame = toViewController.alertView?.frame
        var startingFrame = finishFrame
        startingFrame?.origin.y = -((finishFrame?.height)!)
        toViewController.alertView?.frame = startingFrame!
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .layoutSubviews, animations: {
            toViewController.alertView?.frame = finishFrame!
        }, completion: { result in
            transitionContext.completeTransition(result)
        })
    }
    
}

private final class DismissOverlayedModalViewAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController: ShapeControllersUtilityBase = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ShapeControllersUtilityBase
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, animations: {
            fromViewController.overlayView?.alpha = 0.0
        })
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .layoutSubviews, animations: {
            fromViewController.alertView?.frame.origin.y = fromViewController.isDismissingByBottom ? fromViewController.view.frame.size.height : -(fromViewController.alertView?.frame.height)!
        }, completion: { result in
            transitionContext.completeTransition(true)
        })
    }
    
}
