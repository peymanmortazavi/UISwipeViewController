//
//  ViewController.swift
//  UISwipeViewController
//
//  Created by Peyman Mortazavi on 11/23/15.
//  Copyright © 2015 Peyman. All rights reserved.
//

import UIKit

class TestViewController : UIViewController {
    init(_ name: String) {
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = name
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: name, style: .Plain, target: self, action: "action")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func action() {
        print("Clicked: \(self.navigationItem.title)")
    }
}

class ViewController: UISwipeViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = TestViewController("Red")
        let blue = TestViewController("Blue")
        let green = TestViewController("Green")
        
        red.view.backgroundColor = UIColor.redColor()
        blue.view.backgroundColor = UIColor.blueColor()
        green.view.backgroundColor = UIColor.greenColor()
        
        self.viewControllers = [red, blue, green]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

