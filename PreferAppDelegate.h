//
//  PreferAppDelegate.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-18.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow *window;
	NSView *view;	
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *view;
@end
