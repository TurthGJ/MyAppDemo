//
//  NSObject+propertyList.m
//  WorldTimer
//
//  Created by DongCai on 5/27/14.
//  Copyright (c) 2014 ___DanielStudio___. All rights reserved.
//

#import "NSObject+propertyList.h"

#import <objc/runtime.h>

@implementation NSObject (propertyList)

-(NSArray *)getPropertyList{
    if ([self class] == [NSObject class]) {
        //        NSLog(@"递归到NSObject类了");
        return nil;
    }
    
    NSMutableArray *propertyList = [[NSMutableArray alloc] init];
    
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for(i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        
        NSString *eachPropertyName = [[NSString alloc] initWithUTF8String:property_getName(property)];
        
        [propertyList addObject:eachPropertyName];
        
    }
    
    free(properties);
    
    return [propertyList arrayByAddingObjectsFromArray:[[self superclass] getPropertyList]];
}

@end
