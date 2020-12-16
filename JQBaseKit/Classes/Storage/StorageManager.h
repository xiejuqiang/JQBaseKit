//
//  StorageManager.h
//  FastCreateProjectTools
//
//  Created by juqiangxie on 2018/10/15.
//  Copyright © 2018年 juqiangxie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StorageManager : NSObject

/***************增删改查*************/

/**
 数据库插入

 @param obj 插入对象
 */
+ (void)db_insert:(id)obj;


/**
 数据库批量插入

 @param array 批量数组
 */
+ (void)db_inserts:(NSArray *)array;


/**
 数据库查询

 @param model_class 查询模型类
 @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则查询所有)
 @param order 排序条件(排序语法和SQL order 查询语法一样，order为空则不排序)
 @param limit 限制条件(限制语法和SQL limit 查询语法一样，limit为空则不限制查询)
 @return 查询模型对象数组
 */
+ (NSArray *)db_query:(Class)model_class where:(NSString *)where order:(NSString *)order limit:(NSString *)limit;


/**
 更新本地数据模型

 @param model_object 模型对象
 @param where 更新条件查询
 @return 是否成功
 */
+ (BOOL)db_update:(id)model_object where:(NSString *)where;


/**
 删除本地模型对象

 @param model_class 模型类
 @param where 查询条件(查询语法和SQL where 查询语法一样，where为空则删除所有)
 @return 是否成功
 */
+ (BOOL)db_delete:(Class)model_class where:(NSString *)where;


/**
 清空所有本地数据库
 */
+ (void)db_removeAllModel;

/**
 清空指定模型数据库

 @param model_class 模型类
 */
+ (void)db_removeModel:(Class)model_class;

@end

NS_ASSUME_NONNULL_END
