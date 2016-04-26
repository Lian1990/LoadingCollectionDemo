//
//  WaterWaveVC.m
//  LoadingCollectionDemo
//
//  Created by LIAN on 16/4/21.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import "WaterWaveVC.h"

@implementation WaterWaveVC

@synthesize webShow = _webShow;
@synthesize waveShow = _waveShow;
@synthesize writeHandle = _writeHandle;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor  whiteColor];
    }
    return self;
}
-(void)viewDidLoad
{
    [self loadData];
    [self waterWaveShow];
//    [self webLoad];
    
}
-(void)webLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.jianshu.com/p/2810c0a508d2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _webShow = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _webShow.delegate = self;
    [_webShow loadRequest:request];
    [self.view addSubview:_webShow];
}
-(void)waterWaveShow
{
    _waveShow = [[WaterView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _waveShow.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    _waveShow.value = 0.2;
    [self.view addSubview:_waveShow];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    if (!_waveShow) {
        _waveShow = [[WaterView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        _waveShow.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        _waveShow.value = 0.5;
        [self.view addSubview:_waveShow];
    }    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_waveShow) {
        [_waveShow removeFromSuperview];
    }
}
/**
 *  做一个比较明显的波动图
 */
-(void)loadData
{
    NSURL *url = [NSURL URLWithString:@"https://github.com/facebook/pop/archive/master.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark- NSURLConnectionDataDelegate代理
//=== 是否连接上
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSString *caches=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath=[caches stringByAppendingPathComponent:@"github.zip"];
    //创建一个空的文件,到沙盒中
    NSFileManager *fm=[NSFileManager defaultManager];
    //刚创建完毕的大小是o字节

     [fm createFileAtPath:filePath contents:nil attributes:nil];
    _writeHandle=[NSFileHandle fileHandleForWritingAtPath:filePath];
    
   //获取完整的文件的长度
    self.sumLength=response.expectedContentLength;
    
    NSLog(@"address is %@",filePath);
    
}
//======  连接上接收数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.currentLength+=data.length;

    float progress=(float)self.currentLength/self.sumLength;
    _waveShow.value = progress;

    //把data写入到创建的空文件中，但是不能使用writeTofile(会覆盖)
    //移动到文件的尾部
    [self.writeHandle seekToEndOfFile];
     //从当前移动的位置，写入数据
    [_writeHandle writeData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.writeHandle closeFile];
    self.writeHandle=nil;
// 加载完成 释放
    self.currentLength=0;
    self.sumLength=0;
    [_waveShow removeFromSuperview];
}

@end
