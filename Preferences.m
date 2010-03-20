//
//  Preferences.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-20.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "Preferences.h"
#import "Domain.h"

@implementation Preferences
@synthesize domains;

- (id)initWithContentsOfFile: (NSString *)file {
	if (self = [super init]) {
		self.domains = [NSMutableArray array];
		NSDictionary *fileContents = [NSDictionary dictionaryWithContentsOfFile: file];
		for (NSString *domain in fileContents) {
			[domains addObject: [[Domain alloc] initWithDomain: domain andPreferences: [fileContents objectForKey: domain]]];
		}
	}
	return self;		
}

- (void)apply {
	for (Domain *domain in self.domains) {
		[domain apply];
	}
}
@end
