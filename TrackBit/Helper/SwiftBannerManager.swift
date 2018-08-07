//
//  SwiftBannerManager.swift
//  TrackBit
//
//  Created by Vladislav on 07.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import Foundation
import SwiftMessages

class SwiftBannerManager {
    
    public static let shared = SwiftBannerManager()
    
    let connectionString = "Fail with connecting to the server"
    let serverString = "Server failure"
    
    private init() {}
    
    lazy var bannerConfig:SwiftMessages.Config = {
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.duration = .automatic
        return config
    }()
    
    
    
    lazy var bannerView:MessageView = {
        let view = MessageView.viewFromNib(layout: .messageView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.isHidden = true
        view.bodyLabel?.textColor = .white
        return view
    }()
    
    
    func show(state:ServiceFailure) {
        let string = state == .connection ? connectionString : serverString
        bannerView.configureContent(title: "Error", body: string)
        SwiftMessages.show(config:bannerConfig, view: bannerView)
    }
    
    func hide() {
        SwiftMessages.hide()
    }
    
    
//    func showStatusMessage(message: String, messageType: MessageType) {
//        var config = SwiftMessages.Config()
//        let messageView = MessageView.viewFromNib(layout: .statusLine)
//        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
//
//        switch messageType {
//        case .success:
//            messageView.backgroundColor = UIColor.game.green
//            config.duration = .automatic
//            messageView.id = "connected"
//        case .warning:
//            messageView.backgroundColor = UIColor.game.red
//            config.duration = .automatic
//            messageView.id = "connecting"
//        case .error:
//            messageView.backgroundColor = UIColor.game.red
//        }
//        messageView.configureDropShadow()
//        messageView.button?.isHidden = true
//        messageView.bodyLabel?.textColor = .white
//        messageView.configureContent(title: "error", body: message)
//        SwiftMessages.show(config: config, view: messageView)
//    }
    
    
    
    
}
