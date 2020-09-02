//
//  ViewController.swift
//  Case Match
//
//  Created by Colby Holmstead on 10/26/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var usedNumbers: [Int] = []
    var matchCount = 0
    var letters: Array  = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var buttonIsAactive = true
    var buttonOne = ""
    var buttonTwo = ""
    
    @IBOutlet var countdownLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
        // Do any additional setup after loading the view.
    }
    
    func newRound(){
        countdownLabel.text = ""
        matchCount = 0
        for button in letterButtons{
            
            button.isEnabled = true
        }
        
        setLetterButtonTitle()
        letters  = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        for button in letterButtons{
            button.backgroundColor = nil
        }
        
    }
    
    func setLetterButtonTitle(){
        for button in letterButtons{
            
            var shuffled = [String]();
            for _ in 0..<letters.count
            {
                let rand = Int(arc4random_uniform(UInt32(letters.count)))
                shuffled.append(letters[rand])
                letters.remove(at: rand)
            }
            letters = shuffled
            for letter in letters{
                button.setTitle(letter, for: .normal)
            }
            if !letters.isEmpty{
                letters.removeLast()
            }
            
            button.titleLabel?.font =  .systemFont(ofSize: 55)
        }
    }
    
    
    
    struct Game {
        var won:String
        var lose:String
        var buttonValue:String
        
        
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset")
        newRound()
    }
    
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let letterTapped = sender.title(for: .normal)!
        
        //        print(letterTapped.lowercased())
        
        if buttonOne == ""{
            buttonOne = letterTapped
        }else{
            buttonTwo = letterTapped
        }
        
        print(buttonOne, buttonTwo)
        
        
        if sender.backgroundColor == UIColor.green{
            sender.backgroundColor = nil
            buttonOne = ""
            buttonTwo = ""
        }else{
            sender.backgroundColor = UIColor.green
            
            
        }
        
        
        if buttonOne != "" && buttonTwo != ""{
            // check to see if even
            
            if buttonOne.lowercased() == buttonTwo.lowercased(){
                if sender.backgroundColor == UIColor.green{
                    sender.isEnabled = false
                    for button in letterButtons{
                        if button.titleLabel?.text?.lowercased() == buttonOne.lowercased()
                        {
                            button.isEnabled = false
                            button.backgroundColor = UIColor.darkGray
                            matchCount += 1
                            print(matchCount)
                        }                    }
                    
                    
                    sender.backgroundColor = UIColor.darkGray
                    print(buttonTwo, buttonOne)
                    
                    
                    buttonTwo = ""
                    buttonOne = ""
                    
                    
                    
                }
                
            }else if buttonTwo.lowercased() != buttonOne.lowercased(){
                
                buttonTwo = ""
                sender.backgroundColor = nil
                
            }
            
            
            if matchCount == 52{
                countdownLabel.text = "😀"
            }
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}





