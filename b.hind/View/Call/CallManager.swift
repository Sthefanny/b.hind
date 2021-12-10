//
//  CallManager.swift
//  b.hind
//
//  Created by HANNA P C FERREIRA on 27/11/21.
//

import AVKit

enum SoundOption: String {
    case number9
    case ringtone
    case proposal
    case options
    case call1
    case call2
    case call3
}


class CallManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    @Published var viewModel = CallViewModel()
    
    @Published var shouldGo = false
    
    var player: AVAudioPlayer?
    
    static let instance = CallManager()
    
    func playSound(sound: SoundOption) {
        stopSound()
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: sound == .ringtone ? ".mp3" : ".m4a") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            stopSound()
            player?.play()
            viewModel.hasFinished = .hasStarted
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
        
    }
    
    func stopSound() {
        player?.stop()
        viewModel.hasFinished = .hasStopped
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
        print("here")
        viewModel.hasFinished = .hasPlayedAll
        viewModel.shouldNavigate = true
        shouldGo = true
    }
}
