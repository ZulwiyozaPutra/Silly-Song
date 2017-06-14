//
//  AudioPlayer.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer: AVAudioPlayer {
    var audioPlayer: AVAudioPlayer!
    
    init(_ url: URL) {
        super.init()
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
    }
    
    func playAudio(){
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }
    
    func stopAudio(){
        audioPlayer.stop()
    }
}
