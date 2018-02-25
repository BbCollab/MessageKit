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

    
    
}
