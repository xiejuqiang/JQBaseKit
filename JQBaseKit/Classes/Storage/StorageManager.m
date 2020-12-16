//
//  StorageManager.m
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import "StorageManager.h"
#import <WHC_ModelSqliteKit/WHC_ModelSqlite.h>

@implementation StorageManager


+ (void)db_insert:(id)obj{
    [WHCSqlite insert:obj];
}

+ (void)db_inserts:(NSArray *)array{
    [WHCSqlite inserts:array];
}

+ (NSArray *)db_query:(Class)model_class where:(NSString *)where order:(NSString *)order limit:(NSString *)limit{
   return [WHCSqlite query:model_class where:where order:order limit:limit];
}

+ (BOOL)db_update:(id)model_object where:(NSString *)where{
    return [WHCSqlite update:model_object where:where];
}

+ (BOOL)db_delete:(Class)model_class where:(NSString *)where{
    return [WHCSqlite delete:model_class where:where];
}

+ (void)db_removeAllModel{
    [WHCSqlite removeAllModel];
}

+ (void)db_removeModel:(Class)model_class{
    [WHCSqlite removeModel:model_class];
}

@end
