//
//  ViewController.swift
//  switcher-button
//
//  Created by Edgar Arakelyan on 03.05.22.
//

import UIKit

class ViewController: UIViewController {
    var playButton: UIButton!
    var switcher: UISwitch!
    var instructionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSwitchLabel()
        initButton()
        initUISwitch()
        constructHierarchy()
        activateConstraints()
        switcher.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        playButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func switchValueDidChange(sender: UISwitch) {
        if sender.isOn {
            playButton.backgroundColor = .systemBlue
        } else {
            playButton.backgroundColor = .systemGray
        }
        playButton.isEnabled = sender.isOn
    }
    
    @objc func buttonTapped() {
        print("OKAY")
    }
    
}
extension ViewController {
    fileprivate func initSwitchLabel() {
        instructionLabel = UILabel()
        instructionLabel.text = "Enable the Button"
        instructionLabel.textColor = .black
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initUISwitch() {
        switcher = UISwitch()
        switcher.setOn(false, animated: true)
        switcher.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initButton() {
        playButton = UIButton(type: .system)
        playButton.backgroundColor = .systemGray
        playButton.setTitle("PLAY", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.layer.cornerRadius = 10
        playButton.isEnabled = false
        playButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func constructHierarchy() {
        view.addSubview(instructionLabel)
        view.addSubview(switcher)
        view.addSubview(playButton)
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            instructionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionLabel.bottomAnchor.constraint(equalTo: switcher.topAnchor, constant: -10),
            
            switcher.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switcher.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -100),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 50),
            playButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
