//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Lori Kingshott on 1/14/15.
//  Copyright (c) 2015 LoriKingshott. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController {
    
    

    @IBOutlet weak var recordinginProgress: UILabel!

 required init(coder aDecoder: NSCoder) {

    
    @IBOutlet weak var stopButton: UIButton!
    

    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder;


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }

    @IBAction func stopRecording(sender: UIButton) {
        recordinginProgress.hidden = true
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance();
        audioSession.setActive(false, error: nil)
        
    }

    @IBAction func recordAudio(sender: UIButton) {
        stopButton.hidden = false
        recordinginProgress.hidden = false
        
        //Todo: Record the user's voice
      let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        var currentDateTime = NSDate()
        var formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        var recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        var pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.meteringEnabled = true
        audioRecorder.record()
        
        println("in recordAudio")
        
        
    }
}

