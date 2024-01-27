//
//  CustomTabBar.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

@IBDesignable
final class CustomTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
    private func addShape() {
        let newShapeLayer = CAShapeLayer()
        newShapeLayer.path = createPath()
        newShapeLayer.strokeColor = UIColor.lightGray.cgColor
        newShapeLayer.fillColor = UIColor.white.cgColor
        newShapeLayer.lineWidth = 1.0
        
        newShapeLayer.shadowOffset = CGSize(width:0, height:0)
        newShapeLayer.shadowRadius = 10
        newShapeLayer.shadowColor = UIColor.gray.cgColor
        newShapeLayer.shadowOpacity = 0.3
        
        if let oldShapeLayer = shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: newShapeLayer)
        } else {
            layer.insertSublayer(newShapeLayer, at: 0)
        }
        
        newShapeLayer.fillColor = UIColor.white.cgColor
        
        shapeLayer = newShapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func createPath() -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()
        let centerWidth = frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))
        path.addCurve(to: CGPoint(x: centerWidth, y: height),
                      controlPoint1: CGPoint(x: (centerWidth - 30), y: 0),
                      controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0),
                      controlPoint1: CGPoint(x: centerWidth + 35, y: height),
                      controlPoint2: CGPoint(x: (centerWidth + 30), y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()
        
        return path.cgPath
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        for member in subviews.reversed() {
            let subPoint = member.convert(point, from: self)
            guard let result = member.hitTest(subPoint, with: event) else { continue }
            return result
        }
        return nil
    }
}
