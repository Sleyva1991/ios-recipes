//
//  MainViewController.swift
//  Recipes
//
//  Created by Steven Leyva on 9/30/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchTextfield: UITextField!
    
    let networkClient = RecipesNetworkClient()
    var allRecipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchRecipes { (allRecipes, error) in
            if let error = error {
                NSLog("Error Fetching Recipes: \(error)")
                return
            }
        }
        
    }
   
    @IBAction func recipesTextfield(_ sender: Any) {
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
