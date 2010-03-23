//
//  PreferenceDocumentController.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-22.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Preferences;

@interface PreferenceDocumentController : NSObject {

}

- (IBAction)openDocument:(id)sender;
- (Preferences*)createPreferencesFromURL: (NSURL *)url; 

@end
