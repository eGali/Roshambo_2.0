//
//  ViewController.swift
//  Roshambo
//
//  Created by Edgar on 7/8/16.
//  Copyright © 2016 Edgar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerChoice = 9
    var history = [History]()
    @IBOutlet weak var historyMainView: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "startGame"){
            let controller = segue.destinationViewController as! ResultViewController
            controller.playerChoice = playerChoice
            if(!history.isEmpty){
             controller.historyArray = self.history
            }
            controller.compChoice = randomNumber()
        }
        if(segue.identifier == "toHistory"){
            let controller = segue.destinationViewController as! HistoryViewController
            controller.history = self.history
        }
    }
    
    func randomNumber() -> Int{
        let randomValue = 1 + arc4random() % 3
        
        return Int(randomValue)
    }
    @IBAction func paperPlayed(sender: AnyObject) {
        playerChoice = 1
        transfer()
    }
    @IBAction func scissorPlayed(sender: AnyObject) {
        playerChoice = 2
        transfer()
    }
    @IBAction func rockPlayed(sender: AnyObject) {
        playerChoice = 3
        transfer()
    }
    
    func transfer(){
        performSegueWithIdentifier("startGame", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(history.isEmpty){
            historyMainView.enabled = false
        }
        else{
            historyMainView.enabled = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

