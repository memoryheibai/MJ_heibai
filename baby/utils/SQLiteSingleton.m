//
//  SQLiteSingleton.m
//  baby
//
//  Created by Polery on 2019/7/15.
//

#import "SQLiteSingleton.h"

#import <sqlite3.h>

@implementation SQLiteSingleton

{
    sqlite3 *_sqlite;
}

+ (SQLiteSingleton *)shareInstance{
    static SQLiteSingleton * s_instance_sqlite_singleton = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_instance_sqlite_singleton == nil) {
            s_instance_sqlite_singleton = [super allocWithZone:NULL] ;
        }
    });
    return (SQLiteSingleton *)s_instance_sqlite_singleton;
}

// 重写创建对象空间的方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    // 直接调用单例的创建方法
    return [self shareInstance];
}

/*创建数据库
 *
 */
- (BOOL)openDB {
    BOOL flag;
    NSError *error;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"babycome.sqlite"];
    [fm  removeItemAtPath:writableDBPath error:&error];
    flag = [fm fileExistsAtPath:writableDBPath];
    if(!flag) {
        NSString *defaultDBPath = [[[NSBundle mainBundle]bundlePath]stringByAppendingPathComponent:@"babycome.sqlite"];
        flag = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        flag = YES;
    }
    if (flag) {
        if(sqlite3_open([writableDBPath UTF8String], &_sqlite) == SQLITE_OK) {
            flag = YES;
        }  else  {
            flag = NO;
        }
    }
    return  flag;
}

/*关闭数据库
 *
 */
-(void)closeDB {
    sqlite3_close(_sqlite);
}


//生活指南列表sql

- (NSArray *)queryLivingGuideList {
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sqlStr= @"select lgq.question,lgq.sub_title,lgq.article,lgq.website,lga.answer_content,lga.advantage,lga.disadvantage,lga.precautions,lga.notices from living_guide_question lgq left join (select question_id,answer_content,advantage,disadvantage,precautions,notices from living_guide_answer) lga on lga.question_id=lgq.id";
    char *sql1 = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql1, -1, &stmt, nil) == SQLITE_OK) {
        while(SQLITE_ROW == sqlite3_step(stmt)) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            
            char *column1 = (char*)sqlite3_column_text(stmt, 1);
            if (column1) {
                [dictionary setObject:[NSString stringWithCString:column1 encoding:NSUTF8StringEncoding] forKey:@"question"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"question"];
            }
            
            char *column2 = (char*)sqlite3_column_text(stmt, 2);
            if (column2) {
                [dictionary setObject:[NSString stringWithCString:column2 encoding:NSUTF8StringEncoding] forKey:@"sub_title"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"sub_title"];
            }
            
            char *column3 = (char*)sqlite3_column_text(stmt, 3);
            if (column3) {
                [dictionary setObject:[NSString stringWithCString:column3 encoding:NSUTF8StringEncoding] forKey:@"article"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"article"];
            }
            
            char *column4 = (char*)sqlite3_column_text(stmt, 4);
            if (column4) {
                [dictionary setObject:[NSString stringWithCString:column4 encoding:NSUTF8StringEncoding] forKey:@"website"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"website"];
            }
            
            char *column5 = (char*)sqlite3_column_text(stmt, 5);
            if (column5) {
                [dictionary setObject:[NSString stringWithCString:column5 encoding:NSUTF8StringEncoding] forKey:@"answer_content"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"answer_content"];
            }
            
            char *column6 = (char*)sqlite3_column_text(stmt, 6);
            if (column6) {
                [dictionary setObject:[NSString stringWithCString:column6 encoding:NSUTF8StringEncoding] forKey:@"advantage"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"advantage"];
            }
            
            char *column7 = (char*)sqlite3_column_text(stmt, 7);
            if (column7) {
                [dictionary setObject:[NSString stringWithCString:column7 encoding:NSUTF8StringEncoding] forKey:@"advantage"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"advantage"];
            }
            
            char *column8 = (char*)sqlite3_column_text(stmt, 8);
            if (column8) {
                [dictionary setObject:[NSString stringWithCString:column8 encoding:NSUTF8StringEncoding] forKey:@"precautions"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"precautions"];
            }
            
            char *column9 = (char*)sqlite3_column_text(stmt, 9);
            if (column9) {
                [dictionary setObject:[NSString stringWithCString:column9 encoding:NSUTF8StringEncoding] forKey:@"notices"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"notices"];
            }
            
            [arr addObject:dictionary];
        }
        NSLog(@"%@",arr);
        sqlite3_finalize(stmt);
    }
    return  arr;
}




