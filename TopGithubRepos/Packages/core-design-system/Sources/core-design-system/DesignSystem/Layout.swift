//
//  Layout.swift
//  core-design-system
//
//  Created by Leonardo Veiga on 16/08/24.
//

import Foundation
import SnapKit

public class Layout {
    
    // MARK: - Corner
    public enum RoundedCorner: CGFloat {
        case none = 0
        case small = 4
        case medium = 8
        case large = 12
        case big = 16
    }
    
    // MARK: - Border
    public enum BorderWidth: CGFloat {
        case none = 0
        case small = 1
        case medium = 2
        case big = 4
    }
    
    //MARK: - Margin
    public enum Margin: CGFloat {
        case none = 0
        case xxsmall = 2
        case xsmall = 4
        case small = 8
        case regular = 12
        case medium = 16
        case large = 24
        case xlarge = 32
        case xxlarge = 40
        case xxxlarge = 48
        case xxxxlarge = 80
    }
    
    //MARK: - Height
    public enum Height: CGFloat {
        case smallIcon = 20
        case mediumIcon = 24
        case profilePicture = 40
    }
    
    // MARK: - Opacity
    public enum Opacity: CGFloat {
        case max = 1.0
        case opaque = 0.72
        case medium = 0.40
        case light = 0.24
    }
}

public extension CGFloat {
    
    // MARK: - Corner
    static func roundedCorner(_ size: Layout.RoundedCorner) -> CGFloat {
        size.rawValue
    }
    
    // MARK: - Border
    static func borderWidth(_ width: Layout.BorderWidth) -> CGFloat {
        width.rawValue
    }
    
    //MARK: - Margin
    static func margin(_ size: Layout.Margin) -> CGFloat {
        size.rawValue
    }
    
    //MARK: - Height
    static func height(_ size: Layout.Height) -> CGFloat {
        size.rawValue
    }
    
    //MARK: - Opacity
    static func opacity(_ size: Layout.Opacity) -> CGFloat {
        size.rawValue
    }
}

extension ConstraintMakerEditable {
    
    @discardableResult
    public func inset(_ amount: CGFloat) -> ConstraintMakerEditable {
        inset(amount as ConstraintInsetTarget)
        return self
    }
    
    @discardableResult
    public func offset(_ amount: CGFloat) -> ConstraintMakerEditable {
        offset(amount as ConstraintOffsetTarget)
        return self
    }
}
