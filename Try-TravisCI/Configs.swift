//
//  Configs.swift
//  Try-TravisCI
//
//  Created by Poldet Assanangkornchai on 12/1/19.
//  Copyright © 2019 Poldet Assanangkornchai. All rights reserved.
//

import Foundation

public enum Configs {
  #if DEBUG
  public static var apiURL: URL = URL(string: "http://debug-api.trytravis.com")!
  #elseif BETA
  public static var apiURL: URL = URL(string: "http://beta-api.trytravis.com")!
  #elseif RELEASE
  public static var apiURL: URL = URL(string: "http://api.trytravis.com")!
  #endif
}
