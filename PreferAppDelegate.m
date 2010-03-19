//
//  PreferAppDelegate.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-18.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "PreferAppDelegate.h"
#import "Preferences.h"

@implementation PreferAppDelegate
@synthesize window;

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {

	Preferences *preference = [[Preferences alloc] initWithContentsOfFile: filename];
	if ([preference isValidDomain]) {
		[preference apply];
	} else {
		NSAlert *alert = [[NSAlert alloc] init];
		[alert addButtonWithTitle:@"OK"];
		[alert setMessageText:@"Can't determine what domain to set"];
		[alert setInformativeText:@"Can't determin what domain to set."];
		[alert setAlertStyle:NSWarningAlertStyle];
		[alert runModal];
		[alert release];	
	}
	[theApplication terminate: nil];
	return YES;
}


@end
