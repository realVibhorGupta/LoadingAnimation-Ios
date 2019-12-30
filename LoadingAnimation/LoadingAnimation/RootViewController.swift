//
//  ViewController.swift
//  LoadingAnimation
//
//  Created by Vibhor Gupta on 8/15/19.
//  Copyright © 2019 Vibhor Gupta. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    let circle = UIView()
    var displayLink : CADisplayLink!

    fileprivate func setUpCircle() {
        circle.layer.cornerRadius = 50

        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .white

        view.addSubview(circle)
        setUpCircle()

        displayLink = CADisplayLink(target: self, selector: #selector(handleAnimation))
        displayLink.add(to: RunLoop.main, forMode: .default)

    }


    var value : CGFloat = 0.0
    var invert : Bool = false
    @objc  fileprivate func handleAnimation(){
        invert ? (value -= 1) :  (value += 1)

        circle.backgroundColor = UIColor.red.withAlphaComponent(value / 100)

        if value > 100  || value < 0 {
            invert = !invert
        }

    }


}

