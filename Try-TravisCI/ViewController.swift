//
//  ViewController.swift
//  Try-TravisCI
//
//  Created by Poldet Assanangkornchai on 21/12/18.
//  Copyright © 2018 Poldet Assanangkornchai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    if let appVersion = appVersion, let buildVersion = buildVersion {
      label.text = "\(appVersion) (\(buildVersion)) at \(Configs.apiURL.absoluteString)"
    }
  }


}

