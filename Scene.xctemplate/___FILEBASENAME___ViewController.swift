//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___: UIViewController {

    private(set) lazy var presenter: ___VARIABLE_sceneName:identifier___Presenter = {
        let router = ___VARIABLE_sceneName:identifier___Router(routing: self)
        return ___VARIABLE_sceneName:identifier___Presenter(view: self,
                              router: router)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.presenter.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.presenter.viewDidDisappear()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.prepare(for: segue, sender: sender)
    }

}
