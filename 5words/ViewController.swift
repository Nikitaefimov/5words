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
    
    @IBOutlet var Label6: UILabel!
    
    @IBOutlet var Label7: UILabel!
    
    @IBOutlet var Label8: UILabel!
        
    @IBOutlet var Label9: UILabel!
    
    @IBOutlet var Label10: UILabel!
    
    @IBOutlet var Label11: UILabel!
    
    @IBOutlet var Label12: UILabel!
    
    @IBOutlet var Label13: UILabel!
    
    @IBOutlet var Label14: UILabel!
        
    @IBOutlet var Label15: UILabel!
    
    @IBOutlet var Label16: UILabel!
    
    @IBOutlet var Label17: UILabel!
    
    @IBOutlet var Label18: UILabel!
    
    @IBOutlet var Label19: UILabel!
    
    @IBOutlet var Label20: UILabel!
    
    @IBOutlet var Label21: UILabel!
    
    @IBOutlet var Label22: UILabel!
    
    @IBOutlet var Label23: UILabel!
    
    @IBOutlet var Label24: UILabel!
    
    @IBOutlet var Label25: UILabel!
    
    @IBOutlet var allLabels: [UILabel]!
    
    @IBOutlet var SubmitButtonOutlet: UIButton!
    
    @IBOutlet var StartNewGameButtonOutlet: UIButton!
    
    var questWord = ""
    
    @IBAction func StartNewGameButton(_ sender: UIButton) {
        prepareNewGame()
        getQuestword()
    }
    
    
    func getQuestword() {
        
        var isWordFound = false
        
        guard let url = URL(string: "https://fish-text.ru/get?type=paragraph&format=json") else{ return }
        let session = URLSession.shared
        session.dataTask(with: url) {(data,response,error) in
            guard let data = data else {
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                do {
                    let sentense = try JSONDecoder().decode(Sentense.self, from: data)
                    let fullSentence = sentense.text.components(separatedBy: " ")
                    for word in fullSentence {
                        if (word.count == 5 && !word.contains("-") && !word.contains(":") && !word.contains(".") && !word.contains(",")) {
                            isWordFound = true
                            self.questWord = word
                            print(self.questWord)
                        }
                    }
                    
                } catch{
                    print(error)
                }
                
                
            } catch {print(error)}

        }.resume()
    }
    
    var count = 0;
        
    
    func prepareNewGame(){
        count = 0
        for label in allLabels {
            label.backgroundColor = UIColor.blue
            label.text = ""
        }
        InfoLabel.text = "Введите слово из 5 букв"
        StartNewGameButtonOutlet.isHidden = true
        SubmitButtonOutlet.isHidden = false
    }
    
    func checkRowColor(label1: UILabel, label2: UILabel, label3: UILabel, label4: UILabel, label5: UILabel) -> Bool {
        var allGreen: Bool = false
        if(label1.backgroundColor == UIColor.green && label2.backgroundColor == UIColor.green && label3.backgroundColor == UIColor.green && label4.backgroundColor == UIColor.green
           && label5.backgroundColor == UIColor.green) {allGreen = true}
        return allGreen
    }
    
    func fillLabels(questWord: String, label1: UILabel, label2: UILabel, label3: UILabel, label4: UILabel, label5: UILabel) {
        var moddifiedQuestWord = questWord
        var word: String = ""
        word = Input.text ?? ""
        if (word.count < 5 || word.count > 5) {
            InfoLabel.text = "Введите корректное слово"
        } else {
            var first = String.Index(encodedOffset: 1)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                label1.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                label1.backgroundColor = UIColor.yellow
            } else {label1.backgroundColor = UIColor.blue}
            label1.text = word.substring(to: first)
            let removefirst = String.Index(encodedOffset: 0)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                label2.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                label2.backgroundColor = UIColor.yellow
            } else {label2.backgroundColor = UIColor.blue}
            label2.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                label3.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                label3.backgroundColor = UIColor.yellow
            } else {label3.backgroundColor = UIColor.blue}
            label3.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                label4.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                label4.backgroundColor = UIColor.yellow
            } else {label4.backgroundColor = UIColor.blue}
            label4.text = word.substring(to: first)
            word.remove(at: removefirst)
            moddifiedQuestWord.remove(at: removefirst)
            if (word.substring(to: first)) == (moddifiedQuestWord.substring(to: first)) {
                label5.backgroundColor = UIColor.green
            } else if questWord.contains(word.substring(to: first)) {
                label5.backgroundColor = UIColor.yellow
            } else {label5.backgroundColor = UIColor.blue}
            label5.text = word.substring(to: first)
            
            InfoLabel.text = "Введите слово из 5 букв"
            count+=1
            if(checkRowColor(label1: label1, label2: label2, label3: label3, label4: label4, label5: label5)) {
                StartNewGameButtonOutlet.isHidden = false
                InfoLabel.text = "Вы победили!"
                SubmitButtonOutlet.isHidden = true
            }
        }
    }
    
    
    @IBAction func SubmitButton(_ sender: UIButton) {
        debugLab.text = questWord
        switch count {
        case 0: fillLabels(questWord: questWord, label1: Label1, label2: Label2, label3: Label3, label4: Label4, label5: Label5)
        case 1: fillLabels(questWord: questWord, label1: Label6, label2: Label7, label3: Label8, label4: Label9, label5: Label10)
        case 2: fillLabels(questWord: questWord, label1: Label11, label2: Label12, label3: Label13, label4: Label14, label5: Label15)
        case 3: fillLabels(questWord: questWord, label1: Label16, label2: Label17, label3: Label18, label4: Label19, label5: Label20)
        case 4: fillLabels(questWord: questWord, label1: Label21, label2: Label22, label3: Label23, label4: Label24, label5: Label25)
            if (!checkRowColor(label1: Label21, label2: Label22, label3: Label23, label4: Label24, label5: Label25)) {
                InfoLabel.text = "Вы проиграли("
                StartNewGameButtonOutlet.isHidden = false
                SubmitButtonOutlet.isHidden = true
            }
            
        default:
            print("err")
        }
    }
    
    @IBOutlet var Input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

