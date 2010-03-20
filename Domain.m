//
//  Domain.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-19.
//  Copyright 2010 Con-Op. All rights reserved.
//

#import "Domain.h"


@implementation Domain
@synthesize domain;
@synthesize preferences;

- (id)initWithDomain: (NSString *)aDomain andPreferences: (NSDictionary *)aDictionary {
	if (self = [super init]) {
		self.domain = aDomain;
		self.preferences = aDictionary;
	}
	return self;
}

- (BOOL)isValid {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return [[defaults persistentDomainNames] containsObject: self.domain];
}

- (void)apply {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

	// Read in the existing prefs so we don't clobber them
	NSMutableDictionary *values = [[defaults persistentDomainForName: self.domain] mutableCopy];
	if (!values) {
		values = [[NSMutableDictionary alloc] init];
	}
	[values addEntriesFromDictionary: self.preferences];
	[defaults setPersistentDomain: values forName: self.domain];
	[defaults synchronize];
	[values release];	
}

- (NSString *)description {
	return [NSString stringWithFormat: @"%@:\n%@", self.domain, self.preferences];
}
@end
