//
//  VoiceMessageCell.swift
//  MessageKit
//
//  Created by Zeliang Shao on 02/02/2018.
//  Copyright © 2018 MessageKit. All rights reserved.
//

import UIKit

class VoiceMessageCell: MessageCollectionViewCell {
    open override class func reuseIdentifier() -> String { return "messagekit.cell.voice" }
    
    open lazy var playButtonView: PlayButtonView = {
        let playButtonView = PlayButtonView()
        return playButtonView
    }()
    
    lazy var messageLabel: MessageLabel = {
        let label = MessageLabel()
        label.text = "30:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    open func setupConstraints() {
//        imageView.fillSuperview()
//        playButtonView.centerInSuperview()
        playButtonView.constraint(equalTo: CGSize(width: 25, height: 25))
        
        let views = ["playButton": playButtonView, "messageLabel": messageLabel] as [String : Any]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[playButton]-10-[messageLabel]-(>=0)-|", options: .directionLeadingToTrailing, metrics: nil, views: views))
        playButtonView.centerYAnchor.constraint(equalTo: messageContainerView.centerYAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: messageContainerView.centerYAnchor).isActive = true
    }
    
    open override func setupSubviews() {
        super.setupSubviews()
        messageContainerView.addSubview(messageLabel)
        messageContainerView.addSubview(playButtonView)
        setupConstraints()
    }
    
    open override func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        super.configure(with: message, at: indexPath, and: messagesCollectionView)
        
        guard let displayDelegate = messagesCollectionView.messagesDisplayDelegate else {
            fatalError(MessageKitError.nilMessagesDisplayDelegate)
        }
        
        let textColor = displayDelegate.textColor(for: message, at: indexPath, in: messagesCollectionView)
        messageLabel.textColor = textColor
        
        switch message.data {
        case .voice(_ , let duration):
            let recordDuration = Int(ceil(duration))
            let (seconds, minutes) = (recordDuration % 60, recordDuration / 60)
            messageLabel.text = String(format: "%d:%02d", minutes, seconds)
        default:
            break
        }
        
//        switch message.data {
//        case .photo(let url, let image, _, _):
//            imageView.sd_setImage(with: url, placeholderImage: image, options: SDWebImageOptions(rawValue: 0), completed: nil)
//            playButtonView.isHidden = true
//        case .video(_, let image):
//            imageView.image = image
//            playButtonView.isHidden = false
//        default:
//            break
//        }
        
//        displayDelegate.configureMediaMessageImageView(imageView, for: message, at: indexPath, in: messagesCollectionView)
    }
    
}
