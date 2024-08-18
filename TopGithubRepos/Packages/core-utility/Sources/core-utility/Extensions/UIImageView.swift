//
//  File.swift
//  core-utility
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import UIKit

public extension UIImageView {
    func setImage(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            self.image = UIImage(resource: .placeholderNoPhoto)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let imageData = data, let image = UIImage(data: imageData) else {
                self.image = UIImage(resource: .placeholderNoPhoto)
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }.resume()
    }
}
