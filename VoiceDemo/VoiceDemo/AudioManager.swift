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
    
    static var musics = [String: AnyObject]()
    
    // MARK: - 音乐控制
    /// 播放音乐
    class func playMusic(filename: String!) -> Bool {
        
        if let player = musics[filename] as? AVAudioPlayer {
            print("音频时长:\(player.duration) 音频路径:\(player.url)")
            if !player.isPlaying {
                return player.play()
            }
        } else {
            guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else { return false }
            let player = try! AVAudioPlayer(contentsOf: url)
            print("音频时长:\(player.duration) 音频路径:\(player.url)")
            guard player.prepareToPlay() else { return false }
            musics[filename] = player
            print(musics)
            if !player.isPlaying {
                return player.play(atTime: 10)
            }
        }
        return true
    }
    /// 暂停音乐
    class func pauseMusic(filename: String!) {
        if let player = musics[filename] as? AVAudioPlayer {
            if player.isPlaying {
                player.pause()
            }
        }
    }
    /// 停止音乐
    class func stopMusic(filename: String!) {
        (musics[filename] as? AVAudioPlayer)?.stop()
        musics.removeValue(forKey: filename)
    }
    
    // MARK: - 音效控制
    /// 播放音效
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
