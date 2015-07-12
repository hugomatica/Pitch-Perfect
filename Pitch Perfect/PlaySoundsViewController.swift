//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Lori Kingshott on 1/15/15.
//  Copyright (c) 2015 LoriKingshott. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
        var filePathUrl = NSURL.fileURLWithPath(filePath)
        audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
            
        }
        
    else {
    println("the filePath is empty")
    }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playRecordingSlowly(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }

    @IBAction func playRecordingFast(sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.rate = 1.5
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    

    @IBAction func stopSecondTime(sender: UIButton) {
    audioPlayer.stop()
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
