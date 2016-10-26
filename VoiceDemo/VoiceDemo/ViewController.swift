//
//  ViewController.swift
//  VoiceDemo
//
//  Created by jingdi on 2016/10/27.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.playAudio()
    }
    
    
    func 播放音效() {
        let url = Bundle.main.url(forResource: "good", withExtension: "mp3")
        AudioManager().playSoundEffect(url: url!, shake: false)
    }
    func playAudio() {
        print(AudioManager.playMusic(filename: "xxoo.mp3"))
    }
}

