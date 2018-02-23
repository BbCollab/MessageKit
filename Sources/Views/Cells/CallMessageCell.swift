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
    
    open var callView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    open var callLabel: MessageLabel = {
        let view = MessageLabel()
        return view
    }()
    
    open override func setupSubviews() {
        super.setupSubviews()
        messageContainerView.addSubview(callView)
        messageContainerView.addSubview(callLabel)
    }
    
    open override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? MessagesCollectionViewLayoutAttributes {
            callLabel.textInsets = attributes.callLabelInsets
            callLabel.font = attributes.messageLabelFont
            callLabel.frame = CGRect(origin: messageContainerView.bounds.origin, size: CGSize(width: messageContainerView.bounds.width - attributes.callLabelInsets.left - attributes.callLabelInsets.right - 30, height: messageContainerView.bounds.height))
            callView.frame = CGRect(origin: CGPoint(x: callLabel.frame.origin.x + callLabel.frame.width + 8, y: messageContainerView.bounds.origin.y), size: CGSize(width: 30, height: 30))
        }
    }

    open override func configure(with message: MessageType, at indexPath: IndexPath, and messagesCollectionView: MessagesCollectionView) {
        super.configure(with: message, at: indexPath, and: messagesCollectionView)
        switch message.data {
        case .call(let text , _ , let onlyAudio):
            print("xxx")
            callLabel.text = text
            callView.image = onlyAudio ? UIImage(named: "audio_call") : UIImage(named: "video_call")
        default:
            break
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        callLabel.text = nil
        callView.image = nil
    }

}
