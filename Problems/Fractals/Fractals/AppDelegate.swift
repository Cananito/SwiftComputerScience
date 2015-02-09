//
//  AppDelegate.swift
//  Fractals
//
//  Created by Rogelio Gudino on 2/8/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var fractalContainerView: NSView!
    @IBOutlet weak var fractalPickerRadioMatrix: NSMatrix!
    private var currentFractalView: FractalView?
    private let triangleFractalView: TriangleFractalView
    private let mondrianFractalView: MondrianFractalView
    
    override init()  {
        self.triangleFractalView = TriangleFractalView()
        self.triangleFractalView.translatesAutoresizingMaskIntoConstraints = false
        self.mondrianFractalView = MondrianFractalView()
        self.mondrianFractalView.translatesAutoresizingMaskIntoConstraints = false
        self.currentFractalView = self.triangleFractalView
    }
    
    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        self.changeToFractalView(fractalView: self.currentFractalView!)
    }
    
    @IBAction func changeFractal(sender: NSMatrix!) {
        let cell: NSCell = sender.selectedCell() as NSCell
        if cell.title == "Triangle" {
            changeToFractalView(fractalView: self.triangleFractalView)
        } else if cell.title == "Mondrian" {
            changeToFractalView(fractalView: self.mondrianFractalView)
        } else {
            let alert = NSAlert()
            alert.messageText = "That fractal is not supported yet."
            alert.alertStyle = NSAlertStyle.InformationalAlertStyle
            alert.beginSheetModalForWindow(self.window, completionHandler: Optional.None)
        }
    }
    
    func changeToFractalView(#fractalView: FractalView) {
        self.currentFractalView?.removeFromSuperview()
        self.currentFractalView = fractalView
        self.fractalContainerView.addSubview(self.currentFractalView!)
        
        self.fractalContainerView.addConstraint(NSLayoutConstraint(item: self.currentFractalView!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.fractalContainerView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 0.0))
        self.fractalContainerView.addConstraint(NSLayoutConstraint(item: self.currentFractalView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.fractalContainerView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0))
        self.fractalContainerView.addConstraint(NSLayoutConstraint(item: self.currentFractalView!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.fractalContainerView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0))
        self.fractalContainerView.addConstraint(NSLayoutConstraint(item: self.currentFractalView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.fractalContainerView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0))
    }
}

