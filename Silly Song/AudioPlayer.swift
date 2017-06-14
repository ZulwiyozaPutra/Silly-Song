//
//  AudioPlayer.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    var player: AVAudioPlayer!
    
     init(url: URL, rate: Float) {
        player = try? AVAudioPlayer(contentsOf: url)
        player.rate = rate
        player.enableRate = true
        player.prepareToPlay()
    }
    
    func play(){
        player.currentTime = 1
        player.play()
    }
    
    func stop(){
        player.stop()
        player.currentTime = 1
    }
}
