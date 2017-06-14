//
//  ViewController.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lyricTextView: UITextView!
    
    @IBAction func resetLyric(_ sender: Any) {
        nameTextField.text = ""
        lyricTextView.text = ""
    }
    
    @IBAction func displayLyric(_ sender: Any) {
        lyricTextView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameTextField.text!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension ViewController {
    func shortNameFromName(fullName: String) -> String{
        
        let lowerCaseName = fullName.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        if let vowelSet = lowerCaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
            print (lowerCaseName)
            return lowerCaseName.substring(to: vowelSet.lowerBound)
        }
        return lowerCaseName
    }

    
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        
        let shortName = shortNameFromName(fullName: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
    
}
