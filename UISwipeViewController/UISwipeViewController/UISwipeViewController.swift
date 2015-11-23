//
//  UISwipeViewController.swift
//  UISwipeViewController
//
//  Created by Peyman Mortazavi on 11/23/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class UISwipeViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var navigationBar : UINavigationBar = UINavigationBar()

    private var pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
    
    private var pages : [UIViewController] = []
    var viewControllers : [UIViewController] {
        get {
            return pages
        }
        set(value) {
            pages = value
            if(value.count > 0) {
                 pageViewController.setViewControllers([value[0]], direction: .Forward, animated: false, completion: nil)
                 navigationBar.items = []
                 navigationBar.pushNavigationItem(value[0].navigationItem, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64)
        self.view.addSubview(navigationBar)
        pageViewController.view.frame = CGRect(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(pageViewController.view)
        addChildViewController(pageViewController)
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        navigationBar.items = []
        self.navigationBar.pushNavigationItem(pendingViewControllers[0].navigationItem, animated: true)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let index = pages.indexOf(viewController)?.advancedBy(1) where index < pages.count {
            return pages[index]
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let index = pages.indexOf(viewController)?.advancedBy(-1) where index > -1 {
            return pages[index]
        }
        return nil
    }

}
