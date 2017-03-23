//
//  FirstActionModel.h
//  meiyuan
//
//  Created by tongho on 2017/3/23.
//  Copyright © 2017年 tongho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstActionModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString * sound;

-(instancetype) initWithDictionary:(NSDictionary *) dic;
+(instancetype) firstActionWithDictionary:(NSDictionary *) dic;

@end
