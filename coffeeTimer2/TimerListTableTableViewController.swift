//
//  TimerListTableTableViewController.swift
//  coffeeTimer2
//
//  Created by Ryan Merrill on 5/26/15.
//  Copyright (c) 2015 procload. All rights reserved.
//

import UIKit

class TimerListTableTableViewController: UITableViewController {
    
    var coffeeTimers: [TimerModel]!
    var teaTimers: [TimerModel]!
    var delegate: TimerEditViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        coffeeTimers = [
            TimerModel(name: "Colombian", duration: 240, type: .Coffee),
            TimerModel(name: "Mexican", duration: 200, type: .Coffee)
        ]
        teaTimers = [
            TimerModel(name: "Green Tea", duration: 400, type: .Tea),
            TimerModel(name: "Oolong", duration: 400, type: .Tea),
            TimerModel(name: "Rooibos", duration: 480, type: .Tea)
        ]
        
        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if presentedViewController != nil {
            tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return coffeeTimers.count
        } else { // Must be section 1
            return teaTimers.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let timerModel: TimerModel = {
            if indexPath.section == 0 {
                return self.coffeeTimers[indexPath.row]
            } else {
                return self.teaTimers[indexPath.row]
            }
        }()
        
        cell.textLabel?.text = timerModel.name

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.editing {
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            performSegueWithIdentifier("editDetail", sender: cell)
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Coffees"
        } else { // Must be section 1
            return "Teas"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPathForCell(cell)!
            
            let timerModel: TimerModel = {
                if indexPath.section == 0 {
                    return self.coffeeTimers[indexPath.row]
                } else {
                    return self.teaTimers[indexPath.row]
                }
            }()
            
            if segue.identifier == "pushDetail" {
                let detailViewController = segue.destinationViewController as! TimerDetailViewController
                detailViewController.timerModel = timerModel
            } else if segue.identifier == "editDetail" {
                let navigationController = segue.destinationViewController as! UINavigationController
                let editViewController = navigationController.topViewController as! TimerEditViewController
                
                editViewController.timerModel = timerModel
                editViewController.delegate = self
            }
        } else if let addButton = sender as? UIBarButtonItem {
            if segue.identifier == "newTimer" {
                let navigationController = segue.destinationViewController as! UINavigationController
                let editViewController = navigationController.topViewController as! TimerEditViewController
                
                editViewController.creatingNewTimer = true
                editViewController.timerModel = TimerModel(name: "", duration: 240, type: .Coffee)
                editViewController.delegate = self
            }
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "pushDetail" {
            // Do not go to the detail view if in editing mode
            if tableView.editing {
                return false
            }
        }
        
        return true
    }

}

extension TimerListTableTableViewController: TimerEditViewControllerDelegate {
    func timerEditViewControllerDidCancel(viewController: TimerEditViewController) {
        
    }
    
    func timerEditViewControllerDidSave(viewController: TimerEditViewController) {
        let model = viewController.timerModel
        let type = model.type
        
        if type == .Coffee {
            if !contains(coffeeTimers, model) {
                coffeeTimers.append(model)
            }
            
            // Checks if item is in the teaTimers array
            // and if so, remove it.
            teaTimers = teaTimers.filter({ (item) -> Bool in
                return item != model
            })
        } else { //Type must be tea
            if !contains(teaTimers, model) {
                teaTimers.append(model)
            }
            
            coffeeTimers = coffeeTimers.filter({ (item) -> Bool in
                return item != model
            })
        }
    }
}
