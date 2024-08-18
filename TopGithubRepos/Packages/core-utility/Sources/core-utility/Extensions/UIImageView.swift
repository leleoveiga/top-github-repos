//
//  File.swift
//  core-utility
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import UIKit
import SDWebImage

public extension UIImageView {
    func setImage(imageUrl: String?) {
        guard let imageUrl, let url = URL(string: imageUrl) else {
            image = UIImage(resource: .placeholderNoPhoto)
            return
        }
        self.sd_setImage(with: url)
    }
}
