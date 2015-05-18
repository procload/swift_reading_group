//
//  ViewController.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 4/29/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timerModel: TimerModel! {
        willSet(newModel) {
            println("About to change model to \(newModel)")
        }
        
        didSet {
            updateUserInterface()
        }
    }
    
    func setupModel() {
        timerModel = TimerModel(coffeeName: "Columbian Coffee", duration: 240);
    }
    
    func updateUserInterface() {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("Preparing for segue with identifier:\(segue.identifier)")
        
        if segue.identifier == "pushDetail" {
            if let viewController = segue.destinationViewController as? TimerDetailViewController {
                viewController.timerModel = timerModel
            } else {
                println("Error")
            }
        } else if segue.identifier == "editDetail" {
            if let navigationController = segue.destinationViewController as? UINavigationController, viewController = navigationController.topViewController as? TimerEditViewController {
                viewController.timerModel = timerModel
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Root"
        
        setupModel()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

