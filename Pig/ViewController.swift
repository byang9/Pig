//
//  ViewController.swift
//  Pig
//
//  Created by Bowen Yang on 11/15/15.
//  Copyright © 2015 Udemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dieRoll:Int = 0
    var p1turn = true
    var P1total:Int = 0
    var P2total:Int = 0
    var turnTotal:Int = 0
    var counter = 0;
    var timer = NSTimer()
    
    @IBOutlet var instruction: UILabel!
    @IBOutlet var P1Label: UILabel!
    @IBOutlet var P2Label: UILabel!
    @IBOutlet var P1turnPoints: UILabel!
    @IBOutlet var P1heldPoint: UILabel!
    @IBOutlet var P2turnPoint: UILabel!
    @IBOutlet var P2heldPoint: UILabel!
    @IBOutlet var imageView: UIImageView!
    

    @IBAction func rollDie(sender: AnyObject) {
        P1Label.text = p1Name
        P2Label.text = p2Name
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector:Selector("updatePicture"), userInfo: nil, repeats: true)
        }
    }
    
    func updatePicture(){
        if counter < 6 {
            dieRoll = Int(rand()/(RAND_MAX/6))+1
            imageView.image = UIImage(named: "\(dieRoll).png")
            counter++
            print(dieRoll)
        }
        else{
            addTurnPoints()
            timer.invalidate()
            counter = 0
        }
    }
    
    func addTurnPoints(){
        if(dieRoll == 1){
            turnTotal = 0
            if(p1turn){
                instruction.text = "\(p1Name), you rolled a 1. Turn ends.\(p2Name) turn."
                P1turnPoints.text = "Turn Points: \(turnTotal)"
            }
            else{
                instruction.text = "\(p2Name), you rolled a 1. Turn ends.\(p1Name) turn."
                P2turnPoint.text = "Turn Points: \(turnTotal)"
            }
            p1turn = !p1turn
        }
        else{
            turnTotal += dieRoll
            if(p1turn){
                P1turnPoints.text = "Turn Points: \(turnTotal)"
                instruction.text = "\(p1Name) you rolled a \(dieRoll), do you want to roll or hold?"
            }
            else{
                P2turnPoint.text = "Turn Points: \(turnTotal)"
                instruction.text = "\(p2Name) you rolled a \(dieRoll), do you want to roll or hold?"
            }
        }
    }
    
    @IBAction func hold(sender: AnyObject) {
        if(p1turn){
            P1total += turnTotal
            turnTotal = 0
            P1turnPoints.text = "Turn Points: \(turnTotal)"
            P1heldPoint.text = "Held Points: \(P1total)"
            instruction.text = "\(p2Name), do you want to roll or hold?"
        }
        else{
            P2total += turnTotal
            turnTotal = 0
            P2turnPoint.text = "Turn Points: \(turnTotal)"
            P2heldPoint.text = "Held Points: \(P2total)"
            instruction.text = "\(p1Name), do you want to roll or hold?"
        }
        didWin()
        p1turn = !p1turn
    }
    override func viewDidLoad() {
        instruction.text = "\(p1Name), do you want to roll or hold?"
        P1Label.text = p1Name
        P2Label.text = p2Name
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func didWin(){
        if(P1total > 100){
            instruction.text = "Congrats \(p1Name) you have won!"
        }
        if(P2total > 100){
            instruction.text = "Congrats \(p2Name) you have won!"
        }
    }


}

