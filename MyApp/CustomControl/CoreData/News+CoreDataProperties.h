//
//  News+CoreDataProperties.h
//  
//
//  Created by GJ on 16/9/18.
//
//

#import "News+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSObject *ads;

@end

NS_ASSUME_NONNULL_END
