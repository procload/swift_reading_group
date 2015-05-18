//
//  TimerDetailViewController.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 5/5/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import UIKit

class TimerDetailViewController: UIViewController {
    
    @IBOutlet weak var durationLabel: UILabel!
    
    var timerModel: TimerModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = timerModel.coffeeName
        durationLabel.text = "\(timerModel.duration / 60) min \(timerModel.duration % 60) sec"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
