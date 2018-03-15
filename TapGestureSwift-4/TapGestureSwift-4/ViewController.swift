//
//  ViewController.swift
//  TapGestureSwift-4
//
//  Created by don't touch me on 3/2/18.
//  Copyright © 2018 trvl, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var viewSwipe: UIView!
    
    var swipeGesture = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let directions: [UISwipeGestureRecognizerDirection] = [.up, .down, .right, .left]
        for direction in directions {
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeView(_:)))
            viewSwipe.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            viewSwipe.isUserInteractionEnabled = true
            viewSwipe.isMultipleTouchEnabled = true
        }
    }
    
    @objc func swipeView(_ sender: UISwipeGestureRecognizer) {
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .right {
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: self.viewSwipe.frame.origin.y, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            } else if sender.direction == .left {
                self.viewSwipe.frame = CGRect(x: 0, y: self.viewSwipe.frame.origin.y, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            } else if sender.direction == .up {
                self.viewSwipe.frame = CGRect(x: self.view.frame.size.width - self.viewSwipe.frame.size.width, y: 0, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            } else if sender.direction == .down {
                self.viewSwipe.frame = CGRect(x: self.viewSwipe.frame.size.width - self.viewSwipe.frame.size.width, y: self.viewSwipe.frame.size.height - self.viewSwipe.frame.size.height, width: self.viewSwipe.frame.size.width, height: self.viewSwipe.frame.size.height)
            }
            self.viewSwipe.layoutIfNeeded()
            self.viewSwipe.setNeedsDisplay()
        }
    }
}
