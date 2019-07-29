//
//  main.swift
//  Install Template
//
//  Created by Sergio Garcia on 16/07/2019.
//  Copyright © 2019 Sergio García. All rights reserved.
//

import Foundation

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

let fileManager = FileManager.default
let user = bash(command: "whoami", arguments: [])
let templatesPath = "/Users/\(user)/Library/Developer/Xcode/Templates"
let MVPRPath = "\(templatesPath)/MVPR"

func checkMVPRIntermediates() throws {
    if !fileManager.fileExists(atPath: MVPRPath) {
        try fileManager.createDirectory(atPath: MVPRPath,
                                        withIntermediateDirectories: false,
                                        attributes: nil)
    }
}

func path(for template: String) -> String {
    return "\(MVPRPath)/\(template)"
}

func removeIfExists(template: String) throws {
    let templatePath = path(for: template)
    if fileManager.fileExists(atPath: templatePath) {
        print("⚠️ Template already exists. Removing previous... ⚠️")
        try fileManager.removeItem(atPath: templatePath)
    }
}

func copy(template: String) throws {
    let templatePath = path(for: template)
    try fileManager.copyItem(atPath: template,
                             toPath: templatePath)
}

func installSceneTemplate() {
    let templateName = "Scene.xctemplate"
    do {
        try checkMVPRIntermediates()
        try removeIfExists(template: templateName)
        try copy(template: templateName)
        print("✅ Template installed succesfully. 🍻")
    } catch let error as NSError {
        print("❌ Ooops! Something went wrong 🤮🤮🤮: \(error.localizedFailureReason!)")
    }
}


installSceneTemplate()
