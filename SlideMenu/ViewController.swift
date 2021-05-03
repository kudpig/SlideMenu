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
    
    @IBOutlet weak var sideView: UIView! {
        didSet {
            sideView.isUserInteractionEnabled = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        viewConstraint.constant = -175
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.performd(sender:)))
        view.addGestureRecognizer(panGesture)
    }

    @objc func performd(sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let sideView = self.sideView
            
            let translation = sender.translation(in: sideView).x
            
            if translation > 0 { // swipe right
                
                if viewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2) {
                        self.viewConstraint.constant += translation / 10
                        //self.view.layoutIfNeeded() 制約の更新について見本の動画では使用されていたが、あまりよろしくないという話もある？
                    }
                }
                
            } else {  // swipe left
                
                if viewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2) {
                        self.viewConstraint.constant += translation / 10
                        //self.view.layoutIfNeeded()
                    }
                }
                
            }
           
            
        } else if sender.state == .ended {
            
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2) {
                    self.viewConstraint.constant = -175
                    //self.view.layoutIfNeeded()
                }
                
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.viewConstraint.constant = 0
                    //self.view.layoutIfNeeded()
                }
            }
        }
        
    }
    
}

