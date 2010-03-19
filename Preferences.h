//
//  Preferences.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-19.
//  Copyright 2010 University Health Network. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Preferences : NSObject {
	NSString *domain;
	NSDictionary *preferences;
}
@property(nonatomic, retain) NSString *domain;
@property(nonatomic, retain) NSDictionary *preferences;

- (id)initWithContentsOfFile: (NSString *)file;

- (BOOL)isValidDomain;

- (void)apply;
@end
