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

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {

	NSLog(@"%@", preference);
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
