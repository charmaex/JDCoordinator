//
//  MutableParent.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

protocol MutableParent: Parent {
    var childCoordinators: ChildStorage { get set }
}

extension MutableParent {
    public func addChild(_ coordinator: Child) {
        guard !childCoordinators.contains(coordinator) else {
            return
        }

        if coordinator.parentCoordinator !== self {
            coordinator.parentCoordinator?.removeChild(coordinator)
        }

        childCoordinators.insert(coordinator)

        coordinator.setParent(to: self)
    }

    public func removeChild(_ coordinator: Child) {
        childCoordinators.remove(coordinator)
        coordinator.removed(fromParent: self)
    }

    public func hasChild(_ coordinator: Child) -> Bool {
        return childCoordinators.contains(coordinator)
    }

    /// Removes all childCoordinators.
    public func removeAllChilds() {
        for coordinator in childCoordinators {
            removeChild(coordinator)
        }
    }

    /// Removes all Coordinators except the given ones
    /// - parameter coordinators: Coordinators which should not be removed
    public func removeChildsExcept(_ coordinators: [Child]) {
        for coordinator in childCoordinators.subtracting(coordinators) {
            removeChild(coordinator)
        }
    }
}
