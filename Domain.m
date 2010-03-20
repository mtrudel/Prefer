//
//  Domain.m
//  Prefer
//
//  Created by Mat Trudel on 10-03-19.
//  Copyright 2010 University Health Network. All rights reserved.
//

#import "Domain.h"


@implementation Domain
@synthesize domain;
@synthesize preferences;

- (id)initWithContentsOfFile: (NSString *)file {
	if (self = [super init]) {
		NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile: file];
		if ([dictionary count] != 1) {
			[NSException raise: @"NonUnaryPreferenceFileException" format: @"Can't init a Preference from a preference file with multiple bundles"];
		}
		self.domain = [[dictionary allKeys] lastObject];
		self.preferences = [dictionary valueForKey: self.domain];
	}
	return self;
}

- (BOOL)isValidDomain {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return [[defaults persistentDomainNames] containsObject: self.domain];
}

- (void)apply {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

	// Read in the existing prefs so we don't clobber them
	NSMutableDictionary *values = [[defaults persistentDomainForName: self.domain] mutableCopy];
	[values addEntriesFromDictionary: self.preferences];
	[defaults setPersistentDomain: values forName: self.domain];
	[defaults synchronize];
	[values release];	
}

- (NSString *)description {
	return [NSString stringWithFormat: @"%@:\n%@", self.domain, self.preferences];
}
@end
