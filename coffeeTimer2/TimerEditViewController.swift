//
//  TimerEditViewController.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 5/6/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import UIKit

class TimerEditViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesSlider: UISlider!
    @IBOutlet weak var secondsSlider: UISlider!
    
    var timerModel: TimerModel!
    
    @IBAction func cancelWasPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func doneWasPressed(sender: AnyObject) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfMinutes = Int(timerModel.duration / 60)
        let numberOfSeconds = timerModel.duration % 60
        nameField.text = timerModel.coffeeName
        updateLabelsWithMinutes(numberOfMinutes, seconds: numberOfSeconds)
        minutesSlider.value = Float(numberOfMinutes)
        secondsSlider.value = Float(numberOfSeconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        let numberOfMinutes = Int(minutesSlider.value)
        let numberOfSeconds = Int(secondsSlider.value)
        updateLabelsWithMinutes(numberOfMinutes, seconds: numberOfSeconds)
    }
    
    func updateLabelsWithMinutes(minutes: Int, seconds: Int) {
        func pluralize(value: Int, singular: String, plural: String) -> String {
            switch value {
            case 1:
                return "1 \(singular)"
            case let pluralValue:
                return "\(pluralValue) \(plural)"
            }
        }
        minutesLabel.text = pluralize(minutes, "minute", "minutes")
        secondsLabel.text = pluralize(seconds, "second", "seconds")
    }

}
