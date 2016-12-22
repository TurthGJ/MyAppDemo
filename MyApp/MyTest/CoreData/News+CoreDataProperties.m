//
//  News+CoreDataProperties.m
//  
//
//  Created by GJ on 16/9/18.
//
//

#import "News+CoreDataProperties.h"

@implementation News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"News"];
}

@dynamic ads;

@end
