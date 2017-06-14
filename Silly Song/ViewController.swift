//
//  ViewController.swift
//  Silly Song
//
//  Created by Zulwiyoza Putra on 6/14/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>", "","<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    var songManager: SongManager!
    
    var speechSynthesizer: SpeechSynthesizer!
    
    var audioPlayer: AudioPlayer!
    
    var rate: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        songManager = SongManager(template: bananaFanaTemplate)
        speechSynthesizer = SpeechSynthesizer(rate: self.rateSliderOutlet.value, pitchMultiplier: 0.25, volume: 1.0)
        
        let audioName = "audio"
        
        if let path = Bundle.main.path(forResource: audioName, ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
            audioPlayer = AudioPlayer(url: url, rate: 1.0)
        }
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var lyricTextView: UITextView!
    
    @IBOutlet weak var rateSliderOutlet: UISlider!
    
    @IBAction func rateSlider(_ sender: Any) {
        let value = rateSliderOutlet.value
        self.rate = value
        speechSynthesizer.rate = self.rate
        audioPlayer.player.rate = self.rate * 4.0
        audioPlayer.stop()
        speechSynthesizer.stop()
    }
    
    
    @IBAction func resetLyric(_ sender: Any) {
        lyricTextView.text = "Enter your name to play the Silly Song"
        audioPlayer.stop()
        speechSynthesizer.stop()
    }
    
    @IBAction func displayLyric(_ sender: Any) {
        if !((nameTextField.text?.isEmpty)!) {
            songManager.customizeTemplate(withName: nameTextField.text!)
            lyricTextView.text = songManager.lyrics
            audioPlayer.play()
            speechSynthesizer.speak(songManager.lyrics)
        } else {
            alertController(title: "Name is Missing", message: "Please fill your name")
        }
        
    }
    
    private func alertController(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated  : true, completion: nil)
    }
    

}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
