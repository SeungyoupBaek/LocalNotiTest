//
//  ViewController.m
//  LocalNotiTest
//
//  Created by SDT-1 on 2014. 1. 20..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation ViewController
- (IBAction)notiNow:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.alertBody = @"노티테스트";
    noti.alertAction = @"확인";
    noti.userInfo = @{@"now": @"test"};
    // 알림창은 안나타나지만 AppDelegate의 메소드는 실행된다.
    [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
    // 백그라운드 실행중일때
    // 오디오를 재생 중에
    // 위치를 추적 중에
    // 백그라운드에서 데이터를 받는 경우
}
- (IBAction)fireNotiIn7:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc]init];
    noti.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
    noti.alertBody = @"7senconds";
    noti.alertAction = @"확인";
    noti.soundName = UILocalNotificationDefaultSoundName;
    
    noti.userInfo = nil;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
    
}

- (IBAction)fireNoti:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = self.datePicker.date;
    noti.alertBody = @"지정 시간 알림";
    noti.alertAction = @"확인";
    // 30초 이내의 사운드
    noti.soundName = UILocalNotificationDefaultSoundName;
    // 앱 구동시 잠깐 나타나는 런치 이미지
    //noti.alertLaunchImage = @"image.png";
    noti.userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"object", @"key", nil];
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
