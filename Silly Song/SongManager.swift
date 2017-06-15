//
//  SongManager.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import UIKit

class SongManager {
    var template: String
    var lyrics: String
    
    init(template: String) {
        self.template = template
        self.lyrics = ""
    }
    
    private func shortNameFromName(_ name: String) -> String {
        
        var isNameValid = false
        let vowelSet = CharacterSet(charactersIn: "aàáâäæãåāeèéêëēėęiîïíīįìuûüùúūoôöòóœøōõ")
        
        var lowercasedName = name.lowercased()
        let originalLowerCasedName = name.lowercased()
        
        while !isNameValid {
            let letters = Array(lowercasedName.characters)
            
            if  letters.count != 0 {
                
                let firstLetter: Character = letters[0]
                
                print(firstLetter)
                
                let firstLetterString = String(firstLetter)
                
                print(firstLetterString)
                
                let unicodeScalars = firstLetterString.unicodeScalars
                
                print(unicodeScalars)
                
                let unicodeScalarsValue = unicodeScalars[unicodeScalars.startIndex].value
                
                print(unicodeScalarsValue)
                
                if let unicodeScalar = UnicodeScalar(unicodeScalarsValue) {
                    print(unicodeScalar)
                    
                    if !vowelSet.contains(unicodeScalar){
                        let index = lowercasedName.characters.index(after: lowercasedName.characters.startIndex)
                        lowercasedName = lowercasedName.substring(from: index)
                        print(lowercasedName)
                    } else{
                        isNameValid = true
                    }
                }
            } else {
                
                isNameValid = true
                
                return originalLowerCasedName
            }
        }
        
        return lowercasedName
    }

    
    
    @discardableResult func customizeTemplate(withName name: String) -> String {
        let shortName = shortNameFromName(name)
        self.lyrics = self.template.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        self.lyrics = self.lyrics.replacingOccurrences(of: "<FULL_NAME>", with: name)
        return self.lyrics
    }

}
