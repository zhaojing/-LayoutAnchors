//
//  InfoView.swift
//  Workshop
//
//  Created by JingZhao on 1/11/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let button = UIButton()
    fileprivate var regularConstraints = [NSLayoutConstraint]()
    fileprivate var compactConstraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupName()
        setupAddress()
        setupButton()
    }
    
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabelTop = nameLabel.topAnchor.constraint(equalTo: topAnchor)
        let nameLabelLeading = nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        let addressTop = addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.0)
        let addressLeading = addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        let buttonTrailing = button.trailingAnchor.constraint(equalTo: trailingAnchor)
        let buttonHeight = button.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([nameLabelTop, nameLabelLeading, addressTop, addressLeading, buttonTrailing,buttonHeight])
        
        compactConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor))
        compactConstraints.append(addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        compactConstraints.append(button.leadingAnchor.constraint(equalTo: leadingAnchor))
        compactConstraints.append(button.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10))
        compactConstraints.append(button.bottomAnchor.constraint(equalTo: bottomAnchor))
        
        regularConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10))
        regularConstraints.append(addressLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor))
        regularConstraints.append(addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        regularConstraints.append(button.topAnchor.constraint(equalTo: nameLabel.topAnchor))
        regularConstraints.append(button.widthAnchor.constraint(equalToConstant: 150))
    }
    
    private func setupName() {
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        addSubview(nameLabel)
    }
    
    private func setupAddress() {
        addressLabel.font = UIFont.systemFont(ofSize: 15)
        addressLabel.numberOfLines = 0
        addressLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
        addSubview(addressLabel)
    }
    
    private func setupButton() {
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 2.0
        addSubview(button)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .regular {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
}
