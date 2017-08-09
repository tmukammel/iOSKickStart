//
//  CrossDissolveSegue.swift
//  BeWithFriends
//
//  Created by Twaha Mukammel on 5/11/16.
//  Copyright © 2016 Twaha Mukammel. All rights reserved.
//

import UIKit

public class CrossDissolveSegue: UIStoryboardSegue {
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    
    override open func perform() {
        let navigationController = source.navigationController!
        navigationController.crossDissolveViewController(destination)
    }
}
