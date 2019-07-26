//
//  SQLiteSingleton.h
//  baby
//
//  Created by Polery on 2019/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQLiteSingleton : NSObject

+ (SQLiteSingleton *)shareInstance;
- (BOOL)openDB;
- (void)closeDB;

+ (instancetype) alloc __attribute__((unavailable("call sharedInstance instead")));
+ (instancetype) new __attribute__((unavailable("call sharedInstance instead")));
- (instancetype) copy __attribute__((unavailable("call sharedInstance instead")));
- (instancetype) mutableCopy __attribute__((unavailable("call sharedInstance instead")));

- (NSArray *)queryLivingGuideList;
- (NSArray *)queryNutritiousFoodList;
- (BOOL)insertQuestionContent:(NSDictionary *)param;
- (BOOL)insertRecommendContent:(NSDictionary *)param;
- (BOOL)insertPictureContent:(NSDictionary *)param;
- (NSArray *)queryQuestionList;
- (NSArray *)queryRecommendList;

@end

NS_ASSUME_NONNULL_END
