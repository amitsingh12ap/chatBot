//
//  Alert.swift
//  AliveCor Coding Assignment
//
//  Created by 13216146 on 07/06/21.
//

import Foundation

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
