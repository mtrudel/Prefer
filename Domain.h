//
//  Domain.h
//  Prefer
//
//  Created by Mat Trudel on 10-03-19.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Domain : NSObject {
	NSString *domain;
	NSDictionary *preferences;
}
@property(nonatomic, retain) NSString *domain;
@property(nonatomic, retain) NSDictionary *preferences;

- (id)initWithDomain: (NSString *)aDomain andPreferences: (NSDictionary *)aDictionary;

- (BOOL)isValid;

- (void)apply;
@end
