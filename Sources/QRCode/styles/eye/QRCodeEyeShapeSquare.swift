//
//  QRCodeEyeStyleSquare.swift
//
//  Copyright © 2023 Darren Ford. All rights reserved.
//
//  MIT license
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial
//  portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//  OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import CoreGraphics
import Foundation
import SwiftUI

public extension QRCode.EyeShape {
	/// A 'square' style eye design
	@objc(QRCodeEyeShapeSquare) class Square: NSObject, QRCodeEyeShapeGenerator {
		@objc public static let Name = "square"
		@objc public static var Title: String { "Square" }
		@objc public static func Create(_ settings: [String: Any]?) -> QRCodeEyeShapeGenerator {
			return QRCode.EyeShape.Square()
		}

		@objc public func settings() -> [String: Any] { return [:] }
		@objc public func supportsSettingValue(forKey key: String) -> Bool { false }
		@objc public func setSettingValue(_ value: Any?, forKey key: String) -> Bool { false }

		/// Make a copy of the object
		@objc public func copyShape() -> QRCodeEyeShapeGenerator {
			return Self.Create(self.settings())
		}

		public func eyePath() -> CGPath {
            let rectWidth = 60
            let rectHeight = 50
            let zigzagHeight: Int = 5
            let zigzagwidth: Int = rectWidth/6
            var startX = 75
            var startY = 70

            var guluEyePath = Path()
            
            guluEyePath.move(to: CGPoint(x: startX, y: startY))
            
            for i in 1...6 {
                startX -= Int(zigzagwidth)
                if i%2 == 0 {
                    startY -= zigzagHeight
                } else {
                    startY += zigzagHeight
                }
                guluEyePath.addLine(to: CGPoint(x: startX, y: startY))
            }
            
            guluEyePath.addLine(to: CGPoint(x: startX, y: startY - rectHeight))

            var newY = 20
            
            for i in 1...6 {
                startX += Int(zigzagwidth)
                if i%2 == 0 {
                    newY += zigzagHeight
                } else {
                    newY -= zigzagHeight
                }
                guluEyePath.addLine(to: CGPoint(x: startX, y: newY))
            }
            guluEyePath.closeSubpath()
            
            let newpath = guluEyePath.strokedPath(.init(lineWidth: 10))
            
            return newpath.cgPath
		}

		@objc public func eyeBackgroundPath() -> CGPath {
			CGPath(rect: CGRect(origin: .zero, size: CGSize(width: 90, height: 90)), transform: nil)
		}

		private static let _defaultPupil = QRCode.PupilShape.Square()
		public func defaultPupil() -> QRCodePupilShapeGenerator { Self._defaultPupil }
	}
}
