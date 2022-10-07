//
//  QRCodeEyeStyleLeaf.swift
//
//  Copyright © 2022 Darren Ford. All rights reserved.
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

public extension QRCode.EyeShape {
	/// A 'rounded rect with a pointy bit facing inwards' style eye design
	@objc(QRCodeEyeStyleRoundedPointingOut) class RoundedPointingOut: NSObject, QRCodeEyeShapeGenerator {
		@objc public static let Name = "roundedPointingOut"
		@objc public static func Create(_ settings: [String: Any]?) -> QRCodeEyeShapeGenerator {
			return QRCode.EyeShape.RoundedPointingOut()
		}
		
		@objc public func settings() -> [String: Any] { return [:] }
		@objc public func supportsSettingValue(forKey key: String) -> Bool { false }
		@objc public func setSettingValue(_ value: Any?, forKey key: String) -> Bool { false }

		public func copyShape() -> QRCodeEyeShapeGenerator {
			return Self.Create(self.settings())
		}
		
		public func eyePath() -> CGPath {
			let tearEyePath = CGMutablePath()
			tearEyePath.move(to: CGPoint(x: 33, y: 70))
			tearEyePath.line(to: CGPoint(x: 57, y: 70))
			tearEyePath.curve(to: CGPoint(x: 70, y: 57), controlPoint1: CGPoint(x: 64.18, y: 70), controlPoint2: CGPoint(x: 70, y: 64.18))
			tearEyePath.line(to: CGPoint(x: 70, y: 33))
			tearEyePath.curve(to: CGPoint(x: 57, y: 20), controlPoint1: CGPoint(x: 70, y: 25.82), controlPoint2: CGPoint(x: 64.18, y: 20))
			tearEyePath.line(to: CGPoint(x: 20, y: 20))
			tearEyePath.line(to: CGPoint(x: 20, y: 57))
			tearEyePath.curve(to: CGPoint(x: 33, y: 70), controlPoint1: CGPoint(x: 20, y: 64.18), controlPoint2: CGPoint(x: 25.82, y: 70))
			tearEyePath.close()
			tearEyePath.move(to: CGPoint(x: 10, y: 57))
			tearEyePath.line(to: CGPoint(x: 10, y: 10))
			tearEyePath.line(to: CGPoint(x: 57, y: 10))
			tearEyePath.curve(to: CGPoint(x: 80, y: 33), controlPoint1: CGPoint(x: 69.7, y: 10), controlPoint2: CGPoint(x: 80, y: 20.3))
			tearEyePath.line(to: CGPoint(x: 80, y: 57))
			tearEyePath.curve(to: CGPoint(x: 57, y: 80), controlPoint1: CGPoint(x: 80, y: 69.7), controlPoint2: CGPoint(x: 69.7, y: 80))
			tearEyePath.line(to: CGPoint(x: 33, y: 80))
			tearEyePath.curve(to: CGPoint(x: 10, y: 57), controlPoint1: CGPoint(x: 20.3, y: 80), controlPoint2: CGPoint(x: 10, y: 69.7))
			tearEyePath.close()
			return tearEyePath
		}

		@objc public func eyeBackgroundPath() -> CGPath {
			let roundedPupil = CGPath.RoundedRect(
				rect: CGRect(x: 0, y: 0, width: 90, height: 90),
				cornerRadius: 30,
				byRoundingCorners: [.bottomRight, .topRight, .topLeft]
			)
			return roundedPupil
		}

		private static let generator_ = QRCode.PupilShape.RoundedPointingOut()
		public func defaultPupil() -> QRCodePupilShapeGenerator { Self.generator_ }
	}
}

public extension QRCode.PupilShape {
	/// A 'rounded rect with a pointy bit facing inwards' style pupil design
	@objc(QRCodePupilShapeRoundedPointingOut) class RoundedPointingOut: NSObject, QRCodePupilShapeGenerator {
		@objc public static var Name: String { "roundedPointingOut" }
		@objc public static func Create(_ settings: [String : Any]?) -> QRCodePupilShapeGenerator {
			RoundedPointingOut()
		}
		@objc public func copyShape() -> QRCodePupilShapeGenerator { RoundedPointingOut() }

		@objc public func settings() -> [String : Any] { [:] }
		@objc public func supportsSettingValue(forKey key: String) -> Bool { false }
		@objc public func setSettingValue(_ value: Any?, forKey key: String) -> Bool { false }

		/// The pupil centered in the 90x90 square
		@objc public func pupilPath() -> CGPath {
			let roundedPupil = CGPath.RoundedRect(
				rect: CGRect(x: 30, y: 30, width: 30, height: 30),
				cornerRadius: 6,
				byRoundingCorners: [.bottomRight, .bottomLeft, .topRight]
			)
			return roundedPupil
		}
	}
}