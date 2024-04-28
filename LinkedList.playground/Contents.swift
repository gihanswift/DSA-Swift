import UIKit

public class Node<Value> {

    public var value: Value
    public var next: Node?

    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?
    var arrayOfNodes: Array<Node<Value>> = []

    init() {}

    public var isEmpty: Bool {
        self.head == nil
    }


    public mutating func push(_ value: Value) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
        if tail == nil {
            tail = head
        }
        print("Pushed:", value)
    }

    public mutating func printList() {

        var currentNode = self.head
        while currentNode != nil {
            arrayOfNodes.append(currentNode!)
            currentNode = currentNode?.next

        }

        arrayOfNodes.map {print($0.value)}
    }

    public mutating func append(_ value: Value) {
        var newNode = Node(value: value)
        if isEmpty {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }

    }

    public mutating func prepend(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }

        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }

    public mutating func insert(for index: Int, value: Value) {
        if index >= self.arrayOfNodes.count {
            var newNode = Node(value: value)
            self.append(newNode.value)
        }

        var newNode = Node(value: value, next: nil)
        var leader = self.traversToIndex(index - 1)
        var holdingPointer = leader?.next
        leader?.next = newNode
        newNode.next = holdingPointer
    }

    public mutating func traversToIndex(_ index: Int) -> Node<Value>? {
        var counter = 0
        var currentNode = self.head
        while counter != index && counter < index {
            currentNode = currentNode?.next
            counter += 1
        }

        return currentNode ?? nil

    }

}

var myLinkedList = LinkedList<Any>()
myLinkedList.append(5)
myLinkedList.append(16)
myLinkedList.append(10)
myLinkedList.prepend(1)
myLinkedList.insert(for: 1, value: 99)
myLinkedList.printList()



