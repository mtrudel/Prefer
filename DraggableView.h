//
//  DraggableView.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-23.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PreferenceDocumentController;

@interface DraggableView : NSImageView {
	PreferenceDocumentController *documentController;
}

@property (assign) IBOutlet PreferenceDocumentController *documentController;
@end