//营养饮食列表sql

- (NSArray *)queryNutritiousFoodList {
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sqlStr= @"select nfq.title as title,nfq.sub_title as sub_title,nfq.content as content,nfn.question as question,nfn.content as question_content from nutritious_food_question nfq left join (select * from nutritious_food_notice) nfn on nfn.question_id = nfq.id";
    char *sql1 = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql1, -1, &stmt, nil) == SQLITE_OK) {
        while(SQLITE_ROW == sqlite3_step(stmt)) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            char *column1 = (char*)sqlite3_column_text(stmt, 1);
            if (column1) {
                [dictionary setObject:[NSString stringWithCString:column1 encoding:NSUTF8StringEncoding] forKey:@"title"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"title"];
            }
            
            char *column2 = (char*)sqlite3_column_text(stmt, 2);
            if (column2) {
                [dictionary setObject:[NSString stringWithCString:column2 encoding:NSUTF8StringEncoding] forKey:@"sub_title"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"sub_title"];
            }
            
            char *column3 = (char*)sqlite3_column_text(stmt, 3);
            if (column3) {
                [dictionary setObject:[NSString stringWithCString:column3 encoding:NSUTF8StringEncoding] forKey:@"content"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"content"];
            }
            
            char *column4 = (char*)sqlite3_column_text(stmt, 4);
            if (column4) {
                [dictionary setObject:[NSString stringWithCString:column4 encoding:NSUTF8StringEncoding] forKey:@"question"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"question"];
            }
            
            char *column5 = (char*)sqlite3_column_text(stmt, 5);
            if (column5) {
                [dictionary setObject:[NSString stringWithCString:column5 encoding:NSUTF8StringEncoding] forKey:@"question_content"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"question_content"];
            }
            
            [arr addObject:dictionary];
        }
        NSLog(@"%@",arr);
        sqlite3_finalize(stmt);
    }
    return  arr;
}

//添加提问

