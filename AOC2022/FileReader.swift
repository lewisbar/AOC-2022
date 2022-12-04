//
//  FileReader.swift
//  AOC2022
//
//  Created by LennartWisbar on 01.12.22.
//

import Foundation

struct FileReader: FileReaderType {
    static let shared = FileReader()
    func read(_ filename: String, fileExtension: String = "txt") -> String {
        let fullName = "\(filename).\(fileExtension)"

        guard let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) else {
            print("File \(fullName) not found.")
            return ""
        }

        guard let input = try? String(contentsOf: url) else {
            print("Contents of URL \(url) could not be converted to String.")
            return ""
        }

        return input
    }
}
