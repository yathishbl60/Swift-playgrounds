//: Playground - noun: a place where people can play

import UIKit

protocol QueueType {
    associatedtype Element
    mutating func enqueue(element: Element)
    mutating func dequeue()->Element?
}

struct Queue<Element>: QueueType {

    private var left: [Element]
    private var right: [Element]

    init() {
        left = []
        right = []
    }

    mutating func enqueue(element: Element) {
        right.append(element)
    }

    mutating func dequeue() -> Queue.Element? {

        guard !(left.isEmpty && right.isEmpty) else {
            return nil
        }

        if left.isEmpty {
            left = right.reverse()
            right.removeAll(keepCapacity: true)
        }

        return left.removeLast()
    }
}

extension Queue: CollectionType {
    var startIndex: Int {
        return 0
    }

    var endIndex: Int {
        return left.count + right.count
    }

    subscript(idx: Int) -> Element {
        precondition((0..<endIndex).contains(idx), "Index out of bounds")
        if idx < left.endIndex {
            return left[left.count - idx.successor()]
        } else {
            return right[idx - left.count]
        }
    }
}


var q = Queue<String>()
for x in ["1", "2", "foo", "3"] {
    q.enqueue(x)
}
// you can now for...in over queues
for s in q { print(s) } // prints 1 2 foo 3
// pass queues to methods that take sequences
q.joinWithSeparator(",") // "1,2,foo,3"
let a = Array(q) // a = ["1", "2", "foo", "3]
// call methods that extend SequenceType
q.map { $0.uppercaseString } // ["1", "2", "FOO", "3"]
q.flatMap { Int($0) } // [1,2,3]
q.filter { // ["foo"]
    $0.characters.count > 1
}
// call methods that extend CollectionType
q.isEmpty // false”
q.first
q.last


extension Queue: ArrayLiteralConvertible {

    init(arrayLiteral elements: Element...) {
        left = elements.reverse()
        right = []
    }
}


let q1: Queue = [1, 2, 3]

let queueByte: Queue<Int8> = [1, 2, 3]


extension Queue: RangeReplaceableCollectionType {
    mutating func reserveCapacity(n: Int) {
        return
    }

    mutating func replaceRange<C : CollectionType where C.Generator.Element == Element>(subRange: Range<Int>, with newElements: C) {
        right = left.reverse() + right
        left.removeAll(keepCapacity: true)
        right.replaceRange(subRange, with: newElements)
    }
}


enum List<Element> {
    case End
    indirect case Node(Element, next: List<Element>)
}

extension List {

    // Return a new list by prepending a node with value `x` to the front of a list.
    func cons(x: Element) -> List {
        return .Node(x, next: self)
    }
}


let list = List<Int>.End.cons(1).cons(2).cons(3)

let l1 = list.cons(4)
let l2 = list.cons(5)

// l1 and l2 shares the same tail list

protocol StackType {
    associatedtype Element
    mutating func push(element: Element)
    mutating func pop() -> Element?
}

extension Array: StackType {
    mutating func push(element: Element) {
        append(element)
    }

    mutating func pop() -> Array.Element? {
        return popLast()
    }
}


extension List: StackType {
    mutating func push(element: Element) {
        self = self.cons(element)
    }

    mutating func pop() -> List.Element? {
        switch self {
        case .End:
            return nil
        case let .Node(element, next: list):
            self = list
            return element

        }
    }
}

var stack = List<Int>.End.cons(1).cons(2).cons(3)

var s1 = stack
var s2 = stack

s1.pop()
s1.pop()
s1.pop()

stack.pop()
stack.push(4)

s2.pop()
s2.pop()
s2.pop()

stack.pop()
stack.pop()
stack.pop()


//Conforming List to SequenceType
extension List: SequenceType {
    func generate() -> AnyGenerator<Element> {
        var current = self
        return AnyGenerator {
            current.pop()
        }
    }
}



extension List: ArrayLiteralConvertible {
    init(arrayLiteral elements: Element...) {
        self = elements.reverse().reduce(.End){ $0.cons($1)}
    }
}

let l3: List = ["1", "2"]

for li in l3 {
    print("\(li)", terminator: " ")
}

l3.joinWithSeparator(",")
l3.cons("1")
l3.flatMap {
    Int($0)
}

l3.elementsEqual(["1", "2"])



//Conforming List tp CollectionType
//Private implementation detail of the list collection
private enum ListNode<Element> {
    case End
    indirect case Node(Element, next: ListNode<Element>)

    func cons(x: Element) -> ListNode<Element> {
        return .Node(x, next: self)
    }
}


public struct ListIndex<Element> {
    private let node: ListNode<Element>
    private let tag: Int
}

extension ListIndex: ForwardIndexType {
    public func successor() -> ListIndex<Element> {
        switch node {
        case let .Node(_, next: next):
            return ListIndex(node: next, tag: tag.predecessor())
        case .End:
            fatalError("Cannot increment endIndex")
        }
    }
}

public func == <T>(lhs: ListIndex<T>, rhs: ListIndex<T>) -> Bool {
    return lhs.tag == rhs.tag
}









public struct ListF<Element>: CollectionType {

    public typealias Index = ListIndex<Element>

    public var startIndex: Index
    public var endIndex: Index

    public subscript(idx: Index) -> Element {
        switch idx.node {
        case .End :
            fatalError("Subscript out of range")
        case let .Node(x, _):
            return x
        }
    }
}

extension ListF: ArrayLiteralConvertible {
    public init(arrayLiteral elements: Element...) {
        startIndex = ListIndex(node: elements.reverse().reduce(.End){ $0.cons($1)}, tag: elements.count)
        endIndex = ListIndex(node: .End, tag: 0)
    }
}

let l: ListF = ["one", "two", "three"]
l.first
l.indexOf("two")


extension ListF {
    public var count: Int {
        return startIndex.tag - endIndex.tag
    }
}

public func == <T: Equatable>(lhs: ListF<T>, rhs: ListF<T>) -> Bool {
    return lhs.elementsEqual(rhs)
}


extension ListF {
    private init(subRange: Range<Index>) {
        startIndex = subRange.startIndex
        endIndex = subRange.endIndex
    }

    public subscript(subRange: Range<Index>) -> ListF<Element> {
        return ListF(subRange: subRange)
    }
}

extension ListF {

    public func reverse() -> ListF<Element> {
        let reversedNodes: ListNode<Element> = self.reduce(.End) { $0.cons($1) }
        return ListF(
            startIndex: ListIndex(node: reversedNodes, tag: self.count),
            endIndex: ListIndex(node: .End, tag: 0))
    }
}

