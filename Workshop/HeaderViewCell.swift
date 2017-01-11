//
//  HeaderView.swift
//  Workshop
//
//  Created by JingZhao on 1/11/17.
//  Copyright © 2017 JingZhao. All rights reserved.
//

import UIKit

class HeaderViewCell : UITableViewCell {
    
    fileprivate let headerImageView = UIImageView()
    fileprivate let infoView = InfoView()
    fileprivate var aspectRatio: CGFloat = 1.0
    fileprivate var aspectRatioConstraint: NSLayoutConstraint?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellWithViewModel(viewModel: ViewModel) {
        headerImage = UIImage(named: viewModel.imageName)
        infoView.nameLabel.text = viewModel.name
        infoView.addressLabel.text = viewModel.address
        infoView.button .setTitle(viewModel.buttonTitle, for: .normal)
    }
    
    var headerImage: UIImage? {
        didSet {
            headerImageView.image = headerImage
            setNeedsUpdateConstraints()
        }
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        updateImageConstraints()
    }
    
    private func setup() {
        headerImageView.contentMode = .scaleAspectFit
        contentView.addSubview(headerImageView)
        contentView.addSubview(infoView)
    }
    
    private func setupConstraints() {
        imageConstraints()
        infoConstraints()
    }
    
    private func imageConstraints() {
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        headerImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        headerImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    private func updateImageConstraints() {
        var aspectRatio: CGFloat = 1
        if let image = headerImageView.image {
            aspectRatio = image.size.height / image.size.width
        }
        aspectRatioConstraint?.isActive = false
        aspectRatioConstraint = headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor, multiplier: aspectRatio)
        aspectRatioConstraint?.isActive = true
    }
    
    private func infoConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15).isActive = true
        infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -15).isActive = true
        infoView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 10).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
