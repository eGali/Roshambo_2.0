//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Edgar on 7/8/16.
//  Copyright © 2016 Edgar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var playerChoice: Int?
    var compChoice: Int?
    var historyArray = [History]()

    @IBOutlet weak var winText: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var resultText: UILabel!
    func runGame(){
        var result = "some"
        var win = "some"
        var player = "some"
        var comp = "some"
        var displayImage = "some"
        switch(playerChoice){
        case (1?):
            player = "paper"
        case (2?):
            player = "scissor"
        default:
            player = "rock"
        }
        switch(compChoice){
        case (1?):
            comp = "paper"
        case (2?):
            comp = "scissor"
        default:
            comp = "rock"
        }
        
        switch(playerChoice, compChoice){
        case (1?, 3?), (2?, 1?), (3?, 2?):
            result = "You Win!"
            resultText.text = result
            win = "Your \(player) beats \(comp)!"
            winText.text = win
            displayImage = "\(player)Wins"
        case (1?, 1?), (2?, 2?), (3?, 3?):
            result = "Its a tie!"
            resultText.text = result
            win = "No one wins!"
            winText.text = win
            displayImage = "tie"
        default:
            result = "You Lose!"
            resultText.text = result
            win = "\(comp) beats your \(player)!"
            winText.text = win
            displayImage = "\(comp)Wins"
        }
        
        resultImage.image = UIImage(named: displayImage)
        
        historyArray.append(History(dictionary: [History.imageKey: displayImage, History.resultKey: result, History.playKey: win]))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runGame()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toHistory"){
            let controller = segue.destinationViewController as! HistoryViewController
            controller.history = self.historyArray
        }
        if(segue.identifier == "backToMain"){
            let controller = segue.destinationViewController as! ViewController
            controller.history = self.historyArray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
