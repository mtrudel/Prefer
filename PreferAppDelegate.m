//
//  PreferAppDelegate.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-18.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "PreferAppDelegate.h"

@implementation PreferAppDelegate

@synthesize window;

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {
	NSString *domainName = [[[filename lastPathComponent] stringByDeletingPathExtension] stringByDeletingPathExtension];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

	if ([[defaults persistentDomainNames] containsObject: domainName]) {
		// Read in the existing prefs so we don't clobber them
		NSMutableDictionary *values = [[defaults persistentDomainForName: domainName] mutableCopy];
		[values addEntriesFromDictionary: [NSDictionary dictionaryWithContentsOfFile: filename]];
		[defaults setPersistentDomain: values forName: domainName];		
		[defaults synchronize];
		[theApplication terminate: nil];
	} else {
		// TODO -- put up a warning
		
	}
	return YES;
}


@end
