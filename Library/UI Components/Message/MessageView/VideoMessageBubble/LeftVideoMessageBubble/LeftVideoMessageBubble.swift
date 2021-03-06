//
//  LeftImageMessageBubble.swift
//  CometChatUIKit
//  Created by CometChat Inc. on 20/09/19.
//  Copyright ©  2019 CometChat Inc. All rights reserved.

// MARK: - Importing Frameworks.

import UIKit
import CometChatPro


/*  ----------------------------------------------------------------------------------------- */

class LeftVideoMessageBubble: UITableViewCell {
    
    
    // MARK: - Declaration of IBInspectable
    
    
    @IBOutlet weak var avatar: Avatar!
    @IBOutlet weak var imageMessage: UIImageView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var receiptStack: UIStackView!
    @IBOutlet weak var tintedView: UIView!
    
    // MARK: - Declaration of Variables
    var selectionColor: UIColor {
        set {
            let view = UIView()
            view.backgroundColor = newValue
            self.selectedBackgroundView = view
        }
        get {
            return self.selectedBackgroundView?.backgroundColor ?? UIColor.clear
        }
    }
    
    var mediaMessage: MediaMessage!{
        didSet {
            if let userName = mediaMessage.sender?.name {
                name.text = userName + ":"
            }
            if mediaMessage.receiverType == .group {
                nameView.isHidden = false
            }else {
                nameView.isHidden = true
            }
            self.receiptStack.isHidden = true
            timeStamp.text = String().setMessageTime(time: mediaMessage.sentAt)
            if let avatarURL = mediaMessage.sender?.avatar  {
                avatar.set(image: avatarURL, with: mediaMessage.sender?.name ?? "")
            }
        }
    }
    
    // MARK: - Initialization of required Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if #available(iOS 13.0, *) {
            selectionColor = .systemBackground
        } else {
            selectionColor = .white
        }
        
    }
    
    
     override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           switch isEditing {
           case true:
               switch selected {
               case true: self.tintedView.isHidden = false
               case false: self.tintedView.isHidden = true
               }
           case false: break
           }
       }
    
    
    /**
     This method used to set the image for LeftImageMessageBubble class
     - Parameter image: This specifies a `URL` for  the Avatar.
     - Author: CometChat Team
     - Copyright:  ©  2019 CometChat Inc.
     */
    
    public func set(Image: UIImageView, forURL url: String) {
        let url = URL(string: url)
        Image.cf.setImage(with: url)
    }
    
}
