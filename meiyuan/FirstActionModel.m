//
//  FirstActionModel.m
//  meiyuan
//
//  Created by tongho on 2017/3/23.
//  Copyright © 2017年 tongho. All rights reserved.
//

#import "FirstActionModel.h"

@implementation FirstActionModel

-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    if(self = [super init]){
        self.name = dic[@"image"];
        self.count = [dic[@"frames"] integerValue];
        self.sound = dic[@"soundFiles"][0];
    }
    return self;
}

+(instancetype) firstActionWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}
@end
