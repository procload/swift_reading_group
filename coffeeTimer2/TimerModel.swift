//
//  TimerModel.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 5/5/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import Foundation

class TimerModel: NSObject {
    var coffeeName = ""
    var duration = 0
    
    override var description: String {
        return "TimerModel(\(coffeeName))"
    }
    
    init(coffeeName: String, duration: Int, type: String) {
        self.coffeeName = coffeeName
        self.duration = duration
        super.init()
    }
}
