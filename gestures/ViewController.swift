//
//  ViewController.swift
//  gestures
//
//  Created by W.S. van Arkel jr. on 23-10-16.
//  Copyright © 2016 W.S. van Arkel jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tapView: UIView!
    
    var tapRec = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        tapView.alpha = 0.0
        
        tapRec.addTarget(self, action: #selector(ViewController.TappedView))
        tapView.isUserInteractionEnabled = true
        tapView.addGestureRecognizer(tapRec)
        tapViewAnimate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func TappedView() {
        
        tapViewCorners()
        
        let tapAllert = UIAlertController(title: "Hallo Roosje", message: "Leuk dat je op me gedrukt hebt ", preferredStyle: UIAlertControllerStyle.alert)
        tapAllert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(tapAllert, animated: true, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.tapView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.tapView.backgroundColor = UIColor.green
            self.tapView.transform = self.tapView.transform.rotated(by: CGFloat (M_PI))
            self.tapView.backgroundColor = UIColor.red
            self.tapView.transform = self.tapView.transform.rotated(by: CGFloat (-M_PI))
            }, completion: nil)
  
    }
    
    func tapViewAnimate() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            self.tapView.transform = CGAffineTransform.identity
            self.tapView.alpha = 1.0
            }, completion: nil)
    }
    func tapViewCorners() {
        UIView.animate(withDuration: 10.0, delay: 5.0, options: .curveEaseIn, animations: {
            self.tapView.layer.cornerRadius = 69
            }, completion: nil)
    }
    
}
