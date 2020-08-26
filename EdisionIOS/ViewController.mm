//
//  ViewController.m
//  EdisionIOS
//
//  Created by Gofran on 2020/8/26.
//  Copyright © 2020 Gofran. All rights reserved.
//

#import "ViewController.h"
#import "IDevice.h"
#import "IEdisionCore.h"

@interface ViewController ()

@end

@implementation ViewController

using namespace edision;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    IEdisionCore ec;
    ec.InitLogger(LOG_TRACE, true);
    
    std::shared_ptr<IInputDevice> videoRecorder(IInputDevice::createNew(DEVICE_CAMERA));
//      videoRecorder->setDataSink(fileSink);
      
    std::shared_ptr<YUVFormat> recordYuvForat(new YUVFormat(AV_PIX_FMT_NV12, 1280, 720));
    recordYuvForat->_mFrameRate = 60;
    videoRecorder->setFormat(recordYuvForat);
      
    videoRecorder->init("0", "avfoundation");
      
    for (int i = 0; i < 500; i++)
        videoRecorder->readData();
}


@end
