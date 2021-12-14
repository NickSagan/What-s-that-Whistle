//
//  RecordWhistleViewController.swift
//  What's that Whistle
//
//  Created by Nick Sagan on 14.12.2021.
//

import UIKit
import AVFoundation

class RecordWhistleViewController: UIViewController {
    var stackView: UIStackView!
    var recordButton: UIButton!

    var recordingSession: AVAudioSession!
    var whistleRecorder: AVAudioRecorder!
    
    override func loadView() {
        view = UIView()

        view.backgroundColor = UIColor.gray

        stackView = UIStackView()
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackView.Distribution.fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        view.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Record your whistle"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Record", style: .plain, target: nil, action: nil)

        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        self.loadFailUI()
                    }
                }
            }
        } catch {
            self.loadFailUI()
        }
    }

    func loadRecordingUI() {
    }

    func loadFailUI() {
    }
}
