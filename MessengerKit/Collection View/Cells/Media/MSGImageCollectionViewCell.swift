//
//  MSGImageCollectionViewCell.swift
//  MessengerKit
//
//  Created by Stephen Radford on 11/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGImageCollectionViewCell: MSGMessageCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    override public var message: MSGMessage? {
        didSet {
          guard let message = message else {
            return;
          }

          if case let MSGMessageBody.image(image) = message.body {
            imageView.image = image
          }

          if case let MSGMessageBody.gif(images) = message.body {
            imageView.animationImages = images
            imageView.animationDuration = Double(images.count) * 0.06
            imageView.animationRepeatCount = 0
            imageView.startAnimating()
          }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.isUserInteractionEnabled = true   
    }

}
