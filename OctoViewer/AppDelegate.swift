//
//  AppDelegate.swift
//  OctoViewer
//
//  Created by Hesham Salman on 5/20/17.
//  Copyright © 2017 Hesham Salman
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import RxSwift
import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var viewModel: AppDelegateViewModelType = AppDelegateViewModel()

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow()
    let navigationController = UINavigationController()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    let coordinator = AppCoordinator(navigationController: navigationController)
    coordinator.start()
    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    return viewModel.inputs.application(app: app, open: url, options: options)
  }

}
