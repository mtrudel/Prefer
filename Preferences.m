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

- (id)initWithContentsOfURL: (NSURL *)url {
	if (self = [super init]) {
		self.domains = [NSMutableArray array];
		NSDictionary *fileContents = [NSDictionary dictionaryWithContentsOfURL: url];
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

- (NSString *)description {
	return [NSString stringWithFormat: @"Preferences:\n%@", self.domains];
}

@end
