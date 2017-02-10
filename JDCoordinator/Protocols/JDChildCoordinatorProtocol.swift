//
//  JDChildCoordinatorProtocol.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05/02/2017.
//  Copyright © 2017 Jan Dammshäuser. All rights reserved.
//

import Foundation

/// Defines Coordinators which can be children to other coordinators.
public protocol JDChildCoordinatorProtocol: JDBaseCoordinatorProtocol {

    /// Returns direct parentCoordinator
    var parentCoordinator: JDParentCoordinatorProtocol { get }

    /// Set the parentCoordinator and remove self from old parentCoordinator.
    /// - parameter coordinator: The new parentCoordinator
    func setParent(to coordinator: JDParentCoordinatorProtocol)
}

protocol _JDChildCoordinatorProtocol: JDChildCoordinatorProtocol {
    var parentCoordinator: JDParentCoordinatorProtocol { get set }
}

extension _JDChildCoordinatorProtocol {

    public func setParent(to coordinator: JDParentCoordinatorProtocol) {
        guard parentCoordinator !== coordinator else {
            return
        }
        guard coordinator.childCoordinators.index(where: { $0 === self }) != nil else {
            return coordinator.addChild(self)
        }
        parentCoordinator = coordinator
    }
}

public extension JDChildCoordinatorProtocol {

    /// Returns every parentCoordinator.
    ///
    /// .first is .parentCoordinator. .last is uppermost ParentCoordinator in stack. Which should be a JDAppCoordinator.
    var parentCoordinators: [JDParentCoordinatorProtocol] {
        var coordinators: [JDParentCoordinatorProtocol] = []
        var coordinator: JDChildCoordinatorProtocol? = self

        while let parentCoordinator = coordinator?.parentCoordinator {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator as? JDChildCoordinatorProtocol
        }

        return coordinators
    }

    /// Returns every parentCoordinator that is a JDChildCoordinator.
    ///
    /// .first is self. .last is uppermost ParentCoordinator in stack. Which should be the AppCoordinators childCoordinator.
    internal var childStack: [JDChildCoordinatorProtocol] {
        var coordinators: [JDChildCoordinatorProtocol] = [self]
        var coordinator: JDChildCoordinatorProtocol = self

        while let parentCoordinator = coordinator.parentCoordinator as? JDChildCoordinatorProtocol {
            coordinators.append(parentCoordinator)
            coordinator = parentCoordinator
        }

        return coordinators
    }
}