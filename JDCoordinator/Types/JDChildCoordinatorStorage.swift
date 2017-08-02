//
//  JDChildCoordinatorStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

// TODO: - This has to be improved before release.
/// Quick and temporary solution to replace the store JDChildCoordinators of an Array with a Set
public struct JDChildCoordinatorStorage: Sequence, ExpressibleByArrayLiteral {

    public typealias Element = JDChildCoordinatorClass
    public typealias ArrayLiteralElement = Element

    public func makeIterator() -> AnyIterator<Element> {
        var iterator = storage.makeIterator()
        return AnyIterator {
            iterator.next() as? Element
        }
    }

    public init(arrayLiteral elements: JDChildCoordinatorStorage.Element...) {
        storage = Set(elements as [NSObject])
    }

    private var storage: Set<NSObject> = []
}

// TODO: - Replace the following stuff
public extension JDChildCoordinatorStorage {

    public var count: Int {
        return storage.count
    }

    public mutating func add(_ coordinator: JDChildCoordinatorClass) {
        storage.insert(coordinator as NSObject)
    }

    public mutating func remove(_ coordinator: JDChildCoordinatorClass) {
        storage.remove(coordinator as NSObject)
    }

    public mutating func removeAll() {
        storage.removeAll()
    }

    public func subtracting(_ coordinators: [JDChildCoordinatorClass]) -> [JDChildCoordinatorClass] {
        let coordinators = Set(coordinators as [NSObject])
        let subtraction = storage.subtracting(coordinators)

        return Array(subtraction) as! [JDChildCoordinatorClass] // Only JDCoordinatorClass can be added
    }

    public func contains(_ coordinator: JDChildCoordinatorClass) -> Bool {
        return storage.contains(coordinator as NSObject)
    }
}
