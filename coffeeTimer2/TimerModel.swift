//
//  TimerModel.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 5/5/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import Foundation

class TimerModel: NSObject {
    var name = ""
    var duration = 0
    var type = TimerType.Coffee
    
    enum TimerType {
        case Coffee
        case Tea
    }
    
    override var description: String {
        return "TimerModel(\(name))"
    }
    
    init(name: String, duration: Int, type: TimerType) {
        self.name = name
        self.duration = duration
        self.type = type
        super.init()
    }
}
