//
//  CallMessageSizeCalculator.swift
//  MessageKit
//
//  Created by Zeliang Shao on 2018/6/11.
//  Copyright © 2018 MessageKit. All rights reserved.
//

import UIKit

open class CallMessageSizeCalculator: MessageSizeCalculator {
    open override func messageContainerSize(for message: MessageType) -> CGSize {
        switch message.kind {
        case .call(let _, let item):
            NSLog("%@", item)
            return CGSize(width: 100, height: 100)
            //        case .location(let item):
            //            let maxWidth = messageContainerMaxWidth(for: message)
            //            if maxWidth < item.size.width {
            //                // Maintain the ratio if width is too great
            //                let height = maxWidth * item.size.height / item.size.width
            //                return CGSize(width: maxWidth, height: height)
            //            }
        //            return item.size
        default:
            fatalError("messageContainerSize received unhandled MessageDataType: \(message.kind)")
        }
    }
}
