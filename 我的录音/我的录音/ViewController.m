//
//  ViewController.m
//  我的录音
//
//  Created by 黄志伟 on 16/6/1.
//  Copyright © 2016年 黄志伟. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
/** 录音对象 */
@property (nonatomic,strong) AVAudioRecorder *recorder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)start {
    // 开始录音
    [self.recorder record];
    NSLog(@"--------------");
    
}
- (IBAction)stop {
    // 结束录音
    [self.recorder stop];
}

#pragma mark - 懒加载代码
- (AVAudioRecorder *)recorder
{
    if (_recorder == nil) {
        // 1.获取沙盒路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        // 2.拼接文件名
        NSString *filePth = [path stringByAppendingPathComponent:@"huangyu.caf"];
        
        // 3.转成URL,file://
        NSURL *url = [NSURL fileURLWithPath:filePth];
        
        // 4.配置音频参数
        NSDictionary *settingRecorder = @{
                                          AVEncoderAudioQualityKey : [NSNumber numberWithInteger:AVAudioQualityLow],
                                          AVEncoderBitRateKey : [NSNumber numberWithInteger:16],
                                          AVSampleRateKey : [NSNumber numberWithFloat:8000],
                                          AVNumberOfChannelsKey : [NSNumber numberWithInteger:2]
                                          };
        
        // 5.创建录音对象
        self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settingRecorder error:nil];
        
    }
    return _recorder;
}

@end
