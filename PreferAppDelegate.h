//
//  PreferAppDelegate.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-18.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferenceDocumentController;

@interface PreferAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	NSView *view;	
	PreferenceDocumentController *documentController;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *view;
@property (assign) IBOutlet PreferenceDocumentController *documentController;
@end
