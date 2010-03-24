//
//  DraggableView.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-23.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "DraggableView.h"
#import "PreferenceDocumentController.h"
#import "Preferences.h"

@implementation DraggableView
@synthesize documentController;

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
			[self registerForDraggedTypes: [NSArray arrayWithObjects: @"com.consolidatedopcode.preferences", nil]];	
		}
    return self;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	NSPasteboard *pboard = [sender draggingPasteboard];	
	if ([[pboard types] containsObject:NSFilenamesPboardType]) {
		NSArray *files = [pboard propertyListForType: NSFilenamesPboardType];
		for (NSString *filename in files) {
			Preferences *preferences = [self.documentController createPreferencesFromURL: [NSURL fileURLWithPath: filename]];
			[preferences apply];
		}
	}
	return YES;
}

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >)sender {
	return NSDragOperationCopy;
}

@end
