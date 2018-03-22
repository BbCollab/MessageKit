//
//  CallMessageCell.swift
//  MessageKit
//
//  Created by Zeliang Shao on 02/02/2018.
//  Copyright © 2018 MessageKit. All rights reserved.
//

import UIKit

class CallMessageCell: MessageCollectionViewCell {
    open override class func reuseIdentifier() -> String { return "messagekit.cell.call" }
    
//    open var callView: UIImageView = {
//        let view = UIImageView()
//        return view
//    }()
    open var messageLabel: MessageLabel = {
        let view = MessageLabel()
        return view
    }()
    
    open override func setupSubviews() {
        super.setupSubviews()
//        messageContainerView.addSubview(callView)
        messageContainerView.addSubview(messageLabel)
    }
    
    open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? MessagesCollectionViewLayoutAttributes {
            messageLabel.textInsets = attributes.messageLabelInsets
            messageLabel.font = attributes.messageLabelFont
            messageLabel.frame = messageContainerView.bounds
        }
    }

    open override func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        super.configure(with: message, at: indexPath, and: messagesCollectionView)
        guard let displayDelegate = messagesCollectionView.messagesDisplayDelegate else {
            fatalError(MessageKitError.nilMessagesDisplayDelegate)
        }
        
        let textColor = displayDelegate.textColor(for: message, at: indexPath, in: messagesCollectionView)
        switch message.data {
        case .call(let text , _ , _)://let onlyAudio
            messageLabel.text = text
        default:
            break
        }
        messageLabel.textColor = textColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
    }

}
