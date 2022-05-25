//
//  ViewController.swift
//  5words
//
//  Created by Nikita Efimov on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var InfoLabel: UILabel!
    
    @IBOutlet var Label1: UILabel!
    
    @IBOutlet var Label2: UILabel!
    
    @IBOutlet var Label3: UILabel!
    
    @IBOutlet var Label4: UILabel!
    
    @IBOutlet var Label5: UILabel!
    
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        let questWord = "12345"
        var moddifiedQuestWord = questWord
        var word: String = ""
        word = Input.text ?? ""
        if (word.count < 5 || word.count > 5) {
            InfoLabel.text = "Введите корректное слово"
        } else {
            var first = String.Index(encodedOffset: 1)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label1.backgroundColor = UIColor.green
            } else if moddifiedQuestWord.contains(word.substring(to: first)) {
                Label1.backgroundColor = UIColor.yellow
            }
            Label1.text = word.substring(to: first)
            let removefirst = String.Index(encodedOffset: 0)
            word.remove(at: removefirst)
            first = String.Index(encodedOffset: 1)
            Label2.text = word.substring(to: first)
            word.remove(at: removefirst)
            first = String.Index(encodedOffset: 1)
            Label3.text = word.substring(to: first)
            word.remove(at: removefirst)
            first = String.Index(encodedOffset: 1)
            Label4.text = word.substring(to: first)
            word.remove(at: removefirst)
            first = String.Index(encodedOffset: 1)
            Label5.text = word.substring(to: first)
            
            InfoLabel.text = "Введите слово из 5 букв"
    
            
        }
        
    }
    

    @IBOutlet var Input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

