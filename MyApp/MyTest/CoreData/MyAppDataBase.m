//
//  MyAppDataBase.m
//  MyApp
//
//  Created by GJ on 16/9/18.
//  Copyright © 2016年 GJ. All rights reserved.
//

#import "MyAppDataBase.h"
#import "News+CoreDataClass.h"

@interface MyAppDataBase()

@end

@implementation MyAppDataBase

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSManagedObjectContext*)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel*)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL* modelUrl = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelUrl];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator*)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL* storeURL = [[self applicationDocumentsDirectory]URLByAppendingPathComponent:@"Model.sqlite"];
    NSError* error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:_managedObjectModel];
    if ([_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@,%@",error,[error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (void)saveContext
{
    NSError* error = nil;
    NSManagedObjectContext* managedObjectContext = _managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@,%@",error,[error userInfo]);
            abort();
        }
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}

- (void)insetCoreData:(NSMutableArray *)dataArray
{
    NSManagedObjectContext* managedObjectContext = _managedObjectContext;
    for (News * info in dataArray) {
        News* newInfo = [NSEntityDescription insertNewObjectForEntityForName:TableName inManagedObjectContext:managedObjectContext];
        newInfo.ads = info.ads;
        NSError* error;
        if (![managedObjectContext save:&error]) {
            NSLog(@"不能保存 %@",error.localizedDescription);
        }
    }
}

- (NSMutableArray *)selectData:(int)pageSize andOffSet:(int)currentPage
{
    NSManagedObjectContext* context = _managedObjectContext;
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc]init];
    [fetchRequest setFetchLimit:pageSize];
    [fetchRequest setFetchOffset:currentPage];
    NSEntityDescription* entity = [NSEntityDescription entityForName:TableName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError* error = nil;
    NSArray* fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableArray* resultArray = [NSMutableArray array];
    for(News* info in fetchedObjects)
    {
        [resultArray addObject:info];
    }
    return resultArray;
}

- (void)updataData:(NSString *)newId withIsLook:(NSString *)isLook
{
    NSManagedObjectContext* context = _managedObjectContext;
    NSEntityDescription* entity = [NSEntityDescription entityForName:TableName inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    
}

- (void)deleteData
{
    NSManagedObjectContext* context = _managedObjectContext;
    NSEntityDescription* entity = [NSEntityDescription entityForName:TableName inManagedObjectContext:context];
    NSFetchRequest* request = [[NSFetchRequest alloc]init];
    [request setIncludesPropertyValues:NO];
    [request setEntity:entity];
    NSError* error = nil;
    NSArray* datas = [context executeFetchRequest:request error:&error];
    if (!error&&datas&&[datas count]) {
        for(NSManagedObject* obj in datas)
        {
            [context deleteObject:obj];
        }
        if (![context save:&error]) {
            NSLog(@"error %@",error);
        }
        
    }
}


@end
