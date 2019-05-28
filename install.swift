//
//  main.swift
//  InstallVIPERTemplate
//
//  Created by Juanpe Catalán on 17/02/2017.
//  Copyright © 2017 Juanpe Catalán. All rights reserved.
//

import Foundation

let templateName = "MVPRTemplate.xctemplate"

func moveTemplate() {
    let fileManager = FileManager.default

    let user = bash(command: "whoami", arguments: [])
    let destinationPath = "/Users/\(user)/Library/Developer/Xcode/Templates/MVPR/"
    let destinationFilePath = "\(destinationPath)/\(templateName)"
    do {
        if fileManager.fileExists(atPath: destinationFilePath) {
            print("⚠️   Template already exists. Updating...  ⚠️")
            try fileManager.removeItem(atPath: destinationFilePath)
        }
        try fileManager.createDirectory(atPath: destinationPath, withIntermediateDirectories: false, attributes: nil)
        try fileManager.copyItem(atPath: templateName, toPath: destinationFilePath)
        print("✅  Template installed succesfully.  🍻")
    } catch let error as NSError {
        print("❌  Ooops! Something went wrong 🤮🤮🤮: \(error.localizedFailureReason!)")
    }
}

func shell(launchPath: String, arguments: [String]) -> String {
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        //remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()
