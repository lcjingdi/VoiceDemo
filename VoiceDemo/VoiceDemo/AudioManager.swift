//
//  AudioManager.swift
//  VoiceDemo
//
//  Created by jingdi on 2016/10/27.
//  Copyright © 2016年 lcjingdi. All rights reserved.
//

import UIKit
import AVFoundation

class AudioManager: NSObject {

    /// : 播放音效
    
    func playSoundEffect(url: URL ,shake: Bool) {
        
        var soundId = SystemSoundID()
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        if shake {
            AudioServicesPlayAlertSound(soundId)
        } else {
            AudioServicesPlaySystemSound(soundId)
        }
        
    }
}
