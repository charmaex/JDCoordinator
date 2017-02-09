//
//  JDBaseCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Use this protocol for weak pointers to delegates of JDCoordinators in ViewControllers.
@objc public protocol JDCoordinatorViewControllerDelegate: class {

    /// Call this method in your ViewController to tell the Coordinator that their state has changed.
    ///
    /// You may want to check if parent == nil and remove the coordinator from it's parent.
    ///
    /// Implement it into UIViewController.didMove(to:)
    ///
    /// - parameters:
    ///     - vc: self / presented ViewController
    ///     - parent: The parent given by didMove(to:)
    @objc optional func presentedViewController(_ vc: UIViewController, movedTo parent: UIViewController?)
}

/// Use this protocol for weak pointers to delegates of JDParentCoordinators in JDCoordinators.
///
/// You only need to implement a delegate if you have to return values from the childCoordinator.
/// Otherwise you can use parentCoordinator instead.
public protocol JDCoordinatorCoordinatorDelegate: class {}

/// BaseProtocol where every other CoordinatorProtocol inherits from.
public protocol JDBaseCoordinatorProtocol: class {

    /// You need to override this method so it pushes the initial ViewController.
    func start()
}