- (BOOL)insertQuestionContent:(NSDictionary *)param {
    NSString *sqlStr = @"insert into question (question,user_name,publish_time,status) values(?,?,?,?)";
    char *sql = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [[param objectForKey:@"question"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [[param objectForKey:@"user_name"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [[param objectForKey:@"publish_time"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [[param objectForKey:@"status"] UTF8String], -1, NULL);
    } else {
        return  NO;
    }
    if(SQLITE_DONE == sqlite3_step(stmt)) {
        sqlite3_finalize(stmt);
        return YES;
    } else {
        return NO;
    }
}


//添加推荐

- (BOOL)insertRecommendContent:(NSDictionary *)param {
    NSString *sqlStr = @"insert into recommend (title,question,pictures_flag,user_name,publish_time) values(?,?,?,?,?)";
    char *sql = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [[param objectForKey:@"title"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [[param objectForKey:@"question"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [[param objectForKey:@"pictures_flag"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [[param objectForKey:@"user_name"] UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [[param objectForKey:@"publish_time"] UTF8String], -1, NULL);
    } else {
        return  NO;
    }
    if(SQLITE_DONE == sqlite3_step(stmt)) {
        //读取刚刚插入的数据的行id
        long long newid =sqlite3_last_insert_rowid(_sqlite);
        sqlite3_finalize(stmt);
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)insertPictureContent:(NSDictionary *)param {
    NSString *sqlStr = @"insert into picture (recommend_id,pictures) values(?,?)";
    char *sql = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [[param objectForKey:@"recommend_id"] UTF8String], -1, NULL);
        sqlite3_bind_blob(stmt, 2, [[param objectForKey:@"picture"] bytes], [[param objectForKey:@"picture"] length], NULL);
    } else {
        return  NO;
    }
    if(SQLITE_DONE == sqlite3_step(stmt)) {
        sqlite3_finalize(stmt);
        return YES;
    } else {
        return NO;
    }
}

//提问列表sql
- (NSArray *)queryQuestionList {
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sqlStr= @"select q.question,q.user_name,q.publish_time,q.status from question q";
    char *sql1 = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql1, -1, &stmt, nil) == SQLITE_OK) {
        while(SQLITE_ROW == sqlite3_step(stmt)) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            
            char *column1 = (char*)sqlite3_column_text(stmt, 1);
            if (column1) {
                [dictionary setObject:[NSString stringWithCString:column1 encoding:NSUTF8StringEncoding] forKey:@"question"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"question"];
            }
            
            char *column2 = (char*)sqlite3_column_text(stmt, 2);
            if (column2) {
                [dictionary setObject:[NSString stringWithCString:column2 encoding:NSUTF8StringEncoding] forKey:@"user_name"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"user_name"];
            }
            
            char *column3 = (char*)sqlite3_column_text(stmt, 3);
            if (column3) {
                [dictionary setObject:[NSString stringWithCString:column3 encoding:NSUTF8StringEncoding] forKey:@"publish_time"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"publish_time"];
            }
            
            char *column4 = (char*)sqlite3_column_text(stmt, 4);
            if (column4) {
                [dictionary setObject:[NSString stringWithCString:column4 encoding:NSUTF8StringEncoding] forKey:@"status"];
            } else {
                [dictionary setObject:[NSNull null] forKey:@"status"];
            }
            
            [arr addObject:dictionary];
        }
        NSLog(@"%@",arr);
        sqlite3_finalize(stmt);
    }
    return  arr;
}

//推荐列表sql
- (NSArray *)queryRecommendList {
    NSMutableArray *arr = [NSMutableArray array];
    NSString *sqlStr= @"select r.title,r.question,r.pictures_flag,r.user_name,r.publish_time from recommend r";
    char *sql1 = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql1, -1, &stmt, nil) == SQLITE_OK) {
        while(SQLITE_ROW == sqlite3_step(stmt)) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            
            char *column1 = (char*)sqlite3_column_text(stmt, 1);
            if (column1) {
                [dictionary setObject:[NSString stringWithCString:column1 encoding:NSUTF8StringEncoding] forKey:@"title"];
            } else {
                [dictionary setObject:@"null" forKey:@"title"];
            }
            
            char *column2 = (char*)sqlite3_column_text(stmt, 2);
            if (column2) {
                [dictionary setObject:[NSString stringWithCString:column2 encoding:NSUTF8StringEncoding] forKey:@"question"];
            } else {
                [dictionary setObject:@"null" forKey:@"question"];
            }
            
            char *column3 = (char*)sqlite3_column_text(stmt, 3);
            if (column3) {
                [dictionary setObject:[NSString stringWithCString:column3 encoding:NSUTF8StringEncoding] forKey:@"pictures_flag"];
            } else {
                [dictionary setObject:@"null" forKey:@"pictures_flag"];
            }
            
            char *column4 = (char*)sqlite3_column_text(stmt, 4);
            if (column4) {
                [dictionary setObject:[NSString stringWithCString:column4 encoding:NSUTF8StringEncoding] forKey:@"user_name"];
            } else {
                [dictionary setObject:@"null" forKey:@"user_name"];
            }
            
            char *column5 = (char*)sqlite3_column_text(stmt, 5);
            if (column5) {
                [dictionary setObject:[NSString stringWithCString:column5 encoding:NSUTF8StringEncoding] forKey:@"publish_time"];
            } else {
                [dictionary setObject:@"null" forKey:@"publish_time"];
            }
            
            [arr addObject:dictionary];
        }
        NSLog(@"%@",arr);
        sqlite3_finalize(stmt);
    }
    return  arr;
}


//图片sql
- (NSMutableArray *)queryPictureWithRecommendId:(NSString *)recommend_id {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    //修改表名,条件字段名
    NSString *sqlStr = @"select p.picture from pictures p where p.recommend_id = ?";
    char *sql1 = [sqlStr UTF8String];
    sqlite3_stmt *stmt;
    if(sqlite3_prepare_v2(_sqlite, sql1, -1, &stmt, nil) == SQLITE_OK) {
        sqlite3_bind_text(stmt, 1, [recommend_id UTF8String], -1, NULL);
        while(SQLITE_ROW == sqlite3_step(stmt)) {
            NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
            int bytes = sqlite3_column_bytes(stmt, 1);
            const void *value = sqlite3_column_blob(stmt, 1);
            if( value != NULL && bytes != 0 ) {
                NSData *data = [NSData dataWithBytes:value length:bytes];
                [arr addObject:data];
            }
        }
        sqlite3_finalize(stmt);
    }
    return  arr;
}



@end

