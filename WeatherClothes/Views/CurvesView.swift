//
//  CurvesView.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 14.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class CurvesView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
          return
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        drawSky(in: rect, context: context, colorSpace: colorSpace)
        //drawMountains(in: rect, in: context, with: colorSpace)
          //drawGrass(in: rect, in: context, with: colorSpace)

    }
    
    private func drawSky(in rect: CGRect, context: CGContext, colorSpace: CGColorSpace?) {
        context.saveGState()
        defer { context.restoreGState() }

        let backgroundMountains = CGMutablePath()
        backgroundMountains.move(to: CGPoint(x: 0, y: rect.height * 0.3), transform: .identity)
        
        backgroundMountains.addQuadCurve(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.2),
                                         control: CGPoint(x: 0, y: rect.height * 0.2),
                                         transform: .identity)
        
        backgroundMountains.addLine(to: CGPoint(x: rect.width * 0.7, y: rect.height * 0.2))
        backgroundMountains.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height * 0.1),
                                         control: CGPoint(x: rect.width, y: rect.height * 0.2),
                                       transform: .identity)
        

        backgroundMountains.addLine(to: CGPoint(x: rect.width, y: rect.height),
                                      transform: .identity)
        backgroundMountains.addLine(to: CGPoint(x: 0, y: rect.height),
                                      transform: .identity)
        backgroundMountains.closeSubpath()

        // Background Mountain Drawing
        context.addPath(backgroundMountains)
        context.clip()
        
        context.setFillColor(UIColor(red: 0.06, green: 0.74, blue: 0.98, alpha: 1.00).cgColor)
        context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
          context.setLineWidth(4)
    }
    
    private func drawMountains(in rect: CGRect, in context: CGContext,
                       with colorSpace: CGColorSpace?) {
      context.saveGState()
      defer { context.restoreGState() }

      let backgroundMountains = CGMutablePath()
      backgroundMountains.move(to: CGPoint(x: rect.width, y: rect.height * 0.2), transform: .identity)
      
      backgroundMountains.addQuadCurve(to: CGPoint(x: rect.width * 0.7, y: 0),
                                       control: CGPoint(x: rect.width, y: 0),
                                       transform: .identity)
      
      backgroundMountains.addLine(to: CGPoint(x: 0, y: 0))
      backgroundMountains.addLine(to: CGPoint(x: 0, y: -10),
                                      transform: .identity)
      backgroundMountains.addLine(to: CGPoint(x: rect.width, y: -10),
                                    transform: .identity)

      backgroundMountains.closeSubpath()

      // Background Mountain Drawing
      context.addPath(backgroundMountains)
      context.clip()
      
      context.setFillColor(UIColor(red: 0.06, green: 0.74, blue: 0.98, alpha: 1.00).cgColor)
      context.fill(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        context.setLineWidth(4)
    }

}
