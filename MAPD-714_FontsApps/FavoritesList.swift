//
//  FavouritesList.swift
//  MAPD-714_FontsApps
//
//  Created by Sherlyn Lobo on 2018-11-15.
//  Copyright © 2018 Sherlyn Lobo. All rights reserved.
//

import Foundation
import UIKit

class FavoritesList {
    static let sharedFavoritesList = FavoritesList();
    private(set) var favorites:[String]
    init()
    {
       let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: "favorites") as? [String]
        favorites = storedFavorites != nil ? storedFavorites! : []
        
    }
    
    func addFavourite(fontName : String)
    {
        
        if !favorites.contains(fontName)
        {
            favorites.append(fontName)
            saveFavorites()
        }
        
    }
    
    func removeFavorite(fontName: String)
    {
        if let index = favorites.index(of: fontName)
        {
            favorites.remove(at: index)
            saveFavorites()
            
        }
    }
        
        private func saveFavorites()
        {
            let defaults = UserDefaults.standard
            defaults.set(favorites, forKey: "favorites")
            defaults.synchronize()
        }
    
//let favorites = FavoritesList.sharedFavoritesList.favorites

}
