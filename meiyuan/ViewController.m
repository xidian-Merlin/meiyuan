//
//  ViewController.m
//  meiyuan
//
//  Created by tongho on 2017/3/23.
//  Copyright © 2017年 tongho. All rights reserved.
//

#import "ViewController.h"
#import "FirstActionModel.h"

#import <AVFoundation/AVFoundation.h>

#define FILENAME @"Tomcat.plist"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgsAnimation;
@property (nonatomic,strong) NSArray * imgsArr;
@property(nonatomic,strong) AVAudioPlayer * soundPlayer;


- (IBAction)touchAction:(UIButton *)sender;
enum btnType{
    KNOCKOff=1,
    STOMACH,
    LEFTFOOT,
    RIGHTFOOT,
    ANGRY,
    FART,
    CYMBAL,
    DRINK,
    EAT,
    PIE,
    SCRATCH,
    
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchAction:(UIButton *)sender {
    switch (sender.tag) {
        case KNOCKOff:
        {
            //            CCHtomCatModel * model = self.imgsArr[KNOCKOff-1];
            //
            //            [self loadAninmationWithName:model.name andCount:model.count];
            //            [self loadSoundsWithName:model.sound];
            //
           // [self didClickWithBtnId:KNOCKOff];
            NSLog(@"我被电击了");
            break;
        }
        case STOMACH:
            [self didClickWithBtnId:STOMACH];
            
            break;
        case LEFTFOOT:
            [self didClickWithBtnId:LEFTFOOT];
            
            break;
        case RIGHTFOOT:
            [self didClickWithBtnId:RIGHTFOOT];
            
            break;
        case ANGRY:
            //            [self loadAninmationWithName:@"angry" andCount:26];
            //
            //            [self loadSoundsWithName:@"angry"];
            [self didClickWithBtnId:ANGRY];
            
            break;
        case FART:
            [self didClickWithBtnId:FART];
            
            break;
        case CYMBAL:
            [self didClickWithBtnId:CYMBAL];
            
            break;
        case DRINK:
            //            [self didClickWithBtnId:DRINK];
        {
            FirstActionModel * model = self.imgsArr[DRINK-1];
            
            [self loadAninmationWithName:model.name andCount:model.count];
            [self performSelector:@selector(loadSoundsWithName:) withObject:@"pour_milk.m4a" afterDelay:1];
            
            [self performSelector:@selector(loadSoundsWithName:) withObject:model.sound afterDelay:3];
            
            //            [self loadSoundsWithName:model.sound];
            break;
        }
        case EAT:
            [self didClickWithBtnId:EAT];
            
            break;
        case PIE:
            [self didClickWithBtnId:PIE];
            
            break;
        case SCRATCH:
            //            [self didClickWithBtnId:SCRATCH];
        {
            FirstActionModel * model = self.imgsArr[SCRATCH-1];
            
            [self loadAninmationWithName:model.name andCount:model.count];
            
            [self performSelector:@selector(loadSoundsWithName:) withObject:model.sound afterDelay:2];
            
            //            [self loadSoundsWithName:model.sound];
            break;
        }
        default:
            break;
    }
    
}

//懒加载重写getter方法
-(NSArray *)imgsArr
{
    NSMutableArray * tempArr= [NSMutableArray array];
    if (_imgsArr==nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:FILENAME ofType:nil];
        NSArray * arrInPlist= [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary * dic in arrInPlist) {
            
            FirstActionModel * model = [[FirstActionModel alloc] initWithDictionary:dic];
            [tempArr addObject:model];
            
        }
        
        _imgsArr=tempArr;
    }
    //    NSLog(@"%@",_imgsArr);
    return _imgsArr;
}

#pragma mark - 加载动画
-(void) loadAninmationWithName:(NSString *) name andCount:(NSInteger ) count
{
    //    NSString * path = [NSBundle pathsForResourcesOfType:[NSString stringWithFormat:@"%@%ld",name,count] inDirectory:nil];
    NSMutableArray *tempImgMarr =[NSMutableArray array ];
    for (NSInteger i=0; i<count; i++) {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_%02ld.jpg",name,i] ofType:nil];
        UIImage * tempImg=[UIImage imageWithContentsOfFile:path];
        
        
        [tempImgMarr addObject:tempImg];
        
    }
    //设置动画属性
    self.imgsAnimation.animationImages=tempImgMarr;
    self.imgsAnimation.animationDuration=count*0.08;
    self.imgsAnimation.animationRepeatCount=1;
    
    [self.imgsAnimation startAnimating];
    
    //释放内存
    [self.imgsAnimation performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:count*0.08];
    
    
}
#pragma mark  加载声音
-(void) loadSoundsWithName:(NSString *) name
{
    NSString * path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",name] ofType:nil];
    NSURL * url= [NSURL fileURLWithPath:path];
    self.soundPlayer= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.soundPlayer play];
}

-(void) didClickWithBtnId:(NSInteger) btnId
{
    FirstActionModel * model = self.imgsArr[btnId-1];
    
    [self loadAninmationWithName:model.name andCount:model.count];
    [self loadSoundsWithName:model.sound];
}
@end
