//
//  PreferenceDocumentController.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-22.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "PreferenceDocumentController.h"
#import "Preferences.h"

@implementation PreferenceDocumentController

- (IBAction)openDocument:(id)sender {
	NSOpenPanel *open = [NSOpenPanel openPanel];
	open.canChooseDirectories = NO;
	open.allowedFileTypes = [NSArray arrayWithObjects: @"preference", @"preferences", nil];	
	[open runModal];
	for (NSURL *url in [open URLs]) {
		[self createPreferencesFromURL: url];
	}	
}

- (Preferences *)createPreferencesFromURL: (NSURL *)url {
	return [[[Preferences alloc] initWithContentsOfURL: url] autorelease];
}

@end
