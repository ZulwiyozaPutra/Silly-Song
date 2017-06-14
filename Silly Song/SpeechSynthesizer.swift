//
//  SpeechSynthesizer.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import AVFoundation

class SpeechSynthesizer: AVSpeechSynthesizer {
    var rate: Float
    var pitchMultiplier: Float
    var volume: Float
    
    init(rate: Float, pitchMultiplier: Float, volume: Float) {
        self.rate = rate
        self.pitchMultiplier = pitchMultiplier
        self.volume = volume
    }
    
    func speak(_ text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = self.rate
        speechUtterance.pitchMultiplier = self.pitchMultiplier
        speechUtterance.volume = self.volume
        
        self.speak(speechUtterance)
    }
}
