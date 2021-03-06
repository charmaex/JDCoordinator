//
//  ParentCoordinator.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 05.09.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

/**
 Use the `ParentCoordinator` only in a `UINavigationController` based application.

 The coordinator structure in your app can be seen as a tree. In this example the `ParentCoordinator` is a branch between the root and a leave.
 A `ParentCoordinator` can manage other `Coordinator`s as childs and also manage `UIViewController`s (usage of a `Child` is preferred).
 It is totally safe to add another `ParentCoordinator` as a child.
 */
open class ParentCoordinator: Coordinator, MutableParent, CoordinatorDelegate {
    public internal(set) var childCoordinators: ChildStorage = []
}
