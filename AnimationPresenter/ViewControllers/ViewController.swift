//
//  ViewController.swift
//  AnimationPresenter
//
//  Created by Kima on 05.09.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var animatedElement: SpringView!
    @IBOutlet var animationOptionsLabel: SpringLabel!
    
    private var animationSettings = AnimationSetting.getAnimationSetting()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationOptionsLabel.text = animationSettings.description
    }
    
    @IBAction func runCoreAnimation(_ sender: UIButton) {
        animationOptionsLabel.animation = "pop"
        animationOptionsLabel.animate()
        animationOptionsLabel.text = animationSettings.description
        
        animationOptionsLabel.animateNext { [unowned self] in
            animatedElement.animation = animationSettings.animation
            animatedElement.curve = animationSettings.curve
            animatedElement.force = animationSettings.force
            animatedElement.duration = animationSettings.duration
            animatedElement.delay = animationSettings.delay
            animatedElement.animate()
            
            animationSettings = AnimationSetting.getAnimationSetting()
            sender.setTitle("Run \(animationSettings.animation)", for: .normal)
        }
    }
}
