//
//  ViewCell.swift
//  Workshop
//
//  Created by JingZhao on 1/11/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

class ViewCell : UITableViewCell {
    
    let keyLabel = UILabel()
    let valueLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        contentView.addSubview(keyLabel)
        contentView.addSubview(valueLabel)
        keyLabel.textColor = UIColor.gray
    }
    
    private func setupConstraints() {
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        keyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        keyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        keyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80).isActive = true
    }
    
}
