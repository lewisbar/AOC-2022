//
//  Store.swift
//  
//
//  Created by LennartWisbar on 07.12.22.
//

import Foundation

class Store {
    var directories = [UUID: Directory]()
    let root: UUID
    private var currentID: UUID
    private(set) var currentLevel = 0

    init() {
        let root = Directory(
            name: "/",
            children: [],
            parentID: nil,
            level: 0,
            fileSizes: []
        )
        self.directories[root.id] = root
        self.root = root.id
        self.currentID = root.id
    }

    var totalSize: Int {
        directories[root]!.size
    }

    func moveToParent() {
        guard let parentID = directories[currentID]?.parentID else {
            print("Directory ID not found. ID: \(currentID)")
            return
        }
        currentID = parentID
    }

    func moveToRoot() {
        currentID = root
    }

    func move(to directory: Directory) {
        currentID = directory.id
    }

    func move(to name: String) {
        guard let children = directories[currentID]?.children else {
            print("Directory ID not found. ID: \(currentID)")
            return
        }
        guard let destination = children.first(where: { $0.name == name }) else {
            print("Directory not found: \(name)")
            return
        }
        move(to: destination)
    }

    func addDirectory(_ name: String) {
        let newDirectory = Directory(
            name: name,
            children: [],
            parentID: currentID,
            level: currentLevel + 1,
            fileSizes: []
        )
        directories[currentID]?.children.append(newDirectory)
        directories[newDirectory.id] = newDirectory
    }

    func addFile(_ size: Int) {
        directories[currentID]?.fileSizes.append(size)
    }
}
