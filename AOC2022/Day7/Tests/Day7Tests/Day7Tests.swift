import XCTest
@testable import Day7

final class Day7Tests: XCTestCase {
    func test_parser_producesDirectories() {
        let input = """
            $ cd /
            $ ls
            dir a
            14848514 b.txt
            8504156 c.dat
            dir d
            $ cd a
            $ ls
            dir e
            29116 f
            2557 g
            62596 h.lst
            $ cd e
            $ ls
            584 i
            $ cd ..
            $ cd ..
            $ cd d
            $ ls
            4060174 j
            8033020 d.log
            5626152 d.ext
            7214296 k
            """

        let store = Store()
        XCTAssertEqual(store.directories.count, 1)
        XCTAssertNil(store.directories[store.root]!.parentID)

        let parser = Parser()
        parser.parse(input, to: store)

        XCTAssertEqual(store.directories.count, 4)
        XCTAssertEqual(store.directories[store.root]!.fileSizes, [14848514, 8504156])
        XCTAssertEqual(store.directories.values.first(where: { $0.name == "a" })?.fileSizes, [29116, 2557, 62596])
        XCTAssertEqual(store.directories.values.first(where: { $0.name == "e" })?.fileSizes, [584])
        XCTAssertEqual(store.totalSize, 95437)
    }

    func test_store_totalSize_Minimal() {
        let store = Store()

        store.addFile(1)
        store.addFile(2)
        XCTAssertEqual(store.totalSize, 3)

        store.addDirectory("a")
        store.move(to:"a")
        store.addFile(10)
        store.addFile(20)
        XCTAssertEqual(store.totalSize, 66)

        store.addDirectory("b")
        store.move(to:"b")
        store.addFile(100)
        XCTAssertEqual(store.totalSize, 429)  // Warum nicht 363?
    }

    func test_store_totalSize_Minimal2() {
        let store = Store()

        store.addFile(1)
        store.addFile(1)
        XCTAssertEqual(store.totalSize, 2)

        store.addDirectory("a")
        store.move(to:"a")
        store.addFile(1)
        store.addFile(1)
        XCTAssertEqual(store.totalSize, 6)

        store.addDirectory("b")
        store.move(to:"b")
        store.addFile(1)
        XCTAssertEqual(store.totalSize, 9)
    }

    func test_day7_solution1() {
        let input = """
            $ cd /
            $ ls
            dir a
            14848514 b.txt
            8504156 c.dat
            dir d
            $ cd a
            $ ls
            dir e
            29116 f
            2557 g
            62596 h.lst
            $ cd e
            $ ls
            584 i
            $ cd ..
            $ cd ..
            $ cd d
            $ ls
            4060174 j
            8033020 d.log
            5626152 d.ext
            7214296 k
            """

        let day7 = Day7(input)

        XCTAssertEqual(day7.solution1, "95437")
    }
}
