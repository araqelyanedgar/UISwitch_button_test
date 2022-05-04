//
//  ViewController.swift
//  switcher-button
//
//  Created by Edgar Arakelyan on 03.05.22.
//

import UIKit

class ViewController: UIViewController {
    var button: UIButton!
    var uiswitch: UISwitch!
    var switchLabel: UILabel!
    var firstClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSwitchLabel()
        initButton()
        initUISwitch()
        constructHierrarchy()
        initConstraints()
        uiswitch.addTarget(self, action: #selector(self.switchValueDidChange), for: .valueChanged)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    @objc func switchValueDidChange(sender:UISwitch!) {
        if firstClick {
            button.isEnabled = true
        } else {
            button.isEnabled = false
        }
        firstClick.toggle()
    }
    
    @objc func buttonTapped() {
        button.backgroundColor = .systemOrange
    }
    
}

extension ViewController {
    fileprivate func initSwitchLabel() {
        switchLabel = UILabel()
        switchLabel.text = "Enable the Button"
        switchLabel.textColor = .black
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initUISwitch() {
        uiswitch = UISwitch()
        uiswitch.setOn(false, animated: true)
        uiswitch.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initButton() {
        button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("PLAY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func constructHierrarchy() {
        view.addSubview(switchLabel)
        view.addSubview(uiswitch)
        view.addSubview(button)
    }
    
    fileprivate func initConstraints() {
        NSLayoutConstraint.activate([
            switchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchLabel.bottomAnchor.constraint(equalTo: uiswitch.topAnchor, constant: -10),
            
            uiswitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiswitch.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -100),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
