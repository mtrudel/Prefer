//
//  Preferences.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-20.
//  Copyright 2010 University Health Network. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Preferences : NSObject {
	NSMutableArray *domains;
}
@property(nonatomic,retain) NSMutableArray *domains;

- (id)initWithContentsOfFile: (NSString *)file;
- (void)apply;
@end
