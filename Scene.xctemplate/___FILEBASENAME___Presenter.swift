//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___ {

    private weak var view: ___VARIABLE_sceneName:identifier___View?
    private let router: ___VARIABLE_sceneName:identifier___Router

    init(view: ___VARIABLE_sceneName:identifier___View,
         router: ___VARIABLE_sceneName:identifier___Router) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {}

    func viewWillAppear() {}

    func viewDidAppear() {}

    func viewWillDisappear() {}

    func viewDidDisappear() {}

    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.router.prepare(for: segue, sender: sender)
    }

}
