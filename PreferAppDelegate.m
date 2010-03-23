//
//  PreferAppDelegate.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-18.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "PreferAppDelegate.h"
#import "Preferences.h"
#import "PreferenceDocumentController.h"

@implementation PreferAppDelegate
@synthesize window;
@synthesize view;
@synthesize documentController;

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {
	Preferences *preferences = [self.documentController createPreferencesFromURL: [NSURL fileURLWithPath: filename]];
	[preferences apply];
	[theApplication terminate: nil];
	return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	NSPasteboard *pboard = [sender draggingPasteboard];	
	if ([[pboard types] containsObject:NSFilenamesPboardType]) {
		NSArray *files = [pboard propertyListForType: @"com.consolidatedopcode.preferences"];
		int numberOfFiles = [files count];
		NSLog(@"Got %d files", numberOfFiles);
	}
	return YES;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {	
	[self.view registerForDraggedTypes: [NSArray arrayWithObjects: @"com.consolidatedopcode.preferences", nil]];	
}

@end
