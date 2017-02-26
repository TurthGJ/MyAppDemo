//
//  MyAppDataBase.h
//  MyApp
//
//  Created by GJ on 16/9/18.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"
#import "News+CoreDataProperties.h"

#define TableName @"News"

@interface MyAppDataBase : NSObject

@property (nonatomic, strong, readonly)NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong, readonly)NSManagedObjectModel* managedObjectModel;
@property (nonatomic, strong, readonly)NSPersistentStoreCoordinator* persistentStoreCoordinator;

- (void)saveContext;
- (NSURL*)applicationDocumentsDirectory;
- (void)insetCoreData:(NSMutableArray*)dataArray;
- (NSMutableArray*)selectData:(int)pageSize andOffSet:(int)currentPage;
- (void)deleteData;
- (void)updataData:(NSString*)newId withIsLook:(NSString*)isLook;

@end
