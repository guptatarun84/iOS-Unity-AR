//
//  main.swift
//  VirtualAssistant
//
//  Created by Gupta, Tarun K. on 9/3/17.
//  Copyright © 2017 Tarun. All rights reserved.
//

import Foundation

unity_init(CommandLine.argc, CommandLine.unsafeArgv)
// Entry point to the application
UIApplicationMain(CommandLine.argc,
                  UnsafeMutableRawPointer(CommandLine.unsafeArgv)
                    .bindMemory(
                        to: UnsafeMutablePointer<Int8>.self,
                        capacity: Int(CommandLine.argc)),
                  nil,
                  NSStringFromClass(AppDelegate.self) )
