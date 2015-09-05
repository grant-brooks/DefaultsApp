//
//  AppDelegate.swift
//  DefaultsApp
//
//  Created by Grant Goodman on 9/5/15.
//  Copyright (c) 2015 Macster Software Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool
    {
        var toIsNil: Bool?
        var ccIsNil: Bool?
        var bccIsNil: Bool?
        var subjectIsNil: Bool?
        var messageIsNil: Bool?
        
        var destinationIsNil: Bool?
        var startingPointIsNil: Bool?
        
        if url.scheme == "comdefaults"
        {
            if url.host == "mail"
            {
                var seperatedArray: [String] = url.relativeString!.componentsSeparatedByString("comdefaults://mail")
                
                if seperatedArray.count > 1
                {
                    var seperatedString = seperatedArray[1] as String
                    
                    if seperatedString != ""
                    {
                        seperatedString = dropFirst(seperatedString)
                        
                        var seperatedByAndArray: [String] = seperatedString.componentsSeparatedByString("&")
                        
                        if seperatedByAndArray.count == 5
                        {
                            for passedParameter in seperatedByAndArray
                            {
                                if passedParameter.hasPrefix("to=")
                                {
                                    var toString = dropFirstThreeCharactersOfString(passedParameter)
                                    
                                    if toString == "nil"
                                    {
                                        toIsNil = true
                                        println("To field was left empty.")
                                    }
                                    else
                                    {
                                        toIsNil = false
                                        println("Message is To: '\(toString)'.")
                                    }
                                }
                                else
                                {
                                    if toIsNil != false
                                    {
                                        toIsNil = true
                                    }
                                }
                                
                                if passedParameter.hasPrefix("cc=")
                                {
                                    var ccString = dropFirstThreeCharactersOfString(passedParameter)
                                    
                                    if ccString == "nil"
                                    {
                                        ccIsNil = true
                                        println("CC field was left empty.")
                                    }
                                    else
                                    {
                                        ccIsNil = false
                                        println("Message is CC'd To: '\(ccString)'.")
                                    }
                                }
                                else
                                {
                                    if ccIsNil != false
                                    {
                                        ccIsNil = true
                                    }
                                }
                                
                                if passedParameter.hasPrefix("bcc=")
                                {
                                    var bccString = dropFirstFourCharactersOfString(passedParameter)
                                    
                                    if bccString == "nil"
                                    {
                                        bccIsNil = true
                                        println("BCC field was left empty.")
                                    }
                                    else
                                    {
                                        bccIsNil = false
                                        println("Message is BCC'd To: '\(bccString)'.")
                                    }
                                }
                                else
                                {
                                    if bccIsNil != false
                                    {
                                        bccIsNil = true
                                    }
                                }
                                
                                if passedParameter.hasPrefix("subject=")
                                {
                                    var subjectString = dropFirstEightCharactersOfString(passedParameter)
                                    
                                    if subjectString == "nil"
                                    {
                                        subjectIsNil = true
                                        println("Subject field was left empty.")
                                    }
                                    else
                                    {
                                        subjectIsNil = false
                                        println("Message's Subject is: '\(subjectString)'.")
                                    }
                                }
                                else
                                {
                                    if subjectIsNil != false
                                    {
                                        subjectIsNil = true
                                    }
                                }
                                
                                if passedParameter.hasPrefix("body=")
                                {
                                    var messageString = dropFirstFiveCharactersOfString(passedParameter)
                                    
                                    if messageString == "nil"
                                    {
                                        messageIsNil = true
                                        println("Message field was left empty.")
                                    }
                                    else
                                    {
                                        messageIsNil = false
                                        println("Message's Message is: '\(messageString)'.")
                                    }
                                }
                                else
                                {
                                    if messageIsNil != false
                                    {
                                        messageIsNil = true
                                    }
                                }
                                
                            }
                        }
                        else
                        {
                            throwTypeError()
                        }
                    }
                    else
                    {
                        println("This guy just wants to open Mail.")
                    }
                }
                
                //mail?to=%@,cc=%@,bcc=%@,subject=%@body=%@
                //comdefaults://mail?to=grantgoodman@optonline.net&cc=john@example.com&bcc=goodmang@live.northshoreschools.org&subject=Hello!&body=How%20are%20you?
                
                //comdefaults://navigate?daddr=%f,%f&saddr=%f,%f
            }
            else if url.host == "navigate"
            {
                var seperatedArray: [String] = url.relativeString!.componentsSeparatedByString("comdefaults://navigate")
                
                if seperatedArray.count > 1
                {
                    var seperatedString = seperatedArray[1] as String
                    
                    if seperatedString != ""
                    {
                        seperatedString = dropFirst(seperatedString)
                        
                        var seperatedByAndArray: [String] = seperatedString.componentsSeparatedByString("&")
                        
                        if seperatedByAndArray.count == 2
                        {
                            for passedParameter in seperatedByAndArray
                            {
                                if passedParameter.hasPrefix("daddr=")
                                {
                                    var destinationString = dropFirstSixCharactersOfString(passedParameter)
                                    
                                    if destinationString == "nil"
                                    {
                                        destinationIsNil = true
                                        println("Destination field was left empty.")
                                    }
                                    else
                                    {
                                        destinationIsNil = false
                                        println("Destination is: '\(destinationString)'.")
                                    }
                                }
                                else
                                {
                                    if destinationIsNil != false
                                    {
                                        destinationIsNil = true
                                    }
                                }
                                
                                if passedParameter.hasPrefix("saddr=")
                                {
                                    var startingPointString = dropFirstSixCharactersOfString(passedParameter)
                                    
                                    if startingPointString == "nil"
                                    {
                                        startingPointIsNil = true
                                        println("Starting point field was left empty.")
                                    }
                                    else
                                    {
                                        startingPointIsNil = false
                                        println("Starting point is: '\(startingPointString)'.")
                                    }
                                }
                                else
                                {
                                    if startingPointIsNil != false
                                    {
                                        startingPointIsNil = true
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        println("This guy just wants to open Maps.")
                    }
                }
                
            }
            else
            {
                println("The URL host wasn't recognized.")
            }
        }
        else
        {
            println("The correct URL scheme wasn't triggered.")
        }
        
        return false
    }
    
    func dropFirstThreeCharactersOfString(dropString: String) -> String
    {
        var newDropString = dropFirst(dropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        
        return newDropString
    }
    
    func dropFirstFourCharactersOfString(dropString: String) -> String
    {
        var newDropString = dropFirst(dropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        
        return newDropString
    }
    
    func dropFirstFiveCharactersOfString(dropString: String) -> String
    {
        var newDropString = dropFirst(dropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        
        return newDropString
    }
    
    func dropFirstSixCharactersOfString(dropString: String) -> String
    {
        var newDropString = dropFirst(dropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        
        return newDropString
    }
    
    func dropFirstEightCharactersOfString(dropString: String) -> String
    {
        var newDropString = dropFirst(dropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        newDropString = dropFirst(newDropString)
        
        return newDropString
    }
    
    func throwTypeError()
    {
        var typeAlertView = UIAlertView()
        typeAlertView.title = "Improper Format"
        typeAlertView.message = "The format of the URL scheme was not valid.\n\n Please try again."
        typeAlertView.addButtonWithTitle("Dismiss")
        
        if typeAlertView.visible == false
        {
            typeAlertView.show()
        }
    }
}

