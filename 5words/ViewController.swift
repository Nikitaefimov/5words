//
//  ViewController.swift
//  5words
//
//  Created by Nikita Efimov on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var debugLab: UILabel!
    
    @IBOutlet var InfoLabel: UILabel!
    
    @IBOutlet var Label1: UILabel!
    
    @IBOutlet var Label2: UILabel!
    
    @IBOutlet var Label3: UILabel!
    
    @IBOutlet var Label4: UILabel!
    
    @IBOutlet var Label5: UILabel!
    
    func fillLabels(label1: UILabel, label2: UILabel, label3: UILabel, label4: UILabel, label5: UILabel ) {
        
    }
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        
        let questWord = "coolm"
        var moddifiedQuestWord = questWord
        var word: String = ""
        word = Input.text ?? ""
        
        if (word.count < 5 || word.count > 5) {
            InfoLabel.text = "Введите корректное слово"
        } else {
            var first = String.Index(encodedOffset: 1)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label1.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                Label1.backgroundColor = UIColor.yellow
            } else {Label1.backgroundColor = UIColor.blue}
            Label1.text = word.substring(to: first)
            let removefirst = String.Index(encodedOffset: 0)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label2.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                Label2.backgroundColor = UIColor.yellow
            } else {Label2.backgroundColor = UIColor.blue}
            Label2.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label3.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                Label3.backgroundColor = UIColor.yellow
            } else {Label3.backgroundColor = UIColor.blue}
            Label3.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label4.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                Label4.backgroundColor = UIColor.yellow
            } else {Label4.backgroundColor = UIColor.blue}
            Label4.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                Label5.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                Label5.backgroundColor = UIColor.yellow
            } else {Label5.backgroundColor = UIColor.blue}
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

