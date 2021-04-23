//
//  ViewController.swift
//  SlideMenu
//
//  Created by Shinichiro Kudo on 2021/04/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var sideView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 1
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
    }


}

