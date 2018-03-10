//
//  JDChildCoordinatorStorage.swift
//  JDCoordinator
//
//  Created by Jan Dammshäuser on 27.07.17.
//

import Foundation

public protocol JDChildCoordinatorStoring: Collection where Element == JDChildCoordinating {}

// TODO: - This has to be improved before release.
/// Quick and temporary solution to replace the store JDChildCoordinators of an Array with a Set
public struct JDChildCoordinatorStorage: JDChildCoordinatorStoring, SetAlgebra, Equatable, ExpressibleByArrayLiteral {

    // MARK: - Internal Storage
    private typealias StorageElement = NSObject
    private typealias Storage = Set<StorageElement>

    private var storage: Storage

    // MARK: - Initializers
    public init() {
        storage = []
    }

    private init(elements: [Element]) {
        // TODO: - correct Types
        self.init(storage: Set(elements as! [StorageElement]))
    }

    private init(storage: Storage) {
        self.storage = storage
    }

    // MARK: - Sequence
    public typealias Element = JDChildCoordinating

    // MARK: - Collection
    public typealias Index = Set<NSObject>.Index

    public var startIndex: Index {
        return storage.startIndex
    }

    public var endIndex: Index {
        return storage.endIndex
    }

    public func index(after i: Index) -> Index {
        return storage.index(after: i)
    }

    public subscript(position: Index) -> Element {
        return storage[position] as! Element
    }

    // MARK: - ExpressibleByArrayLiteral
    public init(arrayLiteral elements: Element...) {
        self.init(elements: elements)
    }

    // MARK: - Equatable
    public static func ==(lhs: JDChildCoordinatorStorage, rhs: JDChildCoordinatorStorage) -> Bool {
        return lhs.storage == rhs.storage
    }

    // MARK: - SetAlgebra
    public var isEmpty: Bool {
        return storage.isEmpty
    }

    public func symmetricDifference(_ other: JDChildCoordinatorStorage) -> JDChildCoordinatorStorage {
        let difference = storage.symmetricDifference(other.storage)
        return JDChildCoordinatorStorage(storage: difference)
    }

    @discardableResult public mutating func update(with newMember: Element) -> Element? {
        // TODO: - correct Types
        return storage.update(with: newMember as! StorageElement) as? Element
    }

    public mutating func formUnion(_ other: JDChildCoordinatorStorage) {
        storage.formUnion(other.storage)
    }

    public mutating func formIntersection(_ other: JDChildCoordinatorStorage) {
        storage.formIntersection(other.storage)
    }

    public mutating func formSymmetricDifference(_ other: JDChildCoordinatorStorage) {
        storage.formSymmetricDifference(other.storage)
    }

    public func contains(_ element: Element) -> Bool {
        // TODO: - correct Types
        return storage.contains(element as! StorageElement)
    }

    @discardableResult public mutating func remove(_ member: Element) -> Element? {
        // TODO: - correct Types
        return storage.remove(member as! StorageElement) as? Element
    }

    @discardableResult public mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        // TODO: - correct Types
        return storage.insert(newMember as! StorageElement) as! (Bool, Element)
    }

    public func union(_ other: JDChildCoordinatorStorage) -> JDChildCoordinatorStorage {
        let union = storage.union(other.storage)
        return JDChildCoordinatorStorage(storage: union)
    }

    public func intersection(_ other: JDChildCoordinatorStorage) -> JDChildCoordinatorStorage {
        let intersection = storage.intersection(other.storage)
        return JDChildCoordinatorStorage(storage: intersection)
    }
}

public extension JDChildCoordinatorStorage {

    mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepingCapacity: keepCapacity)
    }

    func subtracting(_ coordinators: [Element]) -> JDChildCoordinatorStorage {
        let other = JDChildCoordinatorStorage(elements: coordinators)

        return subtracting(other)
    }
}
