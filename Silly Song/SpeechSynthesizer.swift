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
    
    var speechDelegate: AVSpeechSynthesizerDelegate?
    
    override init() {
        super.init()
        self.speechDelegate = self.delegate
    }
    
    func speak(_ text: String, rate: Float, pitchMultiplier: Float, volume: Float) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.rate = rate
        speechUtterance.pitchMultiplier = pitchMultiplier
        speechUtterance.volume = volume
        
        self.speak(speechUtterance)
    }
    
    func stop() {
        let speechBoundary = AVSpeechBoundary.word
        self.stopSpeaking(at: speechBoundary)
    }
}
