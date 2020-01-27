//  AdministratorView.swift
//  CometChatUIKit
//  Created by Pushpsen Airekar on 20/09/19.
//  Copyright ©  2019 CometChat Inc. All rights reserved.

// MARK: - Importing Frameworks.
import UIKit


/*  ----------------------------------------------------------------------------------------- */

class AdministratorView: UITableViewCell {
    
    // MARK: - Declaration of IBOutlet
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var adminCount: UILabel!
    
    // MARK: - Initialization of required Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

/*  ----------------------------------------------------------------------------------------- */