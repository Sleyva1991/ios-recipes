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
    
    var allRecipes: [Recipe] = [] {
        didSet {
            filterRecipes()
        }
    }
    
    
    var recipesTableViewController: RecipesTableViewController? {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    var filteredRecipes:[Recipe] = [] {
        didSet {
            recipesTableViewController?.recipes = filteredRecipes
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchRecipes { (allRecipes, error) in
            if let error = error {
                NSLog("Error Fetching Recipes: \(error)")
                return
            }
            guard let allRecipes = allRecipes else { return }
            
            DispatchQueue.main.async {
                self.allRecipes = allRecipes
            }
        }
        
    }
    
    func filterRecipes() {
        guard let searchterm = searchTextfield.text, !searchterm.isEmpty else {
            filteredRecipes = allRecipes
            return
        }
        
        filteredRecipes = allRecipes.filter({ (recipe) -> Bool in
            if recipe.name.contains(searchterm) || recipe.instructions.contains(searchterm) {
                return true
            } else {
                return false
            }
        })
        
    }
   
    @IBAction func recipesTextfield(_ sender: Any) {
        resignFirstResponder()
        filterRecipes()
        
    }
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipeSegue" {
            guard let showDetailVC = segue.destination as? RecipesTableViewController else { return }
            recipesTableViewController = nil
            recipesTableViewController = showDetailVC
            showDetailVC.recipes = allRecipes
        }
    }
 

}
