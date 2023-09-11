//
//  AnimationSetting.swift
//  AnimationPresenter
//
//  Created by Kima on 05.09.2023.
//

import Foundation

struct AnimationSetting {
    
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        preset: \(animation)
        curve: \(curve)
        force: \(String(format: "%.02f", force))
        duration: \(String(format: "%.02f", duration))
        delay: \(String(format: "%.02f", delay))
        """
    }
    
    static func getAnimationSetting() -> AnimationSetting {
        
        var animationSettings: AnimationSetting
        
        let animation = DataStore.shared.animations.randomElement() ?? "pop"
        let curve = DataStore.shared.curves.randomElement() ?? "easeIn"
        let force = Double.random(in: 0.5...2)
        let duration = Double.random(in: 0.5...2)
        let delay = Double.random(in: 0.3...1)
        
        animationSettings = AnimationSetting(
            animation: animation,
            curve: curve,
            force: force,
            duration: duration,
            delay: delay
        )
    
        return animationSettings
    }
}
