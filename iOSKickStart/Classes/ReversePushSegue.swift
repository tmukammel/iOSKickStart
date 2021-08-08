//
//  ReversePushSegue.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 08/08/21.
//  Copyright © 2021 Twaha Mukammel. All rights reserved.
//

import UIKit

public class ReversePushSegue: UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    
    override open func perform() {
        let navigationController = source.navigationController!
        navigationController.pushViewController(destination, animated: true, animationType: CATransitionSubtype.fromLeft.rawValue)
    }
}
