//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class ___FILEBASENAMEASIDENTIFIER___ : UIViewController, ___VARIABLE_sceneName:identifier___PresenterView {
  
    lazy var presenter = ___VARIABLE_sceneName:identifier___Presenter(
        view: self,
        router: ___VARIABLE_sceneName:identifier___Router(routing: self)
    )
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated:Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?) {
        presenter.prepare(for: segue, sender: sender)
    }

}
