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
        
        while !isNameValid {
            let letters = Array(lowercasedName.characters)
            
            let firstLetter: Character = letters[0]
            
            let firstLetterString = String(firstLetter)
            
            let unicodeScalars = firstLetterString.unicodeScalars
            
            let unicodeScalarsValue = unicodeScalars[unicodeScalars.startIndex].value
            
            let unicodScalar = UnicodeScalar(unicodeScalarsValue)
            
            if !vowelSet.contains(unicodScalar!){
                lowercasedName = lowercasedName.substring(from: lowercasedName.characters.index(after: lowercasedName.characters.startIndex))
            } else{
                isNameValid = true
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
